package model;

import java.sql.Timestamp;

public class Order {
	private int orderId;
	private int userId;
	private String fullName;
	private String phone;
	private String email;
	private String address;
	private String paymentMethod;
	private double subtotal;
	private double shippingFee;
	private double totalAmount;
	private int statusId;
	private Timestamp createdAt;
    private String statusName;

	public Order(int orderId, int userId, String fullName, String phone, String email, String address,
			String paymentMethod, double subtotal, double shippingFee, double totalAmount, int statusId) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.fullName = fullName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.paymentMethod = paymentMethod;
		this.subtotal = subtotal;
		this.shippingFee = shippingFee;
		this.totalAmount = totalAmount;
		this.statusId = statusId;
	}
	
	public Order() {
		
	}

	public int getOrderId() {
		return orderId;
	}

	public int getUserId() {
		return userId;
	}

	public String getFullName() {
		return fullName;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
}
