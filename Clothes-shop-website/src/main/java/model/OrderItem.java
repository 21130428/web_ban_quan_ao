package model;

public class OrderItem {
	private int orderItemId;
	private int orderId;
	private int productId;
	private String productName;
	private double price;
	private int quantity;

	public OrderItem(int orderItemId, int orderId, int productId, String productName, double price, int quantity) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
	}

	public OrderItem() {

	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public int getProductId() {
		return productId;
	}

	public String getProductName() {
		return productName;
	}

	public double getPrice() {
		return price;
	}

	public int getQuantity() {
		return quantity;
	}
}
