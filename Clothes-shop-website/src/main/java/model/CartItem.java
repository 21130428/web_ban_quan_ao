package model;

public class CartItem {
	 private int productId;
	    private String name;
	    private String image;
	    private double price;
	    private int quantity;

	    public CartItem(int productId, String name, String image, double price, int quantity) {
	        this.productId = productId;
	        this.name = name;
	        this.image = image;
	        this.price = price;
	        this.quantity = quantity;
	    }
	    // getter & setter
	    public int getProductId() { return productId; }
	    public String getName() { return name; }
	    public String getImage() { return image; }
	    public double getPrice() { return price; }
	    public int getQuantity() { return quantity; }
	    public void setQuantity(int quantity) { this.quantity = quantity; }
}
