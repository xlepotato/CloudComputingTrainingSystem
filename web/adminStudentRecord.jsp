<%@ page import="dataManager.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.User" %>
<%@ page import="entity.UserDetail" %><%--
  Created by IntelliJ IDEA.
  User: Aloylim98
  Date: 6/11/2017
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Admin: Student Records</title>
<head>
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
        .button{
            width:100%;
            height:100px;
        }

        .button-left{
            width:40%;
            float:left;

        }
        .button-right{
            width:60%;
            float:right;
        }
        .button-right-left{
            float:left;
            width:50%;
        }
        .button-right-right{
            float:right;
            width:50%;
        }
        .table{
            width:100%;
            float:left;
        }
        .yema{
            width:100%;
            float:left;
            text-align:center;
        }
    </style>
</head>
<body>
<%
    UserDAO user = new UserDAO();
    ArrayList<UserDetail> ulist = user.retrieveAllStudent();

%>
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="adminHome.jsp">Home</a>
    <a href="adminStudentRecord.jsp">Students</a>
    <a href="adminTeacherRecord.jsp">Teachers</a>
    <a href="/logout">Log out</a>
</div>

<div id="main">
    <h2>Student Administration</h2>
    <p>This page is for the administration for students members, functionalities include adding,modifying and deleting data.</p>
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
</div>

<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
    }
</script>

<div class="wenbenkuang">
    <form action="#" method="get" onsubmit="return checkReg()" onreset="chearInfo()">
        <input type="text" name="ss"  id="ss" autocomplete="off"  value="请输入查询关键字" style="color:gray; width:50%;height:40px; font-size:16px;" ; onfocus="javascript:if(this.value == '请输入查询关键字') this.value = ''; this.style.color='gray';" onblur="if(this.value == '') {this.value = '请输入查询关键字'; this.style.color = 'gray';}" />





        <input name="查询" type="button" style="height:40px; width:80px;" value="查询" />

        <div button>
            <div class="button-left">
                <a href="addStudent.jsp"><input name="添加" value="添加" type="button" style="height:40px;width:40%;"/></a> <br />
                <input name="批量导出账号" value="批量导出账号" type="button" style="height:40px;width:80%;"/>
            </div>


            <div class="button-right">
                <div class="button-right-left">
                    <input name="选择文件" value="选择文件" type="button" style="height:30px;"/>
                </div>

                <div class="button-right-right">
                    <input name="批量导入账号" value="批量导入账号" type="button" style="height:40px;width:100%;"/>
                    <a href="#">下载模板</a>
                </div>
            </div>
        </div>

        <div class="table">

            <table cellspacing="0" cellpadding="0" border="1" width="100%">
                <col width="92" span="7" />
                <col width="121" />
                <tr>
                    <td width="92" bgcolor="#999999">序号</td>
                    <td width="92" bgcolor="#999999">姓名</td>
                    <td width="92" bgcolor="#999999">Username</td>
                    <%--<td width="92" bgcolor="#999999">学号</td>--%>
                    <%--<td width="92" bgcolor="#999999">帐号</td>--%>
                    <%--<td width="92" bgcolor="#999999">密码</td>--%>
                    <td width="92" bgcolor="#999999">邮件</td>
                    <%--<td width="92" bgcolor="#999999">微信</td>--%>
                    <%--<td width="92" bgcolor="#999999">QQ号</td>--%>
                    <%--<td width="92" bgcolor="#999999">Last Login</td>--%>
                    <%--<td width="121" bgcolor="#999999">手机号</td>--%>
                    <td width="121" bgcolor="999999">Last Login</td>
                </tr>
                <%
                    for (int i =0; i < ulist.size(); i++){
                %>
                <tr>
                    <td><%=ulist.get(i).getUserId()%></td>
                    <td><%=ulist.get(i).getName()%></td>
                    <td><%=ulist.get(i).getUsername()%></td>
                    <%--<td>s0001</td>--%>
                    <%--<td>*******</td>--%>
                    <td><%=ulist.get(i).getEmail()%></td>
                    <td><%=ulist.get(i).getlastLogin()%></td>
                    <%--<td>456898</td>--%>
                    <%--<td>18201292522</td>--%>
                </tr>
                <%
                    }
                %>
            </table>
        </div>


        <div class="yema">
            <input name="首页" value="首页" type="button" id="首页" />
            <input name="上一页" value="上一页" type="button" id="首页" />
            <a href="#">1</a>
            <input name="下一页" value="下一页" type="button" id="首页" />
            <input name="尾页" value="尾页" type="button" id="首页" />
        </div>
    </form>
</div>
</body>



</html>
