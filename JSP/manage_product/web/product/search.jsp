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
<table border="1">
    <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Manufactor</td>
    </tr>
    <c:forEach items='${requestScope["product"]}' var="product">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getManufactor()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
