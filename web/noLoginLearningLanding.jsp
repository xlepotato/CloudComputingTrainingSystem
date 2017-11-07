<%--
  Created by IntelliJ IDEA.
  User: Aloylim98
  Date: 6/11/2017
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Online Learning Portal</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
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

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card-2" id="myNavbar">
        <a href="index.jsp" class="w3-bar-item w3-button w3-wide"><img border="0" alt="cloudcomputing" src="assets/img/Logo.png" width="200" height="100"></a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <div class="sousuo">
                <div class="wenbenkuang">
                    <form action="#" method="get" onsubmit="return checkReg()" onreset="chearInfo()">
                        <input type="text" name="ss"  id="ss" autocomplete="off"  value="请输入搜索内容" style="color:gray; width:100%;height:40px; font-size:16px;" ; onfocus="javascript:if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';" onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}" /><br />
                    </form>
                </div>
            </div>

            <a href="index.jsp" class="w3-bar-item w3-button"><i class="fa fa-user"></i> Welcome</a>
            <a href="noLoginLearningLanding.jsp" class="w3-bar-item w3-button"><i class="fa fa-th"></i> Online Learning</a>
            <a href="login.jsp" class="w3-bar-item w3-button"><i class="fa fa-th"></i> Log in</a>
            <a href="registration.jsp" class="w3-bar-item w3-button"><i class="fa fa-th"></i> Register</a>


        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->

        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>

</div>

<!-- Body Section -->
<div class="w3-container" style="padding:128px 16px" id="body">
    <span class="w3-large w3-hide-small"></span><br>
    <span class="w3-large w3-hide-small"></span><br>
    <h3 class="w3-center">Available Chapters</h3>
    <ul class="ch-grid">
        <li>
            <div class="ch-item">
                <div class="ch-info">
                    <h3>History  Evolution</h3>
                    <p>by Cloud Computing <a href="chapter1.jsp">Click to Start</a></p>
                </div>
                <div class="ch-thumb ch-img-1"></div>
            </div>
        </li>
        <li>
            <div class="ch-item">
                <div class="ch-info">
                    <h3>Special Technology</h3>
                    <p>by Cloud Computing <a href="chapter2.jsp">Click to Start</a></p>
                </div>
                <div class="ch-thumb ch-img-2"></div>
            </div>
        </li>
        <li>
            <div class="ch-item">
                <div class="ch-info">
                    <h3>Industry Chain</h3>
                    <p>by Cloud Computing <a href="chapter3.jsp">Click to Start</a></p>
                </div>
                <div class="ch-thumb ch-img-3"></div>
            </div>
        </li>
        <li>
            <div class="ch-item">
                <div class="ch-info">
                    <h3>Influence Range</h3>
                    <p>by Cloud Computing <a href="chapter4.jsp">Click to Start</a></p>
                </div>
                <div class="ch-thumb ch-img-4"></div>
            </div>
        </li>
    </ul>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="noLoginLearningLanding.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
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
    function myMap()
    {
        myCenter=new google.maps.LatLng(41.878114, -87.629798);
        var mapOptions= {
            center:myCenter,
            zoom:12, scrollwheel: false, draggable: false,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };
        var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions);

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
        overflow: visible;
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
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
    .ch-item:before {
        content: '';
        display: table;
    }

    .ch-item {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        position: relative;
        cursor: default;
        box-shadow: 0 1px 3px rgba(0,0,0,0.2);
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

    .ch-thumb {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        overflow: hidden;
        position: absolute;
        box-shadow: inset 0 0 0 15px rgba(255,255,255, 0.5);
        transform-origin: 95% 40%;
        transition: all 0.3s ease-in-out;
    }

    .ch-thumb:after {
        content: '';
        width: 8px;
        height: 8px;
        position: absolute;
        border-radius: 50%;
        top: 40%;
        left: 95%;
        margin: -4px 0 0 -4px;
        background: radial-gradient(ellipse at center, rgba(14,14,14,1) 0%,rgba(125,126,125,1) 100%);
        box-shadow: 0 0 1px rgba(255,255,255,0.9);
    }

    .ch-img-1 {
        background-image: url(image/Number1.png);
        z-index: 12;
    }

    .ch-img-2 {
        background-image: url(image/Number2.png);
        z-index: 11;
    }

    .ch-img-3 {
        background-image: url(image/Number3.png);
        z-index: 10;
    }
    .ch-img-4 {
        background-image: url(image/Number4.png);
        z-index: 9;
    }

    .ch-info {
        position: absolute;
        width: inherit;
        height: inherit;
        border-radius: 50%;
        overflow: hidden;
        background: #c9512e url(image/03.jpg);
        box-shadow: inset 0 0 0 5px rgba(0,0,0,0.05);
    }

    .ch-info h3 {
        color: #fff;
        text-transform: uppercase;
        position: relative;
        letter-spacing: 2px;
        font-size: 18px;
        margin: 0 60px;
        padding: 22px 0 0 0;
        height: 85px;
        font-family: 'Open Sans', Arial, sans-serif;
        text-shadow:
                0 0 1px #fff,
                0 1px 2px rgba(0,0,0,0.3);
    }

    .ch-info h6 {
        color: #fff;
        text-transform: uppercase;
        position: relative;
        letter-spacing: 2px;
        font-size: 10px;
        margin: 0 60px;
        padding: 22px 0 0 0;
        height: 85px;
        font-family: 'Open Sans', Arial, sans-serif;
        text-shadow:
                0 0 1px #fff,
                0 1px 2px rgba(0,0,0,0.3);
    }

    .ch-info p {
        color: #fff;
        padding: 10px 5px;
        font-style: italic;
        margin: 0 30px;
        font-size: 12px;
        border-top: 1px solid rgba(255,255,255,0.5);
    }

    .ch-info p a {
        display: block;
        color: #333;
        width: 80px;
        height: 80px;
        background: rgba(255,255,255,0.3);
        border-radius: 50%;
        color: #fff;
        font-style: normal;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 9px;
        letter-spacing: 1px;
        padding-top: 24px;
        margin: 7px auto 0;
        font-family: 'Open Sans', Arial, sans-serif;
        opacity: 0;
        transition:
                transform 0.3s ease-in-out 0.2s,
                opacity 0.3s ease-in-out 0.2s,
                background 0.2s linear 0s;
        transform: translateX(60px) rotate(90deg);
    }

    .ch-info p a:hover {
        background: rgba(255,255,255,0.5);
    }

    .ch-item:hover .ch-thumb {
        box-shadow: inset 0 0 0 15px rgba(255,255,255, 0.5), 0 1px 3px rgba(0,0,0,0.2);
        transform: rotate(-110deg);
    }
    .ch-item:hover .ch-info p a{
        opacity: 1;
        transform: translateX(0px) rotate(0deg);
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
    window.onclick = function(event) {
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
