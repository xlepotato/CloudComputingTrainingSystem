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
    <title>影响范围</title>
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
        pw.println("location='index.jsp';");
        pw.println("</script>");

    }
%>
<table width="80%" border="0" align="center">
    <tr>
        <td><h1 align="center">影响范围</h1></td>
    </tr>

    <tr>
        <td><h3>折叠软件开发</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算环境下，软件技术、架构将发生显著变化。首先，所开发的软件必须与云相适应，能够与虚拟化为核心的云平台有机结合，适应运算能力、存储能力的动态变化;二是要能够满足大量用户的使用，包括数据存储结构、处理能力;三是要互联网化，基于互联网提供软件的应用;四是安全性要求更高，可以抗攻击，并能保护私有信息，五是可工作于移动终端、手机、网络计算机等各种环境。</td>
    </tr>

    <tr>
        <td>&nbsp;&nbsp;云计算环境下，软件开发的环境、工作模式也将发生变化。虽然，传统的软件工程理论不会发生根本性的变革，但基于云平台的开发工具、开发环境、开发平台将为敏捷开发、项目组内协同、异地开发等带来便利。软件开发项目组内可以利用云平台，实现在线开发，并通过云实现知识积累、软件复用。</td>
    </tr>

    <tr>
        <td>&nbsp;&nbsp;云计算环境下，软件产品的最终表现形式更为丰富多样。在云平台上，软件可以是一种服务，如SAAS，也可以就是一个Web Services，也可能是可以在线下载的应用，如苹果的在线商店中的应用软件，等。</td>
    </tr>
    <tr>
        <td><h3>折叠对软件测试</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;在云计算环境下，由于软件开发工作的变化，也必然对软件测试带来影响和变化。</td>
    </tr>

    <tr>
        <td>&nbsp;&nbsp;软件技术、架构发生变化，要求软件测试的关注点也应做出相对应的调整。软件测试在关注传统的软件质量的同时，还应该关注云计算环境所提出的新的质量要求，如软件动态适应能力、大量用户支持能力、安全性、多平台兼容性等。</td>
    </tr>

    <tr>
        <td>&nbsp;&nbsp;云计算环境下，软件开发工具、环境、工作模式发生了转变，也就要求软件测试的工具、环境、工作模式也应发生相应的转变。软件测试工具也应工作于云平台之上，测试工具的使用也应可通过云平台来进行，而不再是传统的本地方式;软件测试的环境也可移植到云平台上，通过云构建测试环境;软件测试也应该可以通过云实现协同、知识共享、测试复用。</td>
    </tr>

    <tr>
        <td>&nbsp;&nbsp;软件产品表现形式的变化，要求软件测试可以对不同形式的产品进行测试，如Web Services的测试，互联网应用的测试，移动智能终端内软件的测试等。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算的普及和应用，还有很长的道路，社会认可、人们习惯、技术能力，甚至是社会管理制度等都应做出相应的改变，方能使云计算真正普及。但无论怎样，基于互联网的应用将会逐渐渗透到每个人的生活中，对我们的服务、生活都会带来深远的影响。要应对这种变化，我们也很有必要讨论我们业务未来的发展模式，确定我们努力的方向。</td>
    </tr>

</table>
</body>
</html>
