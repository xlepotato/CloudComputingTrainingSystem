<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 3/11/2017
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title>Online Learning Portal</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <a href="studentHomepage.jsp" class="w3-bar-item w3-button w3-wide">Insert LOGO here</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">

            <div class="sousuo">
                <div class="wenbenkuang">
                    <form action="#" method="get" onsubmit="return checkReg()" onreset="chearInfo()">
                        <input type="text" name="ss" id="ss" autocomplete="off" value="请输入搜索内容"
                               style="color:gray; width:100%;height:40px; font-size:16px;" ;
                               onfocus="javascript:if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';"
                               onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}"/><br/>
                    </form>
                </div>

            </div>
            <a href="studentDashboard.jsp" class="w3-bar-item w3-button"><i class="fa fa-user"></i> Welcome</a>
            <a href="studentDashboard.jsp" class="w3-bar-item w3-button"><i class="fa fa-user"></i> Dashboard</a>
            <a href="onlineLearningLanding.jsp" class="w3-bar-item w3-button"><i class="fa fa-th"></i> Online Learning</a>
            <a href="#contact" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> Contact Us</a>
            <div class="dropdown">
                <button class="dropbtn"><i class="fa fa-th"></i> Online Quiz</button>
                <div class="dropdown-content">
                    <a href="quiz1.jsp">Quiz 1</a>
                    <a href="quiz2.jsp">Quiz 2</a>
                </div>
            </div>
            <a href="#log out" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> Log out</a>
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
    <h3 class="w3-center">Chapter 4 : Influence Range</h3>
    <a href="chapter3.jsp">
        <button type="button" class="btn btn-primary btn-arrow-left">Move to previous chapter</button>
    </a>
    <div align="right"><a href="onlineLearningLanding.jsp">
        <button type="button" class="btn btn-warning btn-arrow-right">End of Module</button>
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
                <td>&nbsp;&nbsp;云计算环境下，软件技术、架构将发生显著变化。首先，所开发的软件必须与云相适应，能够与虚拟化为核心的云平台有机结合，适应运算能力、存储能力的动态变化;二是要能够满足大量用户的使用，包括数据存储结构、处理能力;三是要互联网化，基于互联网提供软件的应用;四是安全性要求更高，可以抗攻击，并能保护私有信息，五是可工作于移动终端、手机、网络计算机等各种环境。</td>
            </tr>

            <tr>
                <td>&nbsp;&nbsp;云计算环境下，软件开发的环境、工作模式也将发生变化。虽然，传统的软件工程理论不会发生根本性的变革，但基于云平台的开发工具、开发环境、开发平台将为敏捷开发、项目组内协同、异地开发等带来便利。软件开发项目组内可以利用云平台，实现在线开发，并通过云实现知识积累、软件复用。</td>
            </tr>

            <tr>
                <td>&nbsp;&nbsp;云计算环境下，软件产品的最终表现形式更为丰富多样。在云平台上，软件可以是一种服务，如SAAS，也可以就是一个Web
                    Services，也可能是可以在线下载的应用，如苹果的在线商店中的应用软件，等。
                </td>
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
        </p>
    </div>

</div>


<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="chapter4.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
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
    }

    function openCity(evt, cityName) {
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

