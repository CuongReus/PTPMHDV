package com.logsik.internal.dtos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.logsik.internal.domain.Company;
import com.logsik.internal.domain.Role;
import com.logsik.internal.enums.Gender;
import com.logsik.internal.enums.UserRole;

/**
 * Created by phamcongbang on 16/05/2018.
 */
public class UserDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long id;
	private List<UploadFileResponse> imageUpload = new ArrayList<>();
	private String image;
	private Company company;
	private String email;
	private Integer leaveDayYear;
	private String department;
	private String labourContract;
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String password;
	private String fullName;
	private String phone;
	private UserRole role;
	private String address;
	private Date birthday;
	private boolean active;
	private List<Role> roles = new ArrayList<>();
	private List<UploadFileResponse> profiles = new ArrayList<>();
	
	private Long identityCardNumber;
	private Date issuedDate;
	private String issuedAt;
	private Gender gender;
	private String permanentAddress;
	private String currentAddress;
	private Date startWorkDate;
	private String position;
	private Integer numberOfYear;
	private String jobDescription ;
	private String degree;
	private String trainingPlace;
	private String profession;
	private Integer graduationYear;
	private String foreignLanguageSkill;
	private String level;
	private String familyInformation;
	private String code;
	private String createdUserEmail;
	private String lastedUpdateUserEmail;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<UploadFileResponse> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<UploadFileResponse> profiles) {
		this.profiles = profiles;
	}

	public List<UploadFileResponse> getImageUpload() {
		return imageUpload;
	}

	public void setImageUpload(List<UploadFileResponse> imageUpload) {
		this.imageUpload = imageUpload;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Integer getLeaveDayYear() {
		return leaveDayYear;
	}

	public void setLeaveDayYear(Integer leaveDayYear) {
		this.leaveDayYear = leaveDayYear;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getLabourContract() {
		return labourContract;
	}

	public void setLabourContract(String labourContract) {
		this.labourContract = labourContract;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Long getIdentityCardNumber() {
		return identityCardNumber;
	}

	public void setIdentityCardNumber(Long identityCardNumber) {
		this.identityCardNumber = identityCardNumber;
	}

	public Date getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getIssuedAt() {
		return issuedAt;
	}

	public void setIssuedAt(String issuedAt) {
		this.issuedAt = issuedAt;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public String getCurrentAddress() {
		return currentAddress;
	}

	public void setCurrentAddress(String currentAddress) {
		this.currentAddress = currentAddress;
	}

	public Date getStartWorkDate() {
		return startWorkDate;
	}

	public void setStartWorkDate(Date startWorkDate) {
		this.startWorkDate = startWorkDate;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getNumberOfYear() {
		return numberOfYear;
	}

	public void setNumberOfYear(Integer numberOfYear) {
		this.numberOfYear = numberOfYear;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getTrainingPlace() {
		return trainingPlace;
	}

	public void setTrainingPlace(String trainingPlace) {
		this.trainingPlace = trainingPlace;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public Integer getGraduationYear() {
		return graduationYear;
	}

	public void setGraduationYear(Integer graduationYear) {
		this.graduationYear = graduationYear;
	}

	public String getForeignLanguageSkill() {
		return foreignLanguageSkill;
	}

	public void setForeignLanguageSkill(String foreignLanguageSkill) {
		this.foreignLanguageSkill = foreignLanguageSkill;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getFamilyInformation() {
		return familyInformation;
	}

	public void setFamilyInformation(String familyInformation) {
		this.familyInformation = familyInformation;
	}

	public String getCreatedUserEmail() {
		return createdUserEmail;
	}

	public void setCreatedUserEmail(String createdUserEmail) {
		this.createdUserEmail = createdUserEmail;
	}

	public String getLastedUpdateUserEmail() {
		return lastedUpdateUserEmail;
	}

	public void setLastedUpdateUserEmail(String lastedUpdateUserEmail) {
		this.lastedUpdateUserEmail = lastedUpdateUserEmail;
	}
	
	
}
