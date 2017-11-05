<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %>
<%@ page import="entity.UserDetail" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 11/9/2017
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <%
        if (session.getAttribute("authorisedUser") == null){
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('You do not have the permission to access this page. Please login.')");
            pw.println("location='initialIndex.jsp';");
            pw.println("</script>");

        }
    %>
</head>
<style type="text/css">

    .logo{
        width:100%;
        height:300px;
        text-align:center;
    }
    .xinxi{
        width:90%;
        height:40px;
        text-align:left;
    }

    .progress{
        width:90%;
        height:400px;
        text-align:left;
    }

    .last{
        width:90%;
        height:400px;
        text-align:left;
    }
    .lastBrowse{
        width:45%;
        float:left;
    }
    .lastLogin{
        width:45%;
        float:right;
    }

</style>
<body>
<%
//    DecimalFormat df = new DecimalFormat()
    String username = session.getAttribute("username").toString();
    UserDAO user = new UserDAO();
    User a = user.retrieveUserByUsername(username);
    UserDetail ud = user.retrieveUserDetailByUsername(username);
    if (ud == null){
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('You have not added your details yet.')");
        pw.println("location='homepage.jsp';");
        pw.println("</script>");
    }
%>
<div class="logo">
    <img src="assets/img/title.jpg" width="90%" height="300" />
</div>

<div xinxi>
    <form action="" method="get">
        <table width="512" border="0">
            <tr>
                <td width="115" id="name">Name:  <%=a.getName()%></td>
                <td width="92" id="lv">Lv: <%=ud.getuserLevel()%> </td>
                <td width="283" id="email">Email: <%=a.getEmail()%></td>
            </tr>
        </table>

    </form>
</div>
<div class="progress">
    Progress
    <%=ud.getprogress()%>
</div>
<div class="totalScore">
    Total Score:
    <%=Integer.valueOf((int) ud.getTotalScore())%> / <%=ud.getTotalScoreOverall()%>
</div>
<div class="last">
    <div class="lastBrowse">
        Your Last Browse is <%=ud.getlastBrowse()%>
    </div>

    <div class="lastLogin">
        Last Login @ <%=ud.getlastLogin()%>
    </div>
</div>
</body>

</html>
