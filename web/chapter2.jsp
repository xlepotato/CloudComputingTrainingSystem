<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 3/11/2017
  Time: 11:38 AM
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
    <h3 class="w3-center">Chapter 2 : Percularity And Technology</h3>
    <a href="chapter1.jsp">
        <button type="button" class="btn btn-primary btn-arrow-left">Move to previous chapter</button>
    </a>
    <div align="right"><a href="chapter3.jsp">
        <button type="button" class="btn btn-warning btn-arrow-right">Move to next chapter</button>
    </a></div>
    <br>

    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'London')">Percularity Of Cloud Computing</button>
        <button class="tablinks" onclick="openCity(event, 'Paris')">Technology Of Cloud Computing</button>
    </div>

    <div id="London" class="tabcontent">
        <span onclick="this.parentElement.style.display='none'" class="topright">Click to close tab</span>
        <h3>Percularity Of Cloud Computing</h3>
        <p>
        <table>
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
                <td>&nbsp;&nbsp;“云”具有相当的规模，Google云计算已经拥有100多万台服务器，
                    Amazon、IBM、微软、Yahoo等的“云”均拥有几十万台服务器。企业私有云一般拥有数百上千台服务器。“云”能赋予用户前所未有的计算能力。
                </td>
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
        </p>
    </div>

    <div id="Paris" class="tabcontent">
        <span onclick="this.parentElement.style.display='none'" class="topright">Click to close tab</span>
        <h3>Technology Of Cloud Computing</h3>
        <p>
        <table>
            <tr>
                <td><h3>1、编程模式</h3></td>
            </tr>

            <tr>
                <td><h3>2、海量数据分布存储技术</h3></td>
            </tr>

            <tr>
                <td><h3>3、海量数据管理技术</h3></td>
            </tr>

            <tr>
                <td><h3>4、虚拟化技术</h3></td>
            </tr>

            <tr>
                <td><h3>5、云计算平台管理技术</h3></td>
            </tr>

        </table>
        </p>
    </div>


</div>


<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="chapter2.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
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

