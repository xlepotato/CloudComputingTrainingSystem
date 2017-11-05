<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Aloylim98
  Date: 13/9/2017
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>技术含量</title>
    <style type="text/css">
        body,td,th {
            color: #FFF;
            font-size: 24px;
        }
        body {
            background-color: #000;
        }
    </style>
</head>

<body>
<%
    if (session.getAttribute("authorisedUser") == null){
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('You do not have the permission to access this page. Please login.')");
        pw.println("location='initialIndex.jsp';");
        pw.println("</script>");

    }
%>
<table width="80%" border="0" align="center">
    <tr>
        <td><h1 align="center">技术含量</h1></td>
    </tr>

    <tr>
        <td><h3>1、编程模式</h3></td>
    </tr>

    <tr>
        <td><h3>2、海量数据分布存储技术</h3></td>
    </tr>

    <tr>
        <td><h3>3、海量数据管理技术</h3></td>
    </tr>

    <tr>
        <td><h3>4、虚拟化技术</h3></td>
    </tr>

    <tr>
        <td><h3>5、云计算平台管理技术</h3></td>
    </tr>

</table>
</body>
</html>

