<%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 5/9/2017
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>无标题文档</title>
  <style type="text/css">
    *{
      margin:0 auto;

    }

    .background{
      height:744px;
      width:100%;
      background-image:url(assets/img/denglu.jpg);
      background-size:100%;

    }

    #dl{
      float:left;
      color:#FFF;
      height:220px;
      width:300px;
      text-align:center;
    }

    #dl ul{
      float:left;
      width:70px;


    }

    #dl ul a{
      background-color:blue;
      color:white;
    }

    .kongbai{
      height:150px;
    }

  </style>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script>
        $.validator.setDefaults({
            submitHandler: function() {
                alert("submitted!");
            }
        });

        $().ready(function() {
            // validate the comment form when it is submitted
            $("#loginForm").validate();
        });
    </script>
  </head>
  <body background="assets/img/yun.jpg">

  <div class="background">

    <div class="kongbai">
    </div>
    <div id="dl"  >
      <form class="formValidation" name="loginform" id="loginForm" method="post" action="/login">
        <fieldset>
          <legend align="center">用户登录</legend>
          <br /><br />
          <label>用户名：</label>
          <input type="text" name="username" id="myname" required /><br /><br />
          <label>密&nbsp;码：</label>
          <input type="password" name="password" id="mypwd" required /><br /><br /><br />
          <input type="submit" value="登录" style="background:#00F; color:#FFF; width:50px; height:30px; font-size:15px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置" style="background:#00F; color:#FFF; width:50px; height:30px; font-size:15px;" />
          <br /><br />
          <ul><a href="register.jsp">注册</a></ul>
          <ul><a href="#">游客通道</a></ul>
        </fieldset>
      </form>
    </div>
  </div>


  </body>
</html>
