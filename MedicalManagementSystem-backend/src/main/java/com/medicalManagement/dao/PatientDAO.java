package com.medicalManagement.dao;

import com.medicalManagement.model.Diagnosis;
import com.medicalManagement.model.Medication;
import com.medicalManagement.model.Patient;
//import com.medicalManagement.model.User;
import com.medicalManagement.model.Room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import java.sql.SQLException;

public class PatientDAO {
    private final Connection conn;

    public PatientDAO(Connection conn) {
        this.conn = conn;
    }

    public void addPatient(Patient patient) throws SQLException {
        String sql = "INSERT INTO patient (name, gender, date_of_birth, contact_number) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, patient.getPatientName());
            stmt.setString(2, patient.getGender());
            stmt.setDate(3, patient.getDateOfBirth());
            stmt.setString(4, patient.getContactNumber());
            stmt.executeUpdate(); 
        }
    }

    public Patient getPatientById(int id) throws SQLException {
        String sql = "SELECT * FROM patient WHERE patient_id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Patient(rs.getInt("id"), rs.getString("name"), rs.getInt("age"),
                        rs.getString("gender"), rs.getString("email"), rs.getString("phone"));
            }
        }
        return null;
    }

    public void updatePatient(Patient p) throws SQLException {
        String sql = "UPDATE patient SET name=?, date_of_birth=?, gender=?, contact_number=? WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, p.getPatientName());
            stmt.setDate(2, p.getDateOfBirth());
            stmt.setString(3, p.getGender());
            stmt.setString(4, p.getContactNumber());
            stmt.setInt(5, p.getPatientId());
            stmt.executeUpdate();
        }
    }

    public void deletePatient(int id) throws SQLException {
        String sql = "DELETE FROM patient WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public List<Diagnosis> getDiagnosesForPatient(int patientId) throws SQLException {
        List<Diagnosis> list = new ArrayList<>();
        String sql = "SELECT * FROM diagnosis WHERE patient_id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Diagnosis(rs.getInt("patient_id"), rs.getInt("doctor_id"),
                        rs.getString("diagnosis_details"), rs.getString("diagnosis_date")));
            }
        }
        return list;
    }

    public List<Medication> getMedicationsForPatient(int patientId) throws SQLException {
        List<Medication> list = new ArrayList<>();
        String sql = "SELECT * FROM medication WHERE patient_id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Medication(rs.getInt("id"), patientId,
                        rs.getString("medication_name"), rs.getString("dosage"), rs.getString("prescribed_date")));
            }
        }
        return list;
    }

    public List<Room> getRoomsForPatient(int patientId) throws SQLException {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT r.* FROM room r JOIN registration reg ON r.id = reg.room_id WHERE reg.patient_id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("id"), rs.getString("room_number"),
                        rs.getString("room_type"), rs.getBoolean("available")));
            }
        }
        return rooms;
    }
}

//public class PatientDAO {
//    private Connection conn;
//
//    public PatientDAO(Connection conn) {
//        this.conn = conn;
//    }
//
//    public boolean createPatient(Patient patient) throws SQLException {
//        String sql = "INSERT INTO patient (name, email, phone, password) VALUES (?, ?, ?, ?)";
//        try (PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setString(1, patient.getName());
//            ps.setString(2, patient.getEmail());
//            ps.setString(3, patient.getPhone());
//            ps.setString(4, patient.getPassword());
//            return ps.executeUpdate() > 0;
//        }
//    }
//
//    public Patient getPatientById(int id) throws SQLException {
//        String sql = "SELECT * FROM patient WHERE id = ?";
//        try (PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                Patient p = new Patient();
//                p.setId(rs.getInt("id"));
//                p.setName(rs.getString("name"));
//                p.setEmail(rs.getString("email"));
//                p.setPhone(rs.getString("phone"));
//                p.setPassword(rs.getString("password"));
//                return p;
//            }
//            return null;
//        }
//    }
//
//    public boolean updatePatient(Patient patient) throws SQLException {
//        String sql = "UPDATE patient SET name = ?, email = ?, phone = ?, password = ? WHERE id = ?";
//        try (PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setString(1, patient.getName());
//            ps.setString(2, patient.getEmail());
//            ps.setString(3, patient.getPhone());
//            ps.setString(4, patient.getPassword());
//            ps.setInt(5, patient.getId());
//            return ps.executeUpdate() > 0;
//        }
//    }
//
//    public boolean deletePatient(int id) throws SQLException {
//        String sql = "DELETE FROM patient WHERE id = ?";
//        try (PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setInt(1, id);
//            return ps.executeUpdate() > 0;
//        }
//    }
//
//    public Patient authenticate(String email, String password) throws SQLException {
//        String sql = "SELECT * FROM patient WHERE email = ? AND password = ?";
//        try (PreparedStatement ps = conn.prepareStatement(sql)) {
//            ps.setString(1, email);
//            ps.setString(2, password);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                Patient p = new Patient();
//                p.setId(rs.getInt("id"));
//                p.setName(rs.getString("name"));
//                p.setEmail(rs.getString("email"));
//                p.setPhone(rs.getString("phone"));
//                p.setPassword(rs.getString("password"));
//                return p;
//            }
//            return null;
//        }
//    }
//}
//
//    
//}
