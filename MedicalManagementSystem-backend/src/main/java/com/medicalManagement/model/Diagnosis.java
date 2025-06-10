package com.medicalManagement.model;

public class Diagnosis {
	
	private int diagnosisId;
	private String diagnosis;
	private String criticality;
	
	public int getDiagnosisId() {
		return diagnosisId;
	}
	
	public void setDiagnosisId(int diagnosisId) {
		this.diagnosisId = diagnosisId;
	}
	
	public String getDiagnosis() {
		return diagnosis;
	}
	
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	
	public String getCriticality() {
		return criticality;
	}
	
	public void setCriticality(String criticality) {
		this.criticality = criticality;
	}
	
	
}
