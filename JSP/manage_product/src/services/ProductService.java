package services;

import models.Product;

import java.util.List;

public interface ProductService {
    List<Product> showAllProduct();
    void addProduct(Product product);
    void updateProduct(int id, Product product);
    void remove(int id);
    Product showOneProduct(int id);
    List<Product> searchNameProduct(String name);
}
