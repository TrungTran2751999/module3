<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ConvertCurrency</title>
</head>
<style>
    input[type="text"]{
        width: 200px;
        height: 50px;
    }
    input[type="submit"]{
        width: 100px;
        height: 50px;
    }
</style>
<body>
    <form action="convert" method="post">
        <h1>Currency Coverter</h1>
        <br/>
        <label>Rate:</label>
        <input type="text" name="rate">
        <br/><br/>
        <label>USD:</label>
        <input type="text" name="USD">
        <br/><br/>
        <input type="submit" value="Converter">
    </form>
</body>
</html>
