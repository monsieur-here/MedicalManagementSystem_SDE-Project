package com.medicalManagement.model;

public class Doctor {
    private int id;
    private String name;
    private String gender;
    private String specialization;
    private String contactNumber;
    private String availability;
    
    public Doctor() {}

    public Doctor(int id, String name, int age, String gender) {
        this.id = id;
        this.name = name;
        this.gender = gender;
    }

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}
    
}
    