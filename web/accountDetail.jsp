<%@ page import="java.io.PrintWriter" %>
<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.User" %>
<%@ page import="entity.UserDetail" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 3/11/2017
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
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
    <%
        if (session.getAttribute("authorisedUser") == null){
            PrintWriter pw = response.getWriter();
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('You do not have the permission to access this page. Please login.')");
            pw.println("location='initialIndex.jsp';");
            pw.println("</script>");

        }
    %>
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />
</head>
<body>
<%
    //    DecimalFormat df = new DecimalFormat()
    String username = session.getAttribute("username").toString();
    UserDAO user = new UserDAO();
    User a = user.retrieveUserByUsername(username);
    UserDetail ud = user.retrieveUserDetailByUsername(username);
    if (ud == null){
        PrintWriter pw = response.getWriter();
        pw.println("<script type=\"text/javascript\">");
        pw.println("alert('You have not added your details yet.')");
        pw.println("location='homepage.jsp';");
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
                               onfocus="javascript:if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';"
                               onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}"/><br/>
                    </form>
                </div>

            </div>
            <a href="studentDashboard.jsp" class="w3-bar-item w3-button"><i class="fa fa-user"></i> Welcome</a>
            <a href="studentDashboard.jsp" class="w3-bar-item w3-button"><i class="fa fa-user"></i> Dashboard</a>
            <a href="onlineLearningLanding.jsp" class="w3-bar-item w3-button"><i class="fa fa-th"></i> Online Learning</a>
            <div class="dropdown">
                <button class="dropbtn"><i class="fa fa-th"></i> Online Quiz</button>
                <div class="dropdown-content">
                    <a href="quiz1.jsp">Quiz 1</a>
                    <a href="quiz2.jsp">Quiz 2</a>
                </div>
            </div>
            <a href="contactUs.jsp" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> Contact Us</a>
            <a href="/logout" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> Log out</a>


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
    <div class="w3-quarter">
        <a href="#"></a>
        <div class="user ch-img-2" align="center"></div>
        <div id="main">
            <div class="form-style-2" align="left">
                <h1>Your awesome profile</h1>
                <form method="post" enctype="multipart/form-data" action="upload.php">
                    <input type="file" name="images" id="images" multiple/><br><br>
                    <button type="submit" id="btn"><span>&nbsp;Upload Profile Picture!</span></button>
                </form>

                <div id="response"></div>
                <ul id="image-list">

                </ul>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        <script src="upload.js"></script>
    </div>

    <div class="w3-threequarter">

        <div class="w3-table">

            <table style="width:100%">
                <tr>
                    <th>Name:</th>
                    <td> <%=a.getName()%></td>
                </tr>
                <tr>
                    <th>Username:</th>
                    <td><%=a.getUsername()%></td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td> <%=a.getEmail()%></td>
                </tr>
                <tr>
                    <th>Last Browse:</th>
                    <td> <%=ud.getlastBrowse()%></td>
                </tr>
                <tr>
                    <th>Last Login:</th>
                    <td> <%=ud.getlastLogin()%></td>
                </tr>

            </table>

        </div>
        <br>

        <div class="form-style-2" align="left">
            <a href="studentDashboard.jsp"><span>&nbsp;<input type="submit" value="Return"></span></a>

            <a href="updateParticular.jsp"><input type="submit" value="Update particulars"
                                                    align="right"><span>&nbsp;</span></a>

        </div>


    </div>

</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card-2 w3-animate-left w3-hide-medium w3-hide-large"
     style="display:none" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
    <a href="studentDashboard.jsp" onclick="w3_close()" class="w3-bar-item w3-button">WELCOME</a>
    <a href="studentDashboard.jsp" onclick="w3_close()" class="w3-bar-item w3-button">DASHBOARD</a>
    <a href="#Info" onclick="w3_close()" class="w3-bar-item w3-button">INFORMATION</a>
    <a href="#Learn" onclick="w3_close()" class="w3-bar-item w3-button">LEARN</a>
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">CONTACT</a>
</nav>
<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="studentDashboard.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the
        top</a>
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
        border: 1px solid black;
        border-collapse: collapse;
    }

    th, td {
        padding: 5px;
        text-align: left;
    }

    table#t01 {
        width: 100%;
        background-color: #f1f1c1;
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

    .ch-grid {
        margin: 20px 0 0 0;
        padding: 0;
        list-style: none;
        display: block;
        text-align: center;
        width: 100%;
    }

    .ch-grid:after,
    .ch-item {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        overflow: hidden;
        position: relative;
        cursor: default;
        box-shadow: inset 0 0 0 16px rgba(255, 255, 255, 0.6),
        0 1px 2px rgba(0, 0, 0, 0.1);
        transition: all 0.4s ease-in-out;

    }

    .ch-grid:after {
        clear: both;
    }

    .ch-grid li {
        width: 220px;
        height: 220px;
        display: inline-block;
        margin: 20px;
    }

    .ch-img-1 {
        background-image: url(assets/img/02.jpg);
    }

    .ch-img-2 {
        background-image: url(assets/img/03.jpg);
    }

    .ch-img-3 {
        background-image: url(assets/img/04.jpg);
    }

    .ch-img-4 {
        background-image: url(assets/img/05.jpg);
    }

    .ch-info {
        position: absolute;
        background: rgba(63, 147, 147, 0.8);
        width: inherit;
        height: inherit;
        border-radius: 50%;
        overflow: hidden;
        opacity: 0;
        transition: all 0.4s ease-in-out;
        transform: scale(0);
    }

    .ch-info h3 {
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-size: 22px;
        margin: 0 30px;
        padding: 45px 0 0 0;
        height: 140px;
        font-family: 'Open Sans', Arial, sans-serif;
        text-shadow: 0 0 1px #fff,
        0 1px 2px rgba(0, 0, 0, 0.3);
    }

    .ch-info p {
        color: #fff;
        padding: 10px 5px;
        font-style: italic;
        margin: 0 30px;
        font-size: 12px;
        border-top: 1px solid rgba(255, 255, 255, 0.5);
        opacity: 0;
        transition: all 1s ease-in-out 0.4s;
    }

    .ch-info p a {
        display: block;
        color: rgba(255, 255, 255, 0.7);
        font-style: normal;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 9px;
        letter-spacing: 1px;
        padding-top: 4px;
        font-family: 'Open Sans', Arial, sans-serif;
    }

    .ch-info p a:hover {
        color: rgba(255, 242, 34, 0.8);
    }

    .ch-item:hover {
        box-shadow: inset 0 0 0 1px rgba(255, 255, 255, 0.1),
        0 1px 2px rgba(0, 0, 0, 0.1);
    }

    .ch-item:hover .ch-info {
        transform: scale(1);
        opacity: 1;
    }

    .ch-item:hover .ch-info p {
        opacity: 1;
    }

    .form-style-2 {
        max-width: 500px;
        padding: 20px 12px 10px 20px;
        font: 13px Arial, Helvetica, sans-serif;
    }

    .form-style-2-heading {
        font-weight: bold;
        font-style: italic;
        border-bottom: 2px solid #ddd;
        margin-bottom: 20px;
        font-size: 15px;
        padding-bottom: 3px;
    }

    .form-style-2 label {
        display: block;
        margin: 0px 0px 15px 0px;
    }

    .form-style-2 label > span {
        width: 100px;
        font-weight: bold;
        float: left;
        padding-top: 8px;
        padding-right: 5px;
    }

    .form-style-2 span.required {
        color: red;
    }

    .form-style-2 .tel-number-field {
        width: 40px;
        text-align: center;
    }

    .form-style-2 input.input-field {
        width: 48%;

    }

    .form-style-2 input.input-field,
    .form-style-2 .tel-number-field,
    .form-style-2 .textarea-field,
    .form-style-2 .select-field {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        border: 1px solid #C2C2C2;
        box-shadow: 1px 1px 4px #EBEBEB;
        -moz-box-shadow: 1px 1px 4px #EBEBEB;
        -webkit-box-shadow: 1px 1px 4px #EBEBEB;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        padding: 7px;
        outline: none;
    }

    .form-style-2 .input-field:focus,
    .form-style-2 .tel-number-field:focus,
    .form-style-2 .textarea-field:focus,
    .form-style-2 .select-field:focus {
        border: 1px solid #0C0;
    }

    .form-style-2 .textarea-field {
        height: 100px;
        width: 55%;
    }

    .form-style-2 input[type=submit],
    .form-style-2 input[type=button] {
        border: none;
        padding: 8px 15px 8px 15px;
        background: #FF8500;
        color: #fff;
        box-shadow: 1px 1px 4px #DADADA;
        -moz-box-shadow: 1px 1px 4px #DADADA;
        -webkit-box-shadow: 1px 1px 4px #DADADA;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
    }

    .form-style-2 input[type=submit]:hover,
    .form-style-2 input[type=button]:hover {
        background: #EA7B00;
        color: #fff;
    }

    .form-style-2 input.input-field,
    .form-style-2 .tel-number-field,
    .form-style-2 .textarea-field,
    .form-style-2 .select-field {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        border: 1px solid #C2C2C2;
        box-shadow: 1px 1px 4px #EBEBEB;
        -moz-box-shadow: 1px 1px 4px #EBEBEB;
        -webkit-box-shadow: 1px 1px 4px #EBEBEB;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        padding: 7px;
        outline: none;
    }

    .form-style-2 .input-field:focus,
    .form-style-2 .tel-number-field:focus,
    .form-style-2 .textarea-field:focus,
    .form-style-2 .select-field:focus {
        border: 1px solid #0C0;
    }

    .form-style-2 .textarea-field {
        height: 100px;
        width: 55%;
    }

    .form-style-2 input[type=submit],
    .form-style-2 input[type=button] {
        border: none;
        padding: 8px 15px 8px 15px;
        background: #FF8500;
        color: #fff;
        box-shadow: 1px 1px 4px #DADADA;
        -moz-box-shadow: 1px 1px 4px #DADADA;
        -webkit-box-shadow: 1px 1px 4px #DADADA;
        border-radius: 3px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
    }

    .form-style-2 input[type=submit]:hover,
    .form-style-2 input[type=button]:hover {
        background: #EA7B00;
        color: #fff;
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

</script>

</body>
</html>

