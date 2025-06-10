package com.medicalManagement.servlets;

import com.medicalManagement.dao.StaffDAO;

import com.medicalManagement.model.StaffSupport;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/staffSupport")
public class StaffSupportServlet extends HttpServlet {
	Connection conn;
    private StaffDAO dao = new StaffDAO();

    public void init(Connection conn) {
        this.conn = conn;
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        try {
            List<StaffSupport> list = dao.getAllStaff();
            out.println("<html><head><title>Staff List</title></head><body>");
            out.println("<h2>Staff List</h2>");
            out.println("<table border='1' cellpadding='5'>");
            out.println("<tr><th>ID</th><th>Name</th><th>Age</th><th>Gender</th></tr>");

            for (StaffSupport sst :list) {
//            	p.getAge(),
                out.printf("<tr><td>%d</td><td>%s</td><td>%s</td></tr>",
                           sst.getId(), sst.getFullName(), sst.getGender());
            }

            out.println("</table>");
            out.println("</body></html>");
            
        } catch (SQLException e) {
            res.setStatus(500);
            out.print("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        StaffSupport sst = new StaffSupport();
        sst.setFullName(req.getParameter("name"));
//        p.setAge(Integer.parseInt(req.getParameter("age")));
        sst.setGender(req.getParameter("gender"));
        try {
            dao.insertStaff(sst);
            res.getWriter().write("{\"status\":\"success\"}");
        } catch (SQLException e) {
            res.setStatus(500);
            res.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }

//    protected void doPut(HttpServletRequest req, HttpServletResponse res) throws IOException {
////        Patient p = new Patient(1, "Prajwal", 30, "Male");
//        try {
//            dao.updateStaff(sst);
//            res.getWriter().write("{\"status\":\"updated\"}");
//        } catch (SQLException e) {
//            res.setStatus(500);
//            res.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
//        }
//    }

    protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            dao.deleteStaff(id);
            res.getWriter().write("{\"status\":\"deleted\"}");
        } catch (SQLException e) {
            res.setStatus(500);
            res.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }
}
