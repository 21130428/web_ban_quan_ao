package model;

import java.sql.Timestamp;

public class Notification {
	private int id;
	private int userId;
	private String title;
	private String content;
	private String icon;
	private boolean isRead;
	private Timestamp createdAt;
	private String type;

	// Constructors
	public Notification() {
	}

	public Notification(int id, int userId, String title, String content, String icon, boolean isRead,
			Timestamp createdAt, String type) {
		super();
		this.id = id;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.icon = icon;
		this.isRead = isRead;
		this.createdAt = createdAt;
		this.type = type;
	}

	// Getters and Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public boolean isRead() {
		return isRead;
	}

	public void setRead(boolean read) {
		isRead = read;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
