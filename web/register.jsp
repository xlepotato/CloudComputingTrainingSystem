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
</head>

<body>
<form name="zhucebiao" method="post" action="/register">
    <table width="400" border="1" align="center">
        <tr>
            <th colspan="2" align="center">注册表</th>
        </tr>
        <tr>
            <td width="192" align="right">用户名：</td>
            <td width="192"><input type="text" name="username" id="username" required></td>
        </tr>
        <tr>
            <td align="right">密码：</td>
            <td><input type="password" name="password" id="password" minlength="3" required></td>
        </tr>
        <tr>
            <td align="right">重复密码：</td>
            <td><input type="password" name="confirmPassword" id="textfield3" required></td>
        </tr>
        <tr>
            <td align="right">姓名：</td>
            <td><input type="text" name="name" id="name" required></td>
        </tr>
        <tr>
            <td align="right">电子邮件</td>
            <td><input type="text" name="email" id="email" required></td>
        </tr>
        <tr>
            <td align="right">验证码：</td>
            <td>
                <%--<img width="90" height="30"> --%>
                <div class="g-recaptcha" data-sitekey="6LevWTAUAAAAABb2HDh9kXHwIveKfKDMr1q_oE5G" data-callback="recaptchaCallback"></div>
            <%--<img src="/jcaptcha">--%>
            <%--<input type='text' name='j_captcha_response' value=''>--%>
            </td>
        </tr>
        <tr>
            <td align="right"><input type="submit" name="queren" id="queren" value="确认" disabled></td>
            <td><input type="reset" name="chongzhi" id="chongzhi" value="重置"></td>
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