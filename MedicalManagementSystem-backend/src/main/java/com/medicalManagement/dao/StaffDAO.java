package com.medicalManagement.dao;

import com.medicalManagement.model.Diagnosis;
import com.medicalManagement.model.Doctor;
import com.medicalManagement.model.Medication;
import com.medicalManagement.model.StaffSupport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {
//    private final String jdbcURL = "jdbc:mysql://localhost:3306/doctor_management";
//    private final String jdbcUser = "root";
//    private final String jdbcPassword = "admin";
//
//    private Connection getConnection() throws SQLException {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);
//    }
//
//    public void insertStaff(StaffSupport staff) throws SQLException {
//        String sql = "INSERT INTO staff_support (name, designation, gender, contact_number) VALUES (?, ?, ?, ?)";
//        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setString(1, staff.getFullName());
//            ps.setString(2, staff.getDesignation());
////            ps.setInt(3, staff.getAge());
//            ps.setString(3, staff.getGender());
//            ps.setString(4, staff.getContactNumber());
//            ps.executeUpdate();
//        }
//    }
//
//    public List<StaffSupport> getAllStaff() throws SQLException {
//        String sql = "SELECT * FROM staff_support";
//        List<StaffSupport> list = new ArrayList<>();
//        try (Connection conn = getConnection(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
//            while (rs.next()) {
////    				rs.getInt("age")
//                list.add(new StaffSupport(rs.getInt("id"), rs.getString("name"), rs.getString("gender")));
//            }
//        }
//        return list;
//    }
//
//    public void updateStaff(StaffSupport staff) throws SQLException {
//        String sql = "UPDATE staff_support SET staff_id=?, name=?, designation=?, gender=?, contact_number=? WHERE staff_id=?";
//        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
//        	ps.setInt(1, staff.getId());
//        	ps.setString(2, staff.getFullName());
//            ps.setString(3, staff.getDesignation());
////            ps.setInt(3, staff.getAge());
//            ps.setString(4, staff.getGender());
//            ps.setString(5, staff.getContactNumber());
//            
//            ps.executeUpdate();
//        }
//    }
//
//    public void deleteStaff(int id) throws SQLException {
//        String sql = "DELETE FROM staff_support WHERE staff_id=?";
//        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setInt(1, id);
//            ps.executeUpdate();
//        }
//    }
//    
//    public boolean validateStaff(String email, String password) {
//        try (Connection con = DBConnection.getConnection();
//             PreparedStatement ps = con.prepareStatement("SELECT * FROM staff_support WHERE email=? AND password=?")) {
//            ps.setString(1, email);
//            ps.setString(2, password);
//            ResultSet rs = ps.executeQuery();
//            return rs.next();
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//    public StaffSupport getStaffById(int id) {
//    	
//    }
    
//     public List<StaffSupport> getStaffByRole(String roleName){
//    	 
//     }
	    private final Connection conn;

	    public StaffDAO(Connection conn) {
	        this.conn = conn;
	    }

	    public StaffSupport login(String email, String password) throws SQLException {
	        String sql = "SELECT * FROM registration WHERE email=? AND password=?";
	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setString(1, email);
	            stmt.setString(2, password);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                return new StaffSupport(rs.getInt("id"), rs.getString("name"),
	                        rs.getString("designation"));
	            }
	        }
	        return null;
	    }

	    public List<Doctor> getAvailableDoctors(String date, String time) throws SQLException {
	        String sql = "SELECT * FROM staff_support WHERE designation='Doctor' AND id NOT IN "
	                   + "(SELECT doctor_id FROM appointment WHERE date=? AND time=?)";
	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setString(1, date);
	            stmt.setString(2, time);
	            ResultSet rs = stmt.executeQuery();
	            List<Doctor> doctors = new ArrayList<>();
	            while (rs.next()) {
	                doctors.add(new Doctor(rs.getInt("id"), rs.getString("name"), rs.getString("")));
	            }
	            return doctors;
	        }
	    }

	    public void addDiagnosis(Diagnosis diag) throws SQLException {
	        String sql = "INSERT INTO diagnosis (diagnosis_id, diagnosis, criticality) VALUES (?, ?, ?)";
	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, diag.getDiagnosisId());
	            stmt.setString(2, diag.getDiagnosis());
	            stmt.setString(3, diag.getCriticality());
	            stmt.executeUpdate();
	        }
	    }

	    public void addMedication(Medication med) throws SQLException {
	        String sql = "INSERT INTO medication (diagnosis_id, medication_name, dosage, frequency) VALUES (?, ?, ?, ?)";
	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, med.getDiagnosisId());
	            stmt.setString(2, med.getMedicationName());
	            stmt.setString(3, med.getDosage());
	            stmt.setString(4, med.getFrequency());
	            stmt.executeUpdate();
	        }
	    }

	    public void assignRoomToPatient(int patientId, int roomId) throws SQLException {
	        String sql = "INSERT INTO registration (patient_id, room_id, status, registration_date) VALUES (?, ?, ?, NOW())";
	        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	            stmt.setInt(1, patientId);
	            stmt.setInt(2, roomId);
	            stmt.setString(3, "admitted");
	            stmt.executeUpdate();
	        }
	        try (PreparedStatement updateRoom = conn.prepareStatement("UPDATE room SET available=false WHERE id=?")) {
	            updateRoom.setInt(1, roomId);
	            updateRoom.executeUpdate();
	        }
	    }
}


