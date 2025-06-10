  package com.medicalManagement.servlets;

import java.io.IOException;

import com.medicalManagement.dao.AppointmentDAO;
import com.medicalManagement.dao.DBConnection;
import com.medicalManagement.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	int userId	= Integer.parseInt(req.getParameter("userId"));
	String fullName = req.getParameter("fullName");
	String gender = req.getParameter("gender");
	String age = req.getParameter("age");
	String appointmentDate = req.getParameter("appointmentDate");
	String email = req.getParameter("email");
	String phone = req.getParameter("phone");
	String diseases = req.getParameter("diseases");
	int doctorId = Integer.parseInt(req.getParameter("doctorNameSelect"));
	String address = req.getParameter("address");
	
	
	Appointment appointment = new Appointment(userId, fullName, gender, age, appointmentDate, email, phone, diseases, doctorId, address, "Pending");
	
	AppointmentDAO appointmentDAO = new AppointmentDAO(DBConnection.getConnection());
	boolean f = appointmentDAO.addAppointment(appointment);
	
	//get session
	HttpSession session = req.getSession();
	
	if(f==true) {
		session.setAttribute("successMsg", "Appointment is recorded Successfully.");
		resp.sendRedirect("user_appointment.jsp");
		
		
	}
	else {
		session.setAttribute("errorMsg", "Something went wrong on server!");
		resp.sendRedirect("user_appointment.jsp");
		
	}
	
	
	
	
		
	}

	
}
