<%@ page import="controllers.ProductServlet" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/12/2022
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
    <h1>Manage Product</h1>
        <span><a href="/product?action=create">Create Product</a></span>
        <span>
            <form method="get">
                <input type="text" name="name">
                <input type="hidden" name="action" value="search">
                <input type="submit">
            </form>
        </span>
    <table border="1">
        <tr>
            <td>Id</td>
            <td>Name</td>
            <td>Price</td>
            <td>Description</td>
            <td>Manufactor</td>
            <td>Action</td>
        </tr>
        <c:forEach items='${requestScope["product"]}' var="product">
            <tr>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td>${product.getManufactor()}</td>
                <td>
                    <div id="edit"><a href="/product?action=edit&id=${product.getId()}">Edit</a></div>
                    <div id="delete" onclick="deleteFuntion(${product.getId()})">
                        <span style="cursor: pointer">Delete</span>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
    <script>
        function deleteFuntion(id) {
            var removeConfirm = confirm("Xoa khong ?");
            if(removeConfirm){
                window.location="/product?action=delete&id="+id;
            }
        }
    </script>
</body>
</html>
