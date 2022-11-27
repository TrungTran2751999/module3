<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/11/2022
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% HashMap<String, String> listWord = new HashMap<>();%>
    <% listWord.put("hello","xin chao");
       listWord.put("car","xe hoi");
       listWord.put("human", "con nguoi");
    %>
    <% String search = request.getParameter("search"); %>
    <%if (listWord.get(search) != null){%>
        <h1><%=search%> la <%=listWord.get(search)%></h1>
    <%}else{%>
        <h1><%=search%> is not exits</h1>
    <%}%>

</body>
</html>
