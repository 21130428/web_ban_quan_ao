package model;

public class User {
	private int userID;
	private String username;
	private String email;
	private String password;
	private String role;

	public User() {
	}

	public User(int userID, String username, String email, String password, String role) {
        this.userID = userID;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

	// Getter và Setter
	public int getUserId() {
		return userID;
	}

	public void setUserId(int userID) {
		this.userID = userID;
	}

	public String getusername() {
		return username;
	}

	public void setusername(String username) {
		this.username = username;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}