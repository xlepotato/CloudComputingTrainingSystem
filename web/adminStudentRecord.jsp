<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 25/10/2017
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="assets/js/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/js/jquery.bootgrid.min.css" rel="stylesheet" />
    <script src="assets/js/moderniz.2.8.1.js"></script>
    <style>
        @-webkit-viewport { width: device-width; }
        @-moz-viewport { width: device-width; }
        @-ms-viewport { width: device-width; }
        @-o-viewport { width: device-width; }
        @viewport { width: device-width; }
        body { padding-top: 70px; }

        .column .text { color: #f00 !important; }
        .cell { font-weight: bold; }
    </style>
    <%
        UserDAO user = new UserDAO();
        ArrayList<User> studentList = user.retrieveAllStudent();
    %>
</head>
<body>
<table id="grid-basic" class="table table-condensed table-hover table-striped">
    <thead>
    <caption>Student</caption>
    <tr>
        <th data-column-id="id" data-type="numeric">User ID</th>
        <th data-column-id="sender">Username</th>
        <th data-column-id="received" data-order="desc">Name</th>
        <th data-column-id="email">Email</th>
    </tr>
    </thead>
    <tbody>
    <%
        for(int i = 0; i < studentList.size(); i++) {
    %>
    <tr>
        <td><%=studentList.get(i).getUserId()%></td>
        <td><%=studentList.get(i).getUsername()%></td>
        <td><%=studentList.get(i).getName()%></td>
        <td><%=studentList.get(i).getEmail()%></td>
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



<%--<table id="grid-basic" class="table table-condensed table-hover table-striped">--%>
    <%--<thead>--%>
    <%--<tr>--%>
        <%--<th data-column-id="id" data-type="numeric">ID</th>--%>
        <%--<th data-column-id="sender">Sender</th>--%>
        <%--<th data-column-id="received" data-order="desc">Received</th>--%>
        <%--<th data-column-id="email">Email</th>--%>
    <%--</tr>--%>
    <%--</thead>--%>
    <%--<tbody>--%>
    <%--<%--%>
        <%--for(int i = 0; i < studentList.size(); i++) {--%>
    <%--%>--%>
    <%--<tr>--%>
        <%--<td></td>--%>
        <%--<td>eduardo@pingpong.com</td>--%>
        <%--<td>14.10.2013</td>--%>
        <%--<td></td>--%>
    <%--</tr>--%>
    <%--<%--%>
        <%--}--%>
    <%--%>--%>
    <%--</tbody>--%>
<%--</table>--%>