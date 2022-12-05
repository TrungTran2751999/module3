<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2022
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post">
        <fieldset>
            <legend>Create User</legend>
            <table border="1">
                <tr>
                    <td>Name: </td>
                    <td><input class="form-control my_s"type="text" name="name" required></td>
                    <td>Country</td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <td>Country: </td>
                    <td><input type="text" name="country" required></td>
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
