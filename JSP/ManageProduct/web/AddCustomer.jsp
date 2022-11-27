<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.BufferedWriter" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% String name = request.getParameter("name");
       String birthdate = request.getParameter("birthdate");
       String address = request.getParameter("address");
       String image = request.getParameter("image");
    %>
    <% FileWriter fw = new FileWriter("../data/data.csv");
       BufferedWriter bw = new BufferedWriter(fw);
       String line = String.format("%s,%s,%s,%s",name,birthdate,address,image);
       bw.write(line);
    %>
    

</body>
</html>
