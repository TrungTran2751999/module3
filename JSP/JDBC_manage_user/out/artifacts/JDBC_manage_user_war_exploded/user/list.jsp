<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2022
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>List User</h1>
    <h2><a href="user?action=create">Create User</a></h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items = "${user}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td id = "form-control"><c:out value="${user.country}"/></td>
                <td>
                    <a href="/user?action=edit&id=${user.id}">Edit</a>
                    <div style="cursor: pointer" onclick="directPage(${user.id})">
                        Delete
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
    <script>
        function directPage(id) {
            var confi = confirm("Xoa ko ?");
            if(confi){
                window.location = "/user?action=delete&id="+id;
            }
        }
    </script>
</body>
</html>
