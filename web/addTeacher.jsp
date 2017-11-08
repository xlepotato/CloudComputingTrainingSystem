<%--
  Created by IntelliJ IDEA.
  User: Aloylim98
  Date: 8/11/2017
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Add Student Record</title>
<head>
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />
</head>
<body>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="adminHome.jsp">Home</a>
    <a href="adminStudentRecord.jsp">Students</a>
    <a href="adminTeacherRecord.jsp">Teachers</a>
    <a href="/logout">Log out</a>
</div>

<div id="main">
    <h2>Adding new Teachers</h2>
    <p>This page is for the administrator to add new Teachers</p>
    <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
</div>

<div class="w3-container" style="padding:128px 16px" id="body" align="center">
    <div class="form-style-2 " align="left">
        <table style="width:100%">
            <tr>
                <th>
                    <div class="form-style-2-heading">Register a new Teacher</div>
                    <form action="/adminAdd" method="post" accept-charset="utf-8">
                        <label for><span>用户名： <span class="required"></span></span><input type="text"
                                                                                          class="input-field"
                                                                                          name="username"
                                                                                          value=""/></label>

                        <label for><span>密码: <span class="required"></span></span><input type="password"
                                                                                         class="input-field"
                                                                                         name="password"
                                                                                         value=""/></label>

                        <label for><span>重复密码： <span class="required"></span></span><input
                                type="password" class="input-field" name="confirmPassword" value=""/></label>

                        <label for><span>姓名： <span class="required"></span></span><input type="text"
                                                                                         class="input-field"
                                                                                         name="name"
                                                                                         value=""/></label>
                        <%--<label for><span>电子邮件: <span class="required"></span></span><input type="email"--%>
                                                                                           <%--class="input-field"--%>
                                                                                           <%--name="email"--%>
                                                                                           <%--value=""/></label>--%>
                        <%--<label for><span>验证码: <span class="required"></span></span>--%>
                            <%--<img src="/imageGenerate" onclick="this.src='/imageGenerate'">--%>
                            <%--<input type="text" class="input-field"--%>
                                   <%--name="captcha"--%>
                                   <%--value=""/></label>--%>


                        <input type="hidden"  name="userType" value="teacher" />
                        <label><span>&nbsp;</span><input type="submit" value="Submit"/></label>


                    </form>
                </th>
            </tr>
        </table>
        <br>
        <br>
        <a href="adminTeacherRecord.jsp"><input type="button" value="Return to Teacher Administration Page"/><span>&nbsp;</span></a>
        <span><a href="adminHome.jsp"><input type="button" value="Return to Home Page"/>&nbsp;</a></span>
    </div>


</div>
</body>

<style>
    body, h1, h2, h3, h4, h5, h6 {
        font-family: "Raleway", sans-serif
    }

    body, html {
        height: 100%;
        line-height: 1.8;
    }

    .w3-bar .w3-button {
        padding: 16px;
    }
    .form-style-2 {
        max-width: 500px;
        padding: 20px 12px 10px 20px;
        font: 13px Arial, Helvetica, sans-serif;
    }

    .form-style-2-heading {
        font-weight: bold;
        font-style: italic;
        border-bottom: 2px solid #ddd;
        margin-bottom: 20px;
        font-size: 15px;
        padding-bottom: 3px;
    }

    .form-style-2 label {
        display: block;
        margin: 0px 0px 15px 0px;
    }

    .form-style-2 label > span {
        width: 100px;
        font-weight: bold;
        float: left;
        padding-top: 8px;
        padding-right: 5px;
    }

    .form-style-2 span.required {
        color: red;
    }

    .form-style-2 .tel-number-field {
        width: 50px;
        text-align: center;
    }

    .form-style-2 input.input-field {
        width: 48%;

    }

    .form-style-2 input.input-field,
    .form-style-2 .tel-number-field,
    .form-style-2 .textarea-field,
    .form-style-2 .select-field {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        border: 1px solid #C2C2C2;
        box-shadow: 1px 1px 4px #EBEBEB;
        -moz-box-shadow: 1px 1px 4px #EBEBEB;
        -webkit-box-shadow: 1px 1px 4px #EBEBEB;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        padding: 7px;
        outline: none;
    }

    .form-style-2 .input-field:focus,
    .form-style-2 .tel-number-field:focus,
    .form-style-2 .textarea-field:focus,
    .form-style-2 .select-field:focus {
        border: 1px solid #0C0;
    }

    .form-style-2 .textarea-field {
        height: 100px;
        width: 55%;
    }

    .form-style-2 input[type=submit],
    .form-style-2 input[type=button] {
        border: none;
        padding: 8px 15px 8px 15px;
        background: #FF8500;
        color: #fff;
        box-shadow: 1px 1px 4px #DADADA;
        -moz-box-shadow: 1px 1px 4px #DADADA;
        -webkit-box-shadow: 1px 1px 4px #DADADA;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
    }

    .form-style-2 input[type=submit]:hover,
    .form-style-2 input[type=button]:hover {
        background: #EA7B00;
        color: #fff;
    }

    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }

    th, td {
        padding: 5px;
        text-align: left;
    }

    table#t01 {
        width: 100%;
        background-color: #f1f1c1;
    }
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
</style>

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
</html>

