<%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 11/9/2017
  Time: 11:39 AM
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
        .menu{
            text-align:center;
            background-color:#00C;
            height:50px;
            width:100%;
            font-size:20px;
        }

        .menu-left{
            width:80%;
            float:left;
        }
        .menu-left ul{


            list-style-type:none;
        }
        .menu-left ul li{
            float:left;
            width:100px;

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
        }

        .menu-left ul li ul li{
            float:left;
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
            width:20%;
            float:right;
        }

        .menu-right ul{
            list-style-type:none;

        }
        .menu-right ul li{
            float:left;
            width:100px;

        }
        .menu-right ul li a{
            display:block;
            text-decoration:none;
            height:50px;
            line-height:50px;
        }
        .menu-right ul li a:link, a:visited{
            color:white;
        }
        .menu-right ul li a:hover{
            color:white;
            background-color:#000;
        }

        .menu-right ul li ul{
            position:absolute;
            display:none;
        }

        .menu-right ul li ul li{
            float:left;
        }
        .menu-right ul li ul li a{
            border-right:none;
            border-top:none;
            background:#000;
            color:white;
        }
        .menu-right ul li:hover ul{
            display:block;

        }

        .sousuo{
            text-align:center;
            width: 80%;
            height:60px;

        }
        .wenbenkuang{
            float:left;
            text-align:right;
            width:700px;
            font-size:20px;
        }
        .container{
            position:relative;
            float:right;
            text-align:left;
            width:540px;
        }
        .sousuo form {
            font-size: 24px;
        }
        .search{
            background-image:url(../image/%E6%90%9C%E7%B4%A2%E6%8C%89%E9%92%AE.jpg);
            position:absolute;
            width:50px;
            height:40px;
            top:4px;
            left:80px;
            z-index:99;
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
                    <li><a href="#"></a></li>

                </ul>
            </li>

            <li><a href="#">在线学习</a>
                <ul>
                    <li><a href="#"></a></li>

                </ul>
            </li>

            <li><a href="#">在线测评</a>
                <ul>
                    <li><a href="#"></a></li>
                </ul>
            </li>

            <li><a href="#">远程解答</a>
                <ul>
                    <li><a href="#">vdvsddv</a></li>

                </ul>
            </li>



        </ul>

    </div>

    <div class="menu-right">
        <ul>

            <li><a href="#">个人中心</a>
                <ul>
                    <li><a href="#"></a></li>
                </ul>
            </li>



            <li><a href="#">注销</a>

            </li>

        </ul>

    </div>

</div>

<div class="sousuo">
    <div class="wenbenkuang">
        <form action="#" method="get" onsubmit="return checkReg()" onreset="chearInfo()">
            <input type="text" name="ss"  id="ss" autocomplete="off"  value="请输入搜索内容" style="color:gray;width:400px;height:50px; font-size:24px;" ; onfocus="javascript:if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';" onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}" /><br />
        </form>
    </div>
    <div class="container">
        <div class="search"></div>
    </div>

</div>

<div class="tupian"  style="  top:110px; ">


    <img src="../image/01.jpg" style="display:none;" id="div1" border="0" width="100%" height="500px"/>

    <img src="../image/02.jpg" style="display:none;" id="div2" border="0" width="100%" height="500px"/>

    <img src="../image/03.jpg" style="display:none;" id="div3" border="0" width="100%" height="500px"/>

    <img src="../image/04.jpg" style="display:none;" id="div4" border="0" width="100%" height="500px"/>

    <img src="../image/05.jpg" style="display:none;" id="div5" border="0" width="100%" height="500px"/>

</div>

<div class="wenzi" style="top:610px; font-size:24px; ">
    &nbsp;&nbsp;云计算（cloud computing）是基于互联网的相关服务的增加、使用和交付模式，通常涉及通过互联网来提供动态易扩展且经常是虚拟化的资源。云是网络、互联网的一种比喻说法。过去在图中往往用云来表示电信网，后来也用来表示互联网和底层基础设施的抽象。因此，云计算甚至可以让你体验每秒10万亿次的运算能力，拥有这么强大的计算能力可以模拟核爆炸、预测气候变化和市场发展趋势。用户通过电脑、笔记本、手机等方式接入数据中心，按自己的需求进行运算。
    <br />
    &nbsp;&nbsp;对云计算的定义有多种说法。对于到底什么是云计算，至少可以找到100种解释。现阶段广为接受的是美国国家标准与技术研究院（NIST）定义：云计算是一种按使用量付费的模式，这种模式提供可用的、便捷的、按需的网络访问， 进入可配置的计算资源共享池（资源包括网络，服务器，存储，应用软件，服务），这些资源能够被快速提供，只需投入很少的管理工作，或与服务供应商进行很少的交互。

</div>

<div class="shipin">
</div>

</body>
</html>