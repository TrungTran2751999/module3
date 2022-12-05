<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/12/2022
  Time: 11:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Update Product</title>
</head>
<body>
    <form method="post">
        <fieldset>
            <legend>Update Product</legend>
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" value="${requestScope["product"].getName()}"></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price" value="${requestScope["product"].getPrice()}"></td>
                </tr>
                <tr>
                    <td>Desription: </td>
                    <td><input type="text" name="desription" value="${requestScope["product"].getDescription()}"></td>
                </tr>
                <tr>
                    <td>Manufactor: </td>
                    <td><input type="text" name="manufactor" value="${requestScope["product"].getManufactor()}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"></td>
                </tr>
            </table>
        </fieldset>
    </form>
    <p>
        <c:if test='${requestScope["message"] != null}'>
                <span>${requestScope["message"]}</span>
        </c:if>
    </p>
</body>
</html>
