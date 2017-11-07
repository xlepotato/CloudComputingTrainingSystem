<%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 6/11/2017
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dataManager.ExerciseDAO" %>
<%@ page import="entity.Question" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.MCQ" %>
<%@ page import="dataManager.ScoreDAO" %>
<%@ page import="dataManager.UserDAO" %>
<%@ page import="entity.Answer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Quiz Results</title>
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
<%

    ExerciseDAO exercise = new ExerciseDAO();
    ScoreDAO score = new ScoreDAO();
    UserDAO u = new UserDAO();
    //  ArrayList<Exercise> exList = exercise.retrieveAllExercise();
    int exerciseNo = ((Integer) session.getAttribute("exercy"));


    String exer = exercise.retrieveExerciseByExerciseNo(exerciseNo).getexerciseName();

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
                        <input type="text" name="ss"  id="ss" autocomplete="off"  value="请输入搜索内容" style="color:gray; width:100%;height:40px; font-size:16px;" ; onfocus="javascript:if(this.value == '请输入搜索内容') this.value = ''; this.style.color='gray';" onblur="if(this.value == '') {this.value = '请输入搜索内容'; this.style.color = 'gray';}" /><br />
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

        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<!--Body section-->


<form id="result" name="result" method="post" action="">

    <div class="ScoreTable">


        <%
            if (session.getAttribute("servlet").equals("ex1")){
        %>
        <table style="width:100%">
            <caption>测验结果</caption>
            <tr>
                <th>练习号: 1</th>
                <th>练习结果: <%=session.getAttribute("ex1Score")%></th>
                <th>成绩级别: <%=session.getAttribute("grade")%></th>
            </tr>
        </table>
        <%--<tr>--%>
        <%--<td> asd </td>--%>
        <%--<td> aaa </td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
        <%--<td> aa </td>--%>
        <%--<td> sss </td>--%>
        <%--</tr>--%>
        <br>
        <h1> <%=exerciseNo%>.  <%=exer%></h1> <br> <br>
        <%
            //  exerciseNo = exList.get(i).getexerciseNo();
            ArrayList<Question> qnsList = exercise.retrieveQuestion(exerciseNo);
            System.out.println(exerciseNo + " - exerciseNo");
            System.out.println(qnsList.size() + " qnsList size");
            for (int a = 0; a < qnsList.size(); a++ ) {
                qnsList.get(a).getQuestionDetail();
                //    System.out.println(qnsList.get(a).getQuestionDetail() + " details");
                ArrayList<MCQ> mcqList = exercise.retrieveMCQOption(qnsList.get(a).getQuestionId());
        %>
        <%=qnsList.get(a).getQuestionNo()%>. <%=qnsList.get(a).getQuestionDetail()%>
        <%
            String parameterName = "selectedChoice" + qnsList.get(a).getQuestionId();
            for (int m =0; m < mcqList.size(); m++){
        %>
        <br> <p id="question">
            <%
        String idName = parameterName + mcqList.get(m).getOption();
    %>
        <input type="radio" name="<%=parameterName%>" id="<%=idName%>" value="<%=mcqList.get(m).getOption()%>">
            <%=mcqList.get(m).getOption()%>. <%=mcqList.get(m).getOptionDetail()%>


            <%

        if(m == (mcqList.size()-1)){
    %> <br><br>
            <%
                }
            }
            %>
        <br>  Selected choice: <%=score.retrieveStudentAnswerByUserIdAndQnsId(u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId(),qnsList.get(a).getQuestionId()).getChosenOptionLetter()%>
        <br>  Correct answer: <%=qnsList.get(a).getAnswer()%> <br><br> <hr>
        <%
            }

        %>
        </p>

        <%
        }
        else if(session.getAttribute("servlet").equals("ex2")){
        %>
        <table style="width:100%">
            <caption>测验结果</caption>
            <tr>
                <th>练习号: 2</th>
                <th>练习结果: <%=session.getAttribute("ex2Score")%></th>
                <th>成绩级别: <%=session.getAttribute("grade")%></th>
            </tr>
        </table>
        <br>
        <h1> <%=exerciseNo%>.  <%=exer%></h1> <br> <br>
        <%
            //  exerciseNo = exList.get(i).getexerciseNo();
            ArrayList<Question> qnsList = exercise.retrieveQuestion(exerciseNo);
            System.out.println(exerciseNo + " - exerciseNo");
            System.out.println(qnsList.size() + " qnsList size");
            for (int a = 0; a < qnsList.size(); a++ ) {
                qnsList.get(a).getQuestionDetail();
            /*
               *NOTE: questionId in Question table is unique, questionNo is just the numbering of the question.
               questionNo in MCQ table is referring to the questionId in Question table
               For more info, refer to SQL table

            */
                ArrayList<MCQ> mcqList = exercise.retrieveMCQOption(qnsList.get(a).getQuestionId());
        %>
        <%=qnsList.get(a).getQuestionNo()%>. <%=qnsList.get(a).getQuestionDetail()%>
        <%
            String parameterName = "selectedChoice" + qnsList.get(a).getQuestionId();
            for (int m =0; m < mcqList.size(); m++){
        %>
        <br> <p id="question">
            <%
                String idName = parameterName + mcqList.get(m).getOption();
            %>
        <input type="checkbox" id="<%=idName%>" name="<%=parameterName%>" value="<%=mcqList.get(m).getOption()%>"> <%=mcqList.get(m).getOption()%>. <%=mcqList.get(m).getOptionDetail()%>

            <%

                if(m == (mcqList.size()-1)){
            %> <br><br>
            <%
                        }
                    }
                    ArrayList<Answer> ansList = score.retrieveStudentCheckboxAnswerByUserIdAndQnsId(u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId(),qnsList.get(a).getQuestionId());
                    String answer = "";
                    for (int z = 0; z < ansList.size(); z++){
                        answer = answer + ansList.get(z).getChosenOptionLetter();
//                        System.out.println(answer + "this is important yoooo");
                    }
                    %>
        <br>  Selected choice: <%=answer%>
        <br>  Correct answer: <%=qnsList.get(a).getAnswer()%> <br><br> <hr>
        <%
            }

        %>

        </p>
        <%
            }
        %>




    </div>
</form>




<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="studentDashboard.jsp" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
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
    .ch-item {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        overflow: hidden;
        position: relative;
        cursor: default;
        box-shadow:
                inset 0 0 0 16px rgba(255,255,255,0.6),
                0 1px 2px rgba(0,0,0,0.1);
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
        background: rgba(63,147,147, 0.8);
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
        opacity: 0;
        transition: all 1s ease-in-out 0.4s;
    }

    .ch-info p a {
        display: block;
        color: rgba(255,255,255,0.7);
        font-style: normal;
        font-weight: 700;
        text-transform: uppercase;
        font-size: 9px;
        letter-spacing: 1px;
        padding-top: 4px;
        font-family: 'Open Sans', Arial, sans-serif;
    }

    .ch-info p a:hover {
        color: rgba(255,242,34, 0.8);
    }

    .ch-item:hover {
        box-shadow:
                inset 0 0 0 1px rgba(255,255,255,0.1),
                0 1px 2px rgba(0,0,0,0.1);
    }

    .ch-item:hover .ch-info {
        transform: scale(1);
        opacity: 1;
    }

    .ch-item:hover .ch-info p {
        opacity: 1;
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
<%
    System.out.println(session.getCreationTime() + " sessionCreationTime");
    System.out.println(session.getLastAccessedTime() + " sessionLastAccessedTime");
    //to remove unneccessary attributes stored in the session scope
    session.removeAttribute("exNo");

%>
</html>

