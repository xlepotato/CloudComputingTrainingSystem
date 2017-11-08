<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 20/9/2017
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <style type="text/css">
        *{
            background-size: 100%;
            margin-top: 0;
            margin-right: auto;
            margin-bottom: 0;
            margin-left: auto;
        }

        ul{margin:0;padding:0;}

        .menu{
            text-align:center;
            background-color:#00C;
            height:50px;
            width:100%;
            font-size:20px;
        }

        .menu{
            text-align:center;
            background-color:#00C;
            height:50px;
            width:100%;
            font-size:18px;
        }

        .menu-left{
            width:60%;
            float:left;
        }
        .menu-left ul{


            list-style-type:none;
        }
        .menu-left ul li{
            float:left;
            width:16%;
            text-align:center;

        }
        .menu-left ul li a{
            display:block;
            text-decoration:none;
            height:50px;
            line-height:50px;
        }
        .menu-left ul li a:link, a:visited{
            color:white;
        }
        .menu-left ul li a:hover{
            color:white;
            background-color:#000;
        }

        .menu-left ul li ul{
            position:absolute;
            display:none;
            list-style-type:none;
        }

        .menu-left ul li ul li{
            float:none;
            width:100%;
        }
        .menu-left ul li ul li a{
            border-right:none;
            border-top:none;
            background:#000;
            color:white;
        }
        .menu-left ul li:hover ul{
            display:block;

        }
        .menu-right{
            float:right;
            width:38%;
        }

        .menu-right-left{
            float:left;
            width: 65%;
            height:50px;
        }
        .menu-right-left ul{
            list-style-type:none;

        }
        .menu-right-left ul li{
            float:left;
            width:100%;

        }
        .sousuo{
        }
        .wenbenkuang{
            float:left;
            text-align:left;
            font-size:16px;
            top:5px;
            width:80%;
        }
        .container{
            position:relative;
            float:right;
            text-align:right;
            width:20%;
        }

        .search{
            background-image:url(assets/img/搜索按钮.jpg);
            position:absolute;
            width:70%;
            height:40px;
            top:3px;
            left:30%;
            z-index:99;
            float:right;
        }


        .menu-right-right{
            width:35%;
            float:right;
        }

        .menu-right-right ul{
            list-style-type:none;

        }
        .menu-right-right ul li{
            float:right;
            width:50%;
            text-align:center;
        }
        .menu-right-right ul li a{
            display:block;
            text-decoration:none;
            height:50px;
            line-height:50px;
        }
        .menu-right-right ul li a:link, a:visited{
            color:white;
        }
        .menu-right-right ul li a:hover{
            color:white;
            background-color:#000;
        }

        .menu-right-right ul li ul{
            position:absolute;
            display:none;
            list-style-type:none;

        }

        .menu-right-right ul li ul li{

            float:none;
        }
        .menu-right-right ul li ul li a{
            border-right:none;
            border-top:none;
            background:#000;
            color:white;
        }
        .menu-right-right ul li:hover ul{
            display:block;

        }

        .tupian{
            background-color:#FFF;
            text-align:center;
            height:500px;
            width:80%;
            float:inherit;
        }

        .wenzi{
            color:white;
            text-align:left;
            width:80%;
            height:300px;
        }
        .banquan{
            text-align:center;
            width:100%;
            float:inherit;
            height:30px;
            color:white;
        }

        #dright1{
            width:100%;
            height:500px;

            display:none;
        }
        #dright2{
            width:100%;
            height:500px;

            display:none;
        }

        body {
            background-color: #000;
        }
    </style>

    <script type="text/javascript">
        var NowImg=1;
        var MaxImg=5;
        function show(d1){
            if(Number(d1)){
                clearTimeout(timer);
                NowImg=d1;

            }
            for(var i=1; i<(MaxImg+1); i++){
                if(i==NowImg){
                    document.getElementById('div'+NowImg).style.display='';
                    document.getElementsByTagName("a")[i-1].className='b2';
                }
                else{
                    document.getElementById('div'+i).style.display='none';
                    document.getElementsByTagName("a")[i-1].className='b1';
                }
            }
            if(NowImg==MaxImg)
                NowImg=1;
            else
                NowImg++;
            timer=setTimeout('show()',3000);

        }

        function showHide1(){
            dright1.style.display='block';
            dright2.style.display='none';
        }
        function showHide2(){
            dright2.style.display='block';
            dright1.style.display='none';
        }

    </script>

</head>

<body onLoad="show();">
<%
    if (session.getAttribute("authorisedUser") == null){
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('You do not have the permission to access this page. Please login.')");
        pw.println("location='initialIndex.jsp';");
        pw.println("</script>");

    }
%>
<div class="menu">
    <div class="menu-left">
        <ul>
            <li><a href="#">首页</a>
                <ul>
                    <li><a href="#"></a></li>

                </ul>
            </li>

            <li><a href="#">实训模块</a>
                <ul>
                    <li><a href="history.jsp">发展简史</a></li>
                    <li><a href="technology.jsp">技术含量</a></li>
                    <li><a href="industryChain.jsp">云计算产业链特点</a></li>
                    <li><a href="influenceRange.jsp">影响范围</a></li>
                    <li><a href="evolutionForm.jsp">演化形式</a></li>
                </ul>
            </li>

            <li><a href="onlinePracticeEx2.jsp">在线学习</a>
            </li>

            <li><a href="#">在线测评</a>
                <ul>
                    <li><a href="#"></a></li>
                </ul>
            </li>

            <li><a href="#">远程解答</a>
                <ul>
                    <li><a href="#"></a></li>

                </ul>
            </li>

            <li><a href="#">查看成绩</a>
                <ul>
                    <li><a href="#"></a></li>

                </ul>
            </li>

        </ul>

    </div>
    <div class="menu-right">
        <div class="menu-right-left">
            <ul>

                <li>
                    <div class="sousuo">
                        <div class="wenbenkuang">
                            <form action="#" method="get" onsubmit="return checkReg()" onreset="chearInfo()">
                                <input type="text" name="ss"  id="ss" autocomplete="off"  value="请输入搜索内容" style="color:gray; width:100%;height:40px; font-size:16px;" ; onfocus="if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';" onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}" /><br />
                            </form>
                        </div>
                        <div class="container">
                            <div class="search"></div>
                        </div>

                    </div>
                </li>
            </ul>
        </div>


        <div class="menu-right-right">
            <ul>

                <li><a href="dashboard.jsp">个人中心</a>
                    <ul>
                        <li><a href="#"></a></li>
                    </ul>
                </li>



                <li><a href="/logout">注销</a>

                </li>

            </ul>

        </div>
    </div>
</div>



<div class="tupian"  style="  top:110px; ">


    <img src="assets/img/01.jpg" style="display:none;" id="div1" border="0" width="100%" height="500px"/>

    <img src="assets/img/02.jpg" style="display:none;" id="div2" border="0" width="100%" height="500px"/>

    <img src="assets/img/03.jpg" style="display:none;" id="div3" border="0" width="100%" height="500px"/>

    <img src="assets/img/04.jpg" style="display:none;" id="div4" border="0" width="100%" height="500px"/>

    <img src="assets/img/05.jpg" style="display:none;" id="div5" border="0" width="100%" height="500px"/>

</div>

<div class="wenzi" style="top:610px; font-size:24px; ">
    &nbsp;&nbsp;云计算（cloud computing）是基于互联网的相关服务的增加、使用和交付模式，通常涉及通过互联网来提供动态易扩展且经常是虚拟化的资源。云是网络、互联网的一种比喻说法。过去在图中往往用云来表示电信网，后来也用来表示互联网和底层基础设施的抽象。因此，云计算甚至可以让你体验每秒10万亿次的运算能力，拥有这么强大的计算能力可以模拟核爆炸、预测气候变化和市场发展趋势。用户通过电脑、笔记本、手机等方式接入数据中心，按自己的需求进行运算。
    <br />
    &nbsp;&nbsp;对云计算的定义有多种说法。对于到底什么是云计算，至少可以找到100种解释。现阶段广为接受的是美国国家标准与技术研究院（NIST）定义：云计算是一种按使用量付费的模式，这种模式提供可用的、便捷的、按需的网络访问， 进入可配置的计算资源共享池（资源包括网络，服务器，存储，应用软件，服务），这些资源能够被快速提供，只需投入很少的管理工作，或与服务供应商进行很少的交互。

</div>

<div class="shipin"><center><iframe height=996 width=1020 src='http://player.youku.com/embed/XMjY2NzcyNDIw' frameborder=0 'allowfullscreen' ></iframe></center>
</div>

<div class="banquan">
    <br/>
    © 北京信息职业技术学院. All rights reserved. - 京ICP备16052387号
    <br/>
</div>

</body>
</html>