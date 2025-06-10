package com.medicalManagement.servlets;

import com.medicalManagement.dao.PatientDAO;
import com.medicalManagement.model.Patient;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/patients")
public class PatientServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
	private Connection conn;
    private PatientDAO patientDAO;

    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doctor_management", "root", "admin");
            patientDAO = new PatientDAO(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        
        response.setHeader("Access-Control-Allow-Origin", "http://localhost:5173/patient");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        
        PrintWriter out = response.getWriter();
//        try {
//            List<Patient> patients = patientDAO.getAllPatients();
//            out.print("[");
//            for (int i = 0; i < patients.size(); i++) {
//                Patient p = patients.get(i);
//                out.print(String.format("{\"id\":%d,\"Name\":\"%s\",\"email\":\"%s\"}",
//                        p.getId(), p.getFullName(), p.getEmail()));
//                if (i < patients.size() - 1) out.print(",");
//            }
//            out.print("]");
//        } catch (Exception e) {
//            response.setStatus(500);
//            out.print("{\"error\":\"" + e.getMessage() + "\"}");
//        }
        
        
        try {
            List<Patient> patients = patientDAO.getAllPatients();

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Patient List</title>");
            out.println("<style>");
            out.println("table { border-collapse: collapse; width: 80%; margin: 20px auto; }");
            out.println("th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }");
            out.println("th { background-color: #f2f2f2; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2 style='text-align:center;'>Patient List</h2>");
            out.println("<table>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th></tr>");

            for (Patient p : patients) {
                out.println("<tr>");
                out.println("<td>" + p.getId() + "</td>");
                out.println("<td>" + p.getFullName() + "</td>");
                out.println("<td>" + p.getEmail() + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            response.setStatus(500);
            out.print("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain");
    	response.setHeader("Access-Control-Allow-Origin", "http://localhost:5173/patient");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    	
        String name = request.getParameter("name");
        String email = request.getParameter("email_id");
        String password = request.getParameter("password");
        
        if (name == null || email == null || password == null) {
            response.setStatus(400);
            response.getWriter().write("Missing fields");
            return;
        }

        Patient patient = new Patient();
        patient.setFullName(name);
        patient.setEmail(email);
        patient.setPassword(password); // Consider hashing!

        try {
            boolean success = patientDAO.insertPatient(patient);
            response.getWriter().write(success ? "Patient added successfully" : "Failed to add patient");
        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    protected void doPut(HttpServletRequest req, HttpServletResponse res) throws IOException {
        // Implement update logic here with JSON parsing or URL parameters
    	
    	res.setHeader("Access-Control-Allow-Origin", "http://localhost:5173/patient");
        res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        res.setHeader("Access-Control-Allow-Headers", "Content-Type");
    	
    	int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String gender = req.getParameter("gender");

        boolean updated = false;
		try {
			updated = patientDAO.updatePatient(new Patient());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        res.setContentType("text/plain");
        res.getWriter().print(updated ? "Patient updated successfully" : "Update failed");
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
    	response.setHeader("Access-Control-Allow-Origin", "http://localhost:5173/patient");
        response.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    	
    	int id = Integer.parseInt(request.getParameter("id"));
        try {
            response.getWriter().print(patientDAO.deletePatient(id) ? "Deleted" : "Failed to delete");
        } catch (SQLException e) {
            response.setStatus(500);
            response.getWriter().print("Error: " + e.getMessage());
        }
    }

    public void destroy() {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
