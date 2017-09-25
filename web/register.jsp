<%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 8/9/2017
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <%--<script src='https://www.google.com/recaptcha/api.js'></script>--%>
    <%--<script type="text/javascript">--%>
        <%--var onloadCallback = function() {--%>
            <%--grecaptcha.render('html_element', {--%>
                <%--'sitekey' : '6LdvVjAUAAAAAPeUntB19KPoxro4-FRoSaFJGAbY'--%>
            <%--});--%>
        <%--};--%>
    <%--</script> --%>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <style type="text/css">
        table {
            font-size: 24px;
        }
        th {
            font-size: 36px;
        }
    </style>
</head>

<body>
<form name="zhucebiao" method="post" action="/register">
    <table width="501" border="0" align="center">
        <tr>
            <th height="52" colspan="2" align="center" valign="middle">注册表</th>
        </tr>
        <tr>
            <td width="181" height="45" align="right">用户名：</td>
            <td width="310" height="45"><input type="text" name="username" id="username" style="width:240px;height:30px;" required></td>
        </tr>
        <tr>
            <td height="45" align="right">密码：</td>
            <td height="45"><input type="password" name="password" id="password" style="width:240px;height:30px;" minlength="3" required></td>
        </tr>
        <tr>
            <td height="45" align="right">重复密码：</td>
            <td height="45"><input type="password" name="confirmPassword" id="textfield3" style="width:240px;height:30px;" required></td>
        </tr>
        <tr>
            <td height="45" align="right">姓名：</td>
            <td height="45"><input type="text" name="name" id="name" style="width:240px;height:30px;" required></td>
        </tr>
        <tr>
            <td height="45" align="right">电子邮件</td>
            <td height="45"><input type="text" name="email" id="email" style="width:240px;height:30px;" required></td>
        </tr>
        <tr>
            <td height="45" align="right">验证码：</td>
            <td height="45">

                <img src="/imageGenerate" onclick="this.src='/imageGenerate'">
                <input type="text" name="captcha" value="">

        <%--<img width="90" height="30"> --%>
                <%--<div class="g-recaptcha" data-sitekey="6LevWTAUAAAAABb2HDh9kXHwIveKfKDMr1q_oE5G"></div>--%>
                <%--  data-callback="recaptchaCallback" --%>
            <%--<img src="/jcaptcha">--%>
            <%--<input type='text' name='j_captcha_response' value=''>--%>
            </td>
        </tr>
        <tr>
            <td height="45" align="right"><input type="submit" name="queren" id="queren" value="确认" style="width:70px;height:30px; font-size:18px;" `   ></td>
            <td height="45"><input type="reset" name="chongzhi" id="chongzhi" value="重置" style="width:70px;height:30px; font-size:18px;"></td>
        </tr>
    </table>

</form>
<%--<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"--%>
        <%--async defer>--%>
<%--</script>--%>
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery.validate.js"></script>
<script>
    function recaptchaCallback() {
        var btnSubmit = document.getElementById("queren");

        if ( btnSubmit.isDisabled = true) {
            btnSubmit.disabled = false;
        }
    }
</script>

</body>
</html>