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
    <title>Cloud Computing Training System</title>
    <style type="text/css">
      *{
        margin:0 auto;

      }

      .background{
        height:744px;
        width:1200px;
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
  </head>
  <body background="assets/img/yun.jpg">

  <div class="background">

    <div class="kongbai">
    </div>
    <div id="dl"  >
      <form name="loginform" method="post" action="/register">
        <fieldset>
          <legend align="center">用户登录</legend>
          <br /><br />
          <label>用户名：</label>
          <input type="text" name="" id="myname" /><br /><br />
          <label>密&nbsp;码：</label>
          <input type="password" name="" id="mypwd" /><br /><br /><br />
          <input type="submit" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置"/>
          <br /><br />
          <ul><a href="#">注册</a></ul>
          <ul><a href="#">游客通道</a></ul>
        </fieldset>
      </form>
    </div>
  </div>


  </body>
</html>
