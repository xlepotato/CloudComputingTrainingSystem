<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 26/10/2017
  Time: 9:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="assets/js/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/js/jquery.bootgrid.min.css" rel="stylesheet" />
    <script src="assets/js/moderniz.2.8.1.js"></script>
    <%
        UserDAO user = new UserDAO();
        ArrayList<User> teacherList = user.retrieveAllTeacher();
    %>
</head>
<body>
<table id="grid-basic" class="table table-condensed table-hover table-striped">
    <thead>
    <caption>Teacher</caption>
    <tr>
        <th data-column-id="id" data-type="numeric">User ID</th>
        <th data-column-id="sender">Username</th>
        <th data-column-id="received" data-order="desc">Name</th>
        <th data-column-id="email">Email</th>
    </tr>
    </thead>
    <tbody>
    <%
        for(int i = 0; i < teacherList.size(); i++) {
    %>
    <tr>
        <td><%=teacherList.get(i).getUserId()%></td>
        <td><%=teacherList.get(i).getUsername()%></td>
        <td><%=teacherList.get(i).getName()%></td>
        <td><%=teacherList.get(i).getEmail()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<script src="assets/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.bootgrid.min.js"></script>
<script src="assets/js/jquery.bootgrid.fa.min.js"></script>
</body>
</html>
