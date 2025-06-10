package com.medicalManagement.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

//import com.medicalManagement.dao.DBConnection;
import com.medicalManagement.dao.PatientDAO;
import com.medicalManagement.dao.StaffDAO;
//import com.medicalManagement.dao.UserDAO;
//import com.medicalManagement.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	private Connection conn;

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		 	String email = req.getParameter("email");
	        String password = req.getParameter("password");
	        String userType = req.getParameter("user_type"); // "Patient" or "Staff"

	        boolean validUser = false;

	        if ("Patient".equals(userType)) {
	            validUser = new PatientDAO(conn).validatePatient(email, password);
	        } else if ("Staff".equals(userType)) {
	            validUser = new StaffDAO().validateStaff(email, password);
	        }

	        res.setContentType("text/html");
	        res.setHeader("Access-Control-Allow-Origin", "*");

	        PrintWriter out = res.getWriter();
	        if (validUser) {
	            out.write("{\"status\":\"success\", \"role\":\"" + userType + "\"}");
	        } else {
	            out.write("{\"status\":\"fail\", \"message\":\"Invalid credentials\"}");
	        }
	}
	
	
}
