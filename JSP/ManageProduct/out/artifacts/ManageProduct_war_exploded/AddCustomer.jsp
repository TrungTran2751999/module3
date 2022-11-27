<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.BufferedWriter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.FileReader" %>
<%--

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
    <% ArrayList<String> listData = new ArrayList<>();
       try {
           FileReader fr= new FileReader("C:\\Users\\Admin\\Desktop\\module3\\JSP\\ManageProduct\\data\\data.csv");
           BufferedReader br = new BufferedReader(fr);
           String lineReader = "";
           while ((lineReader = br.readLine()) != null){
               listData.add(lineReader);
           }
          br.close();
          fr.close();
       }catch (Exception e){
           e.printStackTrace();
       }
    %>
    <%
        try {
            FileWriter fw = new FileWriter("C:\\Users\\Admin\\Desktop\\module3\\JSP\\ManageProduct\\data\\data.csv");
            BufferedWriter bw = new BufferedWriter(fw);
            String line = String.format("%s,%s,%s,%s",name,birthdate,address,image);
            listData.add(line);
            for(int i=0; i<listData.size(); i++){
                bw.write(listData.get(i)+"\n");
            }
            bw.close();
            fw.close();
    %>
    <%  }catch (Exception e){e.printStackTrace(); %>

    <%}%>
    <h1>Add new customer successfuly <a href="ManageCustomer.jsp">Go to manage page</a></h1>

</body>
</html>
