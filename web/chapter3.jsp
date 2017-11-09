<%@ page import="java.io.PrintWriter" %>
<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.UserDetail" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="wrapper.utility.ExerciseUtility" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 3/11/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title>Chapter 3</title>
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
        pw.println("location='initialIndex.jsp';");
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
    <h3 class="w3-center">Chapter 3 : Industry Chain</h3>
    <a href="chapter2.jsp">
        <button type="button" class="btn btn-primary btn-arrow-left">Move to previous chapter</button>
    </a>
    <div align="right"><a href="chapter4.jsp">
        <button type="button" class="btn btn-warning btn-arrow-right">Move to next chapter</button>
    </a></div>
    <br>

    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'London')">Industry Chain Of Cloud Computing</button>
    </div>

    <div id="London" class="tabcontent">
        <span onclick="this.parentElement.style.display='none'" class="topright">Click to close tab</span>
        <h3>Industry Chain Of Cloud Computing</h3>
        <p>
        <table>
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
        </p>
    </div>

</div>


<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="chapter3.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
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
       String progressCriteria = "chapter3";

      UserDAO u = new UserDAO();

      String userId = u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId();
      if (u.retrieveProgressByUserIdAndProgressCriteria(userId,progressCriteria)!= null){

      }else{
      UserDetail ud = u.retrieveUserDetailByUsername(session.getAttribute("username").toString()) ;
      int dbProgress = ud.getprogress();

      DecimalFormat df = new DecimalFormat("#.00");


      dbProgress = dbProgress + progressPoint;
      String formatPercent = df.format(ExerciseUtility.computeScorePercentage(dbProgress,12));
      double progressPercent = Double.parseDouble(formatPercent);
      System.out.println(progressPercent);
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

