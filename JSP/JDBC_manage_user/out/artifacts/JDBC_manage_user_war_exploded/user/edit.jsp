<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2022
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <fieldset>
        <legend>Edit User</legend>
        <table border="1">
            <tr>
                <td>Name: </td>
                <td><input type="text" name="name" value="<c:out value='${user.getName()}'/>" required></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" value="<c:out value='${user.getEmail()}'/>" required></td>
            </tr>
            <tr>
                <td>Country: </td>
                <td><input type="text" name="country" value="<c:out value='${user.getCountry()}'/>" required></td>
            </tr>
            <tr>
                <td></td>
                <td onclick="directPage()" id="submit"><input type="submit"></td>
            </tr>
        </table>
    </fieldset>
</form>
<script>
    function directPage() {
        window.location = "/user";
    }
</script>
</body>
</html>
