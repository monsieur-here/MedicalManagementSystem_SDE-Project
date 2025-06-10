package com.medicalManagement.model;

import java.sql.Date;

public class Registration_User {
	private int patientName;
	private String gender;
	private String contactNumber;
	private Date DateOfBirth;
	private String Address;
	private String  email;
	private String password;
	
	public int getPatientName() {
		return patientName;
	}

	public void setPatientName(int patientName) {
		this.patientName = patientName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Date getDateOfBirth() {
		return DateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		DateOfBirth = dateOfBirth;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

//	@Override
//	public String toString() {
//		return "User [id=" + id + ", fullName=" + fullName + ", email=" + email + ", password=" + password + "]";
//	}
	
	
	
	
	
	
	
	
}
