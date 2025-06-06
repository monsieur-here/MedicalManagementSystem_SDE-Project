package com.medicalManagement.model;

public class StaffSupport {
    private int id;
    private String name;
    private String designation;
    private int age;
    private String gender;
    private String contactNumber;

    public StaffSupport() {}

    public StaffSupport(int id, String name, String designation, int age, String gender, String contactNumber) {
        this.id = id;
        this.name = name;
        this.designation = designation;
        this.age = age;
        this.gender = gender;
        this.contactNumber = contactNumber;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }
} 
