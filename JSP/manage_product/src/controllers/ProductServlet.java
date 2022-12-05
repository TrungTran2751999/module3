package controllers;

import models.Product;
import services.ProductImpl;
import services.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                addProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showAddProductView(request, response);
                break;
            case "edit":
                showUpdateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                showSearchProduct(request,response);
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }
    private void showListProduct(HttpServletRequest request, HttpServletResponse response){
        List<Product>listProduct = productService.showAllProduct();
        request.setAttribute("product", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list_product.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void showAddProductView(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void addProduct(HttpServletRequest request, HttpServletResponse response){
        String name = "";
        double price = 0;
        String description = "";
        String manufactor = "";
        int id = 0;
        try {
            name = request.getParameter("name");
            price = Double.parseDouble(request.getParameter("price"));
            description = request.getParameter("description");
            manufactor = request.getParameter("manufactor");
            id = productService.showAllProduct().size()+1;
        }catch (Exception e){
            e.printStackTrace();
        }
        Product product = new Product(id, name, price, description, manufactor);
        productService.addProduct(product);

        RequestDispatcher dispatcher = request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.showOneProduct(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher;
        if(product != null){
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }else{
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }
        try {
            dispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = "";
        double price = 0;
        String desription = "";
        String manufactor = "";
        try {
            name = request.getParameter("name");
            price = Double.parseDouble(request.getParameter("price"));
            desription = request.getParameter("desription");
            manufactor = request.getParameter("manufactor");
        }catch (Exception e){
            e.printStackTrace();
        }

        Product oneProduct = productService.showOneProduct(id);
        RequestDispatcher dispatcher;
        if(oneProduct != null && !name.equals("") && price != 0 && !desription.equals("") && !manufactor.equals("")){
            Product product = new Product(id, name, price, desription, manufactor);
            productService.updateProduct(id, product);
            request.setAttribute("message", "Update complete");
            dispatcher = request.getRequestDispatcher("product/update.jsp");
        }else{
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }
        try {
            dispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.showOneProduct(id);
        List<Product> listProduct = productService.showAllProduct();
        request.setAttribute("product", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list_product.jsp");
        if(product!=null){
            productService.remove(id);
        }else{
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }
        try {
            dispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void showSearchProduct(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        List<Product> products = productService.searchNameProduct(name);
        RequestDispatcher dispatcher;
        if(products.size()!=0){
            dispatcher = request.getRequestDispatcher("product/list_product.jsp");
            request.setAttribute("product",products);
        }else{
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }
        try {
            dispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
