package services;

import models.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductImpl implements ProductService {
    private static ArrayList<Product> products;
    public ProductImpl(){
//        int id, String name, double price, String desription, String manufactor
        products = new ArrayList<>();
        products.add(new Product(products.size()+1, "May tinh", 20000, "May tinh ok", "Apple"));
        products.add(new Product(products.size()+1, "Dien thoai", 10000, "dien thoai ok", "Apple"));
        products.add(new Product(products.size()+1, "Noi com dien", 5000, "Noi com ok", "Apple"));
    }

    @Override
    public List<Product> showAllProduct() {
        return products;
    }

    @Override
    public void addProduct(Product product) {
        products.add(product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        products.get(id-1).setName(product.getName());
        products.get(id-1).setDesription(product.getDescription());
        products.get(id-1).setManufactor(product.getManufactor());
        products.get(id-1).setPrice(product.getPrice());
    }

    @Override
    public void remove(int id) {
        for(int i=0; i<products.size(); i++){
            if(id == products.get(i).getId()){
                System.out.println(i);
                products.remove(i);
            }
        }
    }

    @Override
    public Product showOneProduct(int id) {
        for(int i=0; i<products.size(); i++){
            if(id == products.get(i).getId()){
                System.out.println(i);
                return products.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Product> searchNameProduct(String name) {
        List<Product> listSearch = new ArrayList<>();
        for(Product product:products){
            if(product.getName().equals(name)){
                listSearch.add(product);
            }
        }
        return listSearch;
    }
}
