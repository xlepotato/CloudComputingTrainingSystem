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
    <title>发展简史</title>
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
        pw.println("location='initialIndex.jsp';");
        pw.println("</script>");

    }
%>
<table width="80%" border="0" align="center">
    <tr>
        <td><h1 align="center">发展简史</h1></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;1983年，太阳电脑（Sun Microsystems）提出“网络是电脑”（“The Network is the Computer”）,2006年3月，亚马逊（Amazon）推出弹性计算云（Elastic Compute Cloud；EC2）服务。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2006年8月9日，Google首席执行官埃里克•施密特（Eric Schmidt）在搜索引擎大会（SES San Jose 2006）首次提出“云计算”（Cloud Computing）的概念。Google“云端计算”源于Google工程师克里斯托弗•比希利亚所做的“Google 101”项目。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2007年10月，Google与IBM开始在美国大学校园，包括卡内基梅隆大学、麻省理工学院、斯坦福大学、加州大学柏克莱分校及马里兰大学等，推广云计算的计划，这项计划希望能降低分布式计算技术在学术研究方面的成本，并为这些大学提供相关的软硬件设备及技术支持（包括数百台个人电脑及BladeCenter与System x服务器，这些计算平台将提供1600个处理器，支持包括Linux、Xen、Hadoop等开放源代码平台）。而学生则可以通过网络开发各项以大规模计算为基础的研究计划。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2008年1月30日，Google宣布在台湾启动“云计算学术计划”，将与台湾台大、交大等学校合作，将这种先进的大规模、快速将云计算技术推广到校园。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2008年7月29日，雅虎、惠普和英特尔宣布一项涵盖美国、德国和新加坡的联合研究计划，推出云计算研究测试床，推进云计算。该计划要与合作伙伴创建6个数据中心作为研究试验平台，每个数据中心配置1400个至4000个处理器。这些合作伙伴包括新加坡资讯通信发展管理局、德国卡尔斯鲁厄大学Steinbuch计算中心、美国伊利诺伊大学香宾分校、英特尔研究院、惠普实验室和雅虎。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2008年8月3日，美国专利商标局网站信息显示，戴尔正在申请“云计算”（Cloud Computing）商标，此举旨在加强对这一未来可能重塑技术架构的术语的控制权。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2010年3月5日，Novell与云安全联盟（CSA）共同宣布一项供应商中立计划，名为“可信任云计算计划（Trusted Cloud Initiative）”。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2010年7月，美国国家航空航天局和包括Rackspace、AMD、Intel、戴尔等支持厂商共同宣布“OpenStack”开放源代码计划，微软在2010年10月表示支持OpenStack与Windows Server 2008 R2的集成；而Ubuntu已把OpenStack加至11.04版本中。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;2011年2月，思科系统正式加入OpenStack，重点研制OpenStack的网络服务。</td>
    </tr>
</table>


</body>
</html>
