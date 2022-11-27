<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    img{
        width: 30px;
        height: 30px;
    }
    table{
        border-collapse: collapse;
    }
    th,td{
        padding: 10px;
    }
</style>
<body>
    <table border="1">
        <caption>Danh sách khách hàng</caption>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
            <%
                String line = null;
                FileReader fr = null;
                BufferedReader br = null;
            try{
                fr = new FileReader("C:\\Users\\Admin\\Desktop\\module3\\JSP\\ManageProduct\\data\\data.csv");
                br = new BufferedReader(fr);
            %>

            <%}catch (Exception e){%>
                <h1>Error</h1>
            <%}%>
            <% while ((line = br.readLine())!=null) {
                String[] data = line.split(",");
            %>
                <tr>
                    <td><%=data[0]%></td>
                    <td><%=data[1]%></td>
                    <td><%=data[2]%></td>
                    <td><img src=<%=data[3]%>></td>
                </tr>
            <%}%>
            <% br.close();fr.close();%>
        </tbody>
    </table>
</body>
</html>
