package com.medicalManagement.model;

public class Doctor {
    private int doctorId;
    private String name;
    private String specialization;
    private String contactNumber;
    private String availability;
    private int staffId;

    public Doctor() {}

    public Doctor(int doctorId, String name, String specialization, String contactNumber, String availability, int staffId) {
        this.doctorId = doctorId;
        this.name = name;
        this.specialization = specialization;
        this.contactNumber = contactNumber;
        this.availability = availability;
        this.staffId = staffId;
    }

    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }

    public String getAvailability() { return availability; }
    public void setAvailability(String availability) { this.availability = availability; }

    public int getStaffId() { return staffId; }
    public void setStaffId(int staffId) { this.staffId = staffId; }
} 
