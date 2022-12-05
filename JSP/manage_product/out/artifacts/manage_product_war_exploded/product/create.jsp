<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/12/2022
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<%--int id, String name, double price, String desription, String manufactor--%>
    <form method="post">
        <fieldset>
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" required></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="text" name="price" required></td>
                </tr>
                <tr>
                    <td>Description: </td>
                    <td><input type="text" name="description" required></td>
                </tr>
                <tr>
                    <td>Manufactor: </td>
                    <td><input type="text" name="manufactor" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit"></td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>
