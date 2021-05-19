package com.logsik.internal.dtos;

import java.util.Date;

import com.logsik.internal.enums.UserRole;

/**
 * Created by phamcongbang on 16/05/2018.
 */
public class UserLeaveDayDto {

	private Long id;
	private String image;
	private String companyName;
	private String email;
	private String labourContract;
	private Integer leaveDayYear;
	private String fullName;
	private String phone;
	private UserRole role;
	private String address;
	private Date birthday;
	private boolean active;
	private Long totalLeaveDays;

	public UserLeaveDayDto(Long id,String image, String fullName,String companyName, String email,String labourContract, Integer leaveDayYear, String phone,
			Long totalLeaveDays) {
		setId(id);
		setImage(image);
		setFullName(fullName);
		setCompanyName(companyName);
		setEmail(email);
		setLabourContract(labourContract);
		setLeaveDayYear(leaveDayYear);
		setPhone(phone);
		setTotalLeaveDays(totalLeaveDays);
	}

	
	public String getLabourContract() {
		return labourContract;
	}


	public void setLabourContract(String labourContract) {
		this.labourContract = labourContract;
	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getLeaveDayYear() {
		return leaveDayYear;
	}

	public void setLeaveDayYear(Integer leaveDayYear) {
		this.leaveDayYear = leaveDayYear;
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

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Long getTotalLeaveDays() {
		return totalLeaveDays;
	}

	public void setTotalLeaveDays(Long totalLeaveDays) {
		this.totalLeaveDays = totalLeaveDays;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	

}
