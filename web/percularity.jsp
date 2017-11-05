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
    <title>基本特点</title>
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
        <td><h1 align="center">基本特点</h1></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算是通过使计算分布在大量的分布式计算机上，而非本地计算机或远程服务器中，企业数据中心的运行将与互联网更相似。这使得企业能够将资源切换到需要的应用上，根据需求访问计算机和存储系统。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;好比是从古老的单台发电机模式转向了电厂集中供电的模式。它意味着计算能力也可以作为一种商品进行流通，就像煤气、水电一样，取用方便，费用低廉。最大的不同在于，它是通过互联网进行传输的。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;被普遍接受的云计算特点如下：</td>
    </tr>
    <tr>
        <td><h3>(1) 超大规模</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;“云”具有相当的规模，Google云计算已经拥有100多万台服务器， Amazon、IBM、微软、Yahoo等的“云”均拥有几十万台服务器。企业私有云一般拥有数百上千台服务器。“云”能赋予用户前所未有的计算能力。</td>
    </tr>
    <tr>
        <td><h3>(2) 虚拟化</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算支持用户在任意位置、使用各种终端获取应用服务。所请求的资源来自“云”，而不是固定的有形的实体。应用在“云”中某处运行，但实际上用户无需了解、也不用担心应用运行的具体位置。只需要一台笔记本或者一个手机，就可以通过网络服务来实现我们需要的一切，甚至包括超级计算这样的任务。</td>
    </tr>
    <tr>
        <td><h3>(3) 高可靠性</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;“云”使用了数据多副本容错、计算节点同构可互换等措施来保障服务的高可靠性，使用云计算比使用本地计算机可靠。</td>
    </tr>
    <tr>
        <td><h3>(4) 通用性</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算不针对特定的应用，在“云”的支撑下可以构造出千变万化的应用，同一个“云”可以同时支撑不同的应用运行。</td>
    </tr>
    <tr>
        <td><h3>(5) 高可扩展性</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;“云”的规模可以动态伸缩，满足应用和用户规模增长的需要。</td>
    </tr>
    <tr>
        <td><h3>(6) 按需服务</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;“云”是一个庞大的资源池，你按需购买；云可以像自来水，电，煤气那样计费。</td>
    </tr>
    <tr>
        <td><h3>(7) 极其廉价</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;由于“云”的特殊容错措施可以采用极其廉价的节点来构成云，“云”的自动化集中式管理使大量企业无需负担日益高昂的数据中心管理成本，“云”的通用性使资源的利用率较之传统系统大幅提升，因此用户可以充分享受“云”的低成本优势，经常只要花费几百美元、几天时间就能完成以前需要数万美元、数月时间才能完成的任务。</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算可以彻底改变人们未来的生活，但同时也要重视环境问题，这样才能真正为人类进步做贡献,而不是简单的技术提升。</td>
    </tr>
    <tr>
        <td><h3>(8) 潜在的危险性</h3></td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;云计算服务除了提供计算服务外，还必然提供了存储服务。但是云计算服务当前垄断在私人机构（企业）手中，而他们仅仅能够提供商业信用。对于政府机构、商业机构（特别像银行这样持有敏感数据的商业机构）对于选择云计算服务应保持足够的警惕。一旦商业用户大规模使用私人机构提供的云计算服务，无论其技术优势有多强，都不可避免地让这些私人机构以“数据（信息）”的重要性挟制整个社会。对于信息社会而言，“信息”是至关重要的。另一方面，云计算中的数据对于数据所有者以外的其他用户云计算用户是保密的，但是对于提供云计算的商业机构而言确实毫无秘密可言。所有这些潜在的危险，是商业机构和政府机构选择云计算服务、特别是国外机构提供的云计算服务时，不得不考虑的一个重要的前提。</td>
    </tr>
</table>
</body>
</html>
