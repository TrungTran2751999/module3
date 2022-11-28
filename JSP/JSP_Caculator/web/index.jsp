<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/11/2022
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="caculate.jsp">
        <h1>Simple Caculator</h1>
        <table>
            <tr>
                <td>First Operate</td>
                <td><input type="text" name="firstOP"></td>
            </tr>
            <tr>
                <td>Operator</td>
                <td>
                    <select name="operator">
                        <option value="+">Addtion</option>
                        <option value="-">Minus</option>
                        <option value="*">Multiple</option>
                        <option value="/">Divide</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second Operate</td>
                <td><input type="text" name="secondOP"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"></td>
            </tr>
        </table>
    </form>
</body>
</html>
