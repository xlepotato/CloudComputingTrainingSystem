<%@ page import="java.io.PrintWriter" %>
<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %>
<%@ page import="entity.UserDetail" %>
<%@ page import="wrapper.utility.ExerciseUtility" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 3/11/2017
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title>Chapter 1</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/w3schoolsRef.css">
<link rel="stylesheet" href="assets/css/fontawesomeRef.css">
<style>
    body, h1, h2, h3, h4, h5, h6 {
        font-family: "Raleway", sans-serif
    }

    body, html {
        height: 100%;
        line-height: 1.8;
    }

    .w3-bar .w3-button {
        padding: 16px;
    }
</style>
<head>
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />
</head>
<body>
<%
    //Validation on authorised access
    if (session.getAttribute("authorisedUser") == null){
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('You do not have the permission to access this page. Please login.')");
        pw.println("location='login.jsp';");
        pw.println("</script>");

    }
%>
<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card-2" id="myNavbar">
        <a href="studentHomepage.jsp" class="w3-bar-item w3-button w3-wide"><img border="0" alt="cloudcomputing" src="assets/img/Logo.png" width="200" height="100"></a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">

            <div class="sousuo">
                <div class="wenbenkuang">
                    <form action="#" method="get" onsubmit="return checkReg()" onreset="chearInfo()">
                        <input type="text" name="ss" id="ss" autocomplete="off" value="请输入搜索内容"
                               style="color:gray; width:100%;height:40px; font-size:16px;" ;
                               onfocus="if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';"
                               onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}"/><br/>
                    </form>
                </div>

            </div>
            <a href="studentDashboard.jsp" class="w3-bar-item w3-button"><i class="fa fa-user"></i> Welcome</a>
            <a href="studentDashboard.jsp" class="w3-bar-item w3-button"><i class="fa fa-tachometer"></i> Dashboard</a>
            <a href="onlineLearningLanding.jsp" class="w3-bar-item w3-button"><i class="fa fa-book"></i> Online Learning</a>
            <div class="dropdown">
                <button class="dropbtn"><i class="fa fa-th"></i> Online Quiz</button>
                <div class="dropdown-content">
                    <a href="quiz1.jsp">Quiz 1</a>
                    <a href="quiz2.jsp">Quiz 2</a>
                </div>
            </div>
            <a href="contactUs.jsp" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> Contact Us</a>
            <a href="/logout" class="w3-bar-item w3-button"><i class="fa fa-sign-out"></i> Log out</a>


        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->

        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium"
           onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<!-- Body Section -->
<div class="w3-container" style="padding:128px 16px" id="body">
    <h3 class="w3-center">Chapter 1 : History and Evolution Of Cloud Computing</h3>
    <a href="onlineLearningLanding.jsp">
        <button type="button" class="btn btn-primary btn-arrow-left">Return to Landing</button>
    </a>
    <div align="right"><a href="chapter2.jsp">
        <button type="button" class="btn btn-warning btn-arrow-right">Move to next chapter</button>
    </a></div>
    <br>
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'London')">History Of Cloud Computing</button>
        <button class="tablinks" onclick="openCity(event, 'Paris')">Evolution Of Cloud Computing</button>
    </div>

    <div id="London" class="tabcontent">
        <span onclick="this.parentElement.style.display='none'" class="topright">Click to close tab</span>
        <h3>History Of Cloud Computing</h3>
        <p>
        <table>
            <tr>
                <td>&nbsp;&nbsp;1983年，太阳电脑（Sun Microsystems）提出“网络是电脑”（“The Network is the
                    Computer”）,2006年3月，亚马逊（Amazon）推出弹性计算云（Elastic Compute Cloud；EC2）服务。
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;2006年8月9日，Google首席执行官埃里克•施密特（Eric Schmidt）在搜索引擎大会（SES San Jose 2006）首次提出“云计算”（Cloud
                    Computing）的概念。Google“云端计算”源于Google工程师克里斯托弗•比希利亚所做的“Google 101”项目。
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;2007年10月，Google与IBM开始在美国大学校园，包括卡内基梅隆大学、麻省理工学院、斯坦福大学、加州大学柏克莱分校及马里兰大学等，推广云计算的计划，这项计划希望能降低分布式计算技术在学术研究方面的成本，并为这些大学提供相关的软硬件设备及技术支持（包括数百台个人电脑及BladeCenter与System
                    x服务器，这些计算平台将提供1600个处理器，支持包括Linux、Xen、Hadoop等开放源代码平台）。而学生则可以通过网络开发各项以大规模计算为基础的研究计划。
                </td>
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
                <td>&nbsp;&nbsp;2010年7月，美国国家航空航天局和包括Rackspace、AMD、Intel、戴尔等支持厂商共同宣布“OpenStack”开放源代码计划，微软在2010年10月表示支持OpenStack与Windows
                    Server 2008 R2的集成；而Ubuntu已把OpenStack加至11.04版本中。
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;2011年2月，思科系统正式加入OpenStack，重点研制OpenStack的网络服务。</td>
            </tr>
        </table>
        </p>
    </div>

    <div id="Paris" class="tabcontent">
        <span onclick="this.parentElement.style.display='none'" class="topright">Click to close tab</span>
        <h3>Evolution Of Cloud Computing</h3>
        <p>
        <table>
            <tr>
                <td>&nbsp;&nbsp;云计算主要经历了四个阶段才发展到现在这样比较成熟的水平，这四个阶段依次是电厂模式、效用计算、网格计算和云计算。</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;电厂模式阶段：电厂模式就好比是利用电厂的规模效应，来降低电力的价格，并让用户使用起来更方便，且无需维护和购买任何发电设备。</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;效用计算阶段：在1960年左右，当时计算设备的价格是非常高昂的，远非普通企业、学校和机构所能承受，所以很多人产生了共享计算资源的想法。1961年，人工智能之父麦肯锡在一次会议上提出了“效用计算”这个概念，其核心借鉴了电厂模式，具体目标是整合分散在各地的服务器、存储系统以及应用程序来共享给多个用户，让用户能够像把灯泡插入灯座一样来使用计算机资源，并且根据其所使用的量来付费。但由于当时整个IT产业还处于发展初期，很多强大的技术还未诞生，比如互联网等，所以虽然这个想法一直为人称道，但是总体而言“叫好不叫座”。</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;网格计算阶段：网格计算研究如何把一个需要非常巨大的计算能力才能解决的问题分成许多小的部分，然后把这些部分分配给许多低性能的计算机来处理，最后把这些计算结果综合起来攻克大问题。可惜的是，由于网格计算在商业模式、技术和安全性方面的不足，使得其并没有在工程界和商业界取得预期的成功。</td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;云计算阶段：云计算的核心与效用计算和网格计算非常类似，也是希望IT技术能像使用电力那样方便，并且成本低廉。但与效用计算和网格计算不同的是，2014年在需求方面已经有了一定的规模，同时在技术方面也已经基本成熟了。</td>
            </tr>

        </table>
        </p>
    </div>


</div>


<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="chapter1.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
    <div class="w3-xlarge w3-section">
        <i class="fa fa-facebook-official w3-hover-opacity"><a href="www.facebook.com"></a></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <br>
        © 北京信息职业技术学院. All rights reserved. - 京ICP备16052387号
    </div>
</footer>

<!-- Add Google Maps -->
<script>
    function myMap() {
        myCenter = new google.maps.LatLng(41.878114, -87.629798);
        var mapOptions = {
            center: myCenter,
            zoom: 12, scrollwheel: false, draggable: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);

        var marker = new google.maps.Marker({
            position: myCenter,
        });
        marker.setMap(map);
    }

    // Modal Image Gallery
    function onClick(element) {
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
        var captionText = document.getElementById("caption");
        captionText.innerHTML = element.alt;
    }


    // Toggle between showing and hiding the sidebar when clicking the menu icon
    var mySidebar = document.getElementById("mySidebar");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
        } else {
            mySidebar.style.display = 'block';
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
<style type="text/css">

    table, th, td {
        border: 5px solid black;

    }

    th, td {
        padding: 15px;
    }

    th {
        text-align: left;
    }

    .user {
        display: inline-block;
        width: 150px;
        height: 150px;
        border-radius: 50%;

        object-fit: cover;
    }

    .ch-img-1 {
        background-image: url(assets/img/02.jpg);
    }

    .navbar {
        overflow: hidden;
        background-color: #333;
        font-family: Arial;
    }

    .navbar a {
        float: left;
        font-size: 16px;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .dropdown {
        float: left;
        overflow: hidden;
    }

    .dropdown .dropbtn {
        font-size: 16px;
        border: none;
        outline: none;
        color: black;
        padding: 14px 16px;
        background-color: inherit;
    }

    .navbar a:hover, .dropdown:hover .dropbtn {
        background-color: #D3D3D3;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        float: none;
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    body {
        font-family: "Lato", sans-serif;
    }

    /* Style the tab */
    div.tab {
        overflow: hidden;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
    }

    /* Style the buttons inside the tab */
    div.tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    div.tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current tablink class */
    div.tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        display: none;
        padding: 6px 12px;
        -webkit-animation: fadeEffect 1s;
        animation: fadeEffect 1s;
    }

    /* Fade in tabs */
    @-webkit-keyframes fadeEffect {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes fadeEffect {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    /* Style the close button */
    .topright {
        float: right;
        cursor: pointer;
        font-size: 20px;
    }

    .btn-arrow-right,
    .btn-arrow-left {
        position: relative;
        padding-left: 18px;
        padding-right: 18px;
    }

    .btn-arrow-right {
        padding-left: 36px;
    }

    .btn-arrow-left {
        padding-right: 36px;
    }

    .btn-arrow-right:before,
    .btn-arrow-right:after,
    .btn-arrow-left:before,
    .btn-arrow-left:after { /* make two squares (before and after), looking similar to the button */
        content: "";
        position: absolute;
        top: 5px; /* move it down because of rounded corners */
        width: 22px; /* same as height */
        height: 22px; /* button_outer_height / sqrt(2) */
        background: inherit; /* use parent background */
        border: inherit; /* use parent border */
        border-left-color: transparent; /* hide left border */
        border-bottom-color: transparent; /* hide bottom border */
        border-radius: 0px 4px 0px 0px; /* round arrow corner, the shorthand property doesn't accept "inherit" so it is set to 4px */
        -webkit-border-radius: 0px 4px 0px 0px;
        -moz-border-radius: 0px 4px 0px 0px;
    }

    .btn-arrow-right:before,
    .btn-arrow-right:after {
        transform: rotate(45deg); /* rotate right arrow squares 45 deg to point right */
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
    }

    .btn-arrow-left:before,
    .btn-arrow-left:after {
        transform: rotate(225deg); /* rotate left arrow squares 225 deg to point left */
        -webkit-transform: rotate(225deg);
        -moz-transform: rotate(225deg);
        -o-transform: rotate(225deg);
        -ms-transform: rotate(225deg);
    }

    .btn-arrow-right:before,
    .btn-arrow-left:before { /* align the "before" square to the left */
        left: -11px;
    }

    .btn-arrow-right:after,
    .btn-arrow-left:after { /* align the "after" square to the right */
        right: -11px;
    }

    .btn-arrow-right:after,
    .btn-arrow-left:before { /* bring arrow pointers to front */
        z-index: 1;
    }

    .btn-arrow-right:before,
    .btn-arrow-left:after { /* hide arrow tails background */
        background-color: white;
    }

</style>

<!--End of css && Start of javascript-->

<script type="text/javascript">
    /* When the user clicks on the button,
     toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown menu if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {

            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    };

    function openCity(evt, cityName) {
        <%


         int progressPoint = 1;
         String progressCriteria = "chapter1";

        UserDAO u = new UserDAO();

        String userId = u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId();
        if (u.retrieveProgressByUserIdAndProgressCriteria(userId,progressCriteria)!= null){

        }else{
        UserDetail ud = u.retrieveUserDetailByUsername(session.getAttribute("username").toString()) ;
        int dbProgress = ud.getprogress();

        dbProgress = dbProgress + progressPoint;
        double progressPercent = ExerciseUtility.computeScorePercentage(dbProgress,12);
        boolean success = u.updateProgress(dbProgress,progressPercent,userId);
        if(success){
            u.createProgress(progressCriteria,userId);
        }
        }
        %>
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }

</script>

</body>
</html>

