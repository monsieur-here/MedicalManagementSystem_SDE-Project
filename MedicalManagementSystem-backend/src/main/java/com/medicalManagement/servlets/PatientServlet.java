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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        try {
            List<Patient> patients = patientDAO.getAllPatients();
            out.print("[");
            for (int i = 0; i < patients.size(); i++) {
                Patient p = patients.get(i);
                out.print(String.format("{\"id\":%d,\"firstName\":\"%s\",\"lastName\":\"%s\",\"email\":\"%s\"}",
                        p.getPatientId(), p.getFirstName(), p.getLastName(), p.getEmail()));
                if (i < patients.size() - 1) out.print(",");
            }
            out.print("]");
        } catch (Exception e) {
            response.setStatus(500);
            out.print("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Patient p = new Patient();
        p.setFirstName(request.getParameter("firstName"));
        p.setLastName(request.getParameter("lastName"));
        p.setEmail(request.getParameter("email"));
        p.setPasswordHash(request.getParameter("password")); // Hashing should be done here

        try {
            boolean inserted = patientDAO.insertPatient(p);
            response.getWriter().print(inserted ? "Patient Added" : "Failed");
        } catch (SQLException e) {
            response.setStatus(500);
            response.getWriter().print("Error: " + e.getMessage());
        }
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Implement update logic here with JSON parsing or URL parameters
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            boolean deleted = patientDAO.deletePatient(id);
            response.getWriter().print(deleted ? "Deleted" : "Failed to delete");
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
