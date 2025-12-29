package model;

import java.sql.Timestamp;

public class Review {
	private int reviewId;
	private String username;
	private String productName;
	private int rating;
	private String comment;
	private Timestamp createdAt;


	public Review(int reviewId, String username, String productName, int rating, String comment, Timestamp createdAt) {
		super();
		this.reviewId = reviewId;
		this.username = username;
		this.productName = productName;
		this.rating = rating;
		this.comment = comment;
		this.createdAt = createdAt;
	}

	public Review() {

	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
}
