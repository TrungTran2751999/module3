<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductDiscount</title>
</head>
<body>
    <form action="display-discount" method="post">
        Product Description: <br />
        <input type="text" name="desription">
        <br/>
        List Price:
        <br/>
        <input type="text" name="listPrice">
        <br />
        Discount Percent:
        <br />
        <input type="text" name="discountPercent">
        <br />
        <input type="submit" value="submit">
    </form>
</body>
</html>
