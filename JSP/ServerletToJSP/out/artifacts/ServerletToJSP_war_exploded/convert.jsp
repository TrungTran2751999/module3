<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% double rate = Double.parseDouble(request.getParameter("rate"));
       double usd = Double.parseDouble(request.getParameter("usd"));
       double vnd = rate*usd;
    %>
    <h1>Rate: <%=rate%></h1>
    <h1>USD: <%=usd%></h1>
    <h1>VND: <%=vnd%></h1>
</body>
</html>
