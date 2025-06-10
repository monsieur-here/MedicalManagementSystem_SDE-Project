package com.medicalManagement.model;

public class StaffSupport {
    private int id;
    private String designation;
    private String name;
    private String gender;
    private String contact_number;
    private String staff_availability;

    public StaffSupport() {}
    
    public StaffSupport(int id, String name, String gender) {
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

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
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

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public String getStaff_availability() {
		return staff_availability;
	}

	public void setStaff_availability(String staff_availability) {
		this.staff_availability = staff_availability;
	}
    
}
