<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/11/2022
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculating...</title>
</head>
<body>
    <%
        double firstOP = 0;
        String operator= "";
        double secondOP = 0;
    try{
        firstOP = Double.parseDouble(request.getParameter("firstOP"));
        operator = request.getParameter("operator");
        secondOP = Double.parseDouble(request.getParameter("secondOP"));
    }catch (Exception e){
        response.sendRedirect("error.jsp");
    }
    %>
    <h1>Result</h1>
    <p>
        <% if(operator.equals("+")){ %>
            <%=String.format("%s + %s=%s",firstOP, secondOP, firstOP+secondOP)%>
        <%}else if(operator.equals("-")){%>
            <%=String.format("%s - %s=%s",firstOP, secondOP, firstOP-secondOP)%>
        <%}else if(operator.equals("*")){%>
            <%=String.format("%s * %s=%s",firstOP, secondOP, firstOP*secondOP)%>
        <%}else if(operator.equals("/")){%>
            <%=String.format("%s * %s=%s",firstOP, secondOP, firstOP/secondOP)%>
        <% }%>

    </p>
</body>
</html>
