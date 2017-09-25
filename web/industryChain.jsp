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
    <title>云计算产业链特点</title>
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
        <td><h1 align="center">云计算产业链特点</h1></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;一项新技术的产生，特别是具有高社会、市场价值的新技术的产生，在其不断融合市场已有的技术、产业、资源的发展过程中将逐渐形成一个具有自身特点的产业结构。而云计算产业链主要环节的业务模式体现在以下三个方面。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云应用服务提供商与云应用开发商进行技术合作和业务合作，主要的费用包括收入分成方式、应用开发费用以及应用升级、维护费用。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算服务提供商通过租用网络运营商的带宽，按资源的使用量及使用时间来收取用户的费用，使用时间可以是包月或者按照小时数等多种方式进行统计。终端供应商则根据与网络运营商的合作模式获取收入，如果是定制终端则由网络运营商提供分成，非定制终端则通过用户的购买行为产生收入。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算主要产业链环节的业务模式在云计算发展过程中不断丰富和优化。专业咨询人士认为，以这些云计算产业链主要环节为主的云计算产业链发展具有以下几个主要特征。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;政府全力推动，产业链发展日趋均衡，产业链价值维度及信息维度对接日渐成熟。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算产业的发展与各方政府的支持密不可分，各国在新的信息化浪潮下均希望布局云计算占据发展先机，因此从政策的制定和实施都给出了众多优惠以助力云计算的发展。政府在云计算产业链的构建和运作上起到了非常关键的作用。在政府的推动下，产业链发展日趋均衡，产业链各个环节之间的价值交换及信息反馈日益增多，产业内价值流和信息流运行顺畅，产业价值链及信息链向成熟阶段迈进。</td>
    </tr>

</table>
</body>
</html>
