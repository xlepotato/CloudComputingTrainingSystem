<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %><%--
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
        String username = session.getAttribute("username").toString();
        UserDAO user = new UserDAO();
        User a = user.retrieveUserByUsername(username);
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
<div class="logo">
    <img src="assets/img/title.jpg" width="90%" height="300" />
</div>

<div xinxi>
    <form action="" method="get">
        <table width="512" border="0">
            <tr>
                <td width="115" id="name">name</td>
                <td width="92" id="lv">lv</td>
                <td width="283" id="email">email</td>
            </tr>
        </table>

    </form>
</div>
<div class="progress">
    progress
</div>
<div class="last">
    <div class="lastBrowse">
        lastBrowse
    </div>

    <div class="lastLogin">
        lastLogin
    </div>
</div>
</body>
</html>
