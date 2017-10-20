<%--
  Created by IntelliJ IDEA.
  User: Aloylim98
  Date: 18/10/2017
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>无标题文档</title>
    <style type="text/css">
        body,td,th {
            color: #FFF;
            font-size: 24px;
        }
        body {
            background-color: #000;
        }
        .back{
            text-align:center;

        }
    </style>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
    <p>
    <%
            if (request.getAttribute("servlet").equals("ex1")){
    %>
    Exercise 1 <br>
    <h3>You have scored <%=request.getAttribute("ex1Score")%></h3>
    </p>
<%
    }
    else if(request.getAttribute("servlet").equals("ex2")){
%>
    Exercise 2 <br>
    <h3>You have scored <%=request.getAttribute("ex2Score")%></h3> <br>
    <h4> Grade : <%=request.getAttribute("grade")%></h4>
    <%
        }
    %>
</form>
<div class="back">
    <a href="homepage.jsp" style="color:#FFF;">返回</a>
</div>
</body>
</html>

