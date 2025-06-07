package com.medicalManagement.dao;

import com.medicalManagement.model.Patient;
import java.sql.*;
import java.util.*;

public class PatientDAO {
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
    
    public boolean insertPatient(Patient p) throws SQLException {
        String sql = "INSERT INTO patients (first_name, last_name, email, password_hash) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, p.getFirstName());
        stmt.setString(2, p.getLastName());
        stmt.setString(3, p.getEmail());
        stmt.setString(4, p.getPasswordHash());
        return stmt.executeUpdate() > 0;
    }

    public List<Patient> getAllPatients() throws SQLException {
        List<Patient> patients = new ArrayList<>();
        String sql = "SELECT * FROM patients";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            Patient p = new Patient();
            p.setPatientId(rs.getInt("patient_id"));
            p.setFirstName(rs.getString("first_name"));
            p.setLastName(rs.getString("last_name"));
            p.setEmail(rs.getString("email"));
            patients.add(p);
        }

        return patients;
    }

    public boolean updatePatient(Patient p) throws SQLException {
        String sql = "UPDATE patients SET first_name=?, last_name=?, email=?, password_hash=? WHERE patient_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, p.getFirstName());
        stmt.setString(2, p.getLastName());
        stmt.setString(3, p.getEmail());
        stmt.setString(4, p.getPasswordHash());
        stmt.setInt(5, p.getPatientId());
        return stmt.executeUpdate() > 0;
    }

    public boolean deletePatient(int id) throws SQLException {
        String sql = "DELETE FROM patients WHERE patient_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        return stmt.executeUpdate() > 0;
    }
}
