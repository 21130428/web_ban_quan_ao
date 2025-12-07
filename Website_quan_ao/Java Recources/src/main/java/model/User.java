package model;

import java.sql.Timestamp;

public class User {
	private int userID;
	private String fullName;
	private String email;
	private String password;
	private String phoneNumber;
	private Timestamp createAt;
	private int statusID;
	private String activateCode;
	private Timestamp lockUntil;
	private int failPassword;
	private String accountType;
	private boolean banned;

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	public int getStatusID() {
		return statusID;
	}

	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}

	public String getActivateCode() {
		return activateCode;
	}

	public void setActivateCode(String activateCode) {
		this.activateCode = activateCode;
	}

	public Timestamp getLockUntil() {
		return lockUntil;
	}

	public void setLockUntil(Timestamp lockUntil) {
		this.lockUntil = lockUntil;
	}

	public int getFailPassword() {
		return failPassword;
	}

	public void setFailPassword(int failPassword) {
		this.failPassword = failPassword;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public boolean isBanned() {
		return banned;
	}

	public void setBanned(boolean banned) {
		this.banned = banned;
	}

}
