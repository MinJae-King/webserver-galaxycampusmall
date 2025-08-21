package dto;

public class CartItem {
    private Product product;
    private String os;
    private String cpu;
    private String ram;
    private String ssd;
    private String color;
    private String size;
    private int quantity;

   
    public CartItem() {}

   
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }

    
    public String getOs() {
        return os;
    }
    public void setOs(String os) {
        this.os = os;
    }

    
    public String getCpu() {
        return cpu;
    }
    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

 
    public String getRam() {
        return ram;
    }
    public void setRam(String ram) {
        this.ram = ram;
    }

    
    public String getSsd() {
        return ssd;
    }
    public void setSsd(String ssd) {
        this.ssd = ssd;
    }

   
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }

   
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    }

   
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
