package com.medicalManagement.dao;

import com.medicalManagement.model.Patient;
import com.medicalManagement.model.StaffSupport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class StaffDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/doctor_management";
    private final String jdbcUser = "root";
    private final String jdbcPassword = "admin";

    private Connection getConnection() throws SQLException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        return DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);
    }

    public void insertStaff(StaffSupport staff) throws SQLException {
        String sql = "INSERT INTO patients (name, age, gender) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, staff.getName());
            ps.setInt(2, staff.getAge());
            ps.setString(3, staff.getGender());
            ps.executeUpdate();
        }
    }

//    public List<Patient> getAllPatients() throws SQLException {
//        String sql = "SELECT * FROM patients";
//        List<Patient> list = new ArrayList<>();
//        try (Connection conn = getConnection(); Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
//            while (rs.next()) {
//                list.add(new Patient(rs.getInt("id"), rs.getString("name"), rs.getInt("age"), rs.getString("gender")));
//            }
//        }
//        return list;
//    }

    public void updateStaff(StaffSupport staff) throws SQLException {
        String sql = "UPDATE patients SET name=?, age=?, gender=? WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, staff.getName());
            ps.setInt(2, staff.getAge());
            ps.setString(3, staff.getGender());
            ps.setInt(4, staff.getId()); 
            ps.executeUpdate(); 
        }
    }

    public void deleteStaff(int id) throws SQLException {
        String sql = "DELETE FROM patients WHERE id=?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
