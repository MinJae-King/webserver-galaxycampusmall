package dao;

import dto.Product;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {

	private ArrayList<Product> productList = new ArrayList<>();

    private static ProductRepository instance = new ProductRepository();

    public static ProductRepository getInstance() {
        return instance;
    }
    
	private ProductRepository() {
		productList.add(new Product("GalaxyBook_Pro5_360", // 슬라이드용 이미지 파일명과 일치하게 변경
				"갤럭시북5 Pro 360", "인텔 i7 / RAM 32GB / SSD 1TB / Windows 11", 2390000,
				"resources/images/galaxybook5pro360.webp", true));

		productList.add(new Product("GalaxyBook_Pro5", // 슬라이드 이미지에 맞춰 수정
				"갤럭시북5 Pro", "인텔 i7 / RAM 16GB / SSD 512GB / Windows 11", 1990000,
				"resources/images/galaxybook5pro.avif", false));

		productList.add(new Product("GalaxyBook_Pro5_H", // 예시 이름, 실제 파일명에 맞춰 변경
				"갤럭시북5 Pro H", "인텔 i5 / RAM 8GB / SSD 256GB / Windows 11", 1390000, "resources/images/galaxybook5.webp",
				true));
	}

	public List<Product> getAllProducts() {
		return productList;
	}

	public Product getProductById(String productId) {
		for (Product product : productList) {
			if (product != null && product.getId().equals(productId)) {
				return product;
			}
		}
		return null;
	}

	public void addProduct(Product product) {
		productList.add(product);
	}

	public void removeProduct(String productId) {
		productList.removeIf(product -> product.getId().equals(productId));
	}
}
