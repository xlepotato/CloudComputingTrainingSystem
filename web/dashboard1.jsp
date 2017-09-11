<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 6/9/2017
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Dashboard </h1>
<p>
    Welcome, <%=session.getAttribute("username")%>

    <%
        String username = session.getAttribute("username").toString();
        UserDAO user = new UserDAO();
        User a = user.retrieveUserByUsername(username);
    %>

    User ID: <%=a.getUserId()%>
    Name: <%=a.getName()%>
    Email: <%=a.getEmail()%>



</p>

</body>
</html>
