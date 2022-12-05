package models;

public class Product {
    private int id;
    private String name;
    private double price;
    private String desription;
    private String manufactor;
    public Product(int id, String name, double price, String desription, String manufactor) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.desription = desription;
        this.manufactor = manufactor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return desription;
    }

    public void setDesription(String desription) {
        this.desription = desription;
    }

    public String getManufactor() {
        return manufactor;
    }

    public void setManufactor(String manufactor) {
        this.manufactor = manufactor;
    }

    @Override
    public String toString() {
        return String.format("%s, %s, %s, %s, %s", id, name, price, desription, manufactor);
    }
}
