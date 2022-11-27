<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="AddCustomer.jsp" method="post">
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <td>Birthdate:</td>
                <td><input type="date" name="birthdate" required></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" required></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td><input type="text" name="image" required></td>
            </tr>
        </table>
        <input type="submit" value="submit">
    </form>
</body>
</html>
