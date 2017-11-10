<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 25/10/2017
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        //Validation on authorised access
        if (session.getAttribute("authorisedUser") == null){
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('You do not have the permission to access this page. Please login.')");
            pw.println("location='login.jsp';");
            pw.println("</script>");

        }
    %>
</head>
<body>

Teacher login page

</body>
</html>
