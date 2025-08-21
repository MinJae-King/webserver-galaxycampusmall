package dto;

public class Product {
	private String id;
	private String name;
	private String description;
	private int price;
	private String filename; // 이미지 경로
	private boolean campusDiscount;

	public Product() {
	}

	public Product(String id, String name, String description, int price, String filename, boolean campusDiscount) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.filename = filename;
		this.campusDiscount = campusDiscount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public boolean isCampusDiscount() {
		return campusDiscount;
	}

	public void setCampusDiscount(boolean campusDiscount) {
		this.campusDiscount = campusDiscount;
	}
}
