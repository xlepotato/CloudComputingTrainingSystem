<%@ page import="dataManager.ExerciseDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Exercise" %>
<%@ page import="entity.Question" %><%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 25/9/2017
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        body,td,th {
            color: #FFF;
            font-size: 24px;
        }
        body {
            background-color: #000;
        }
        .back{
            text-align:center;

        }
    </style>
</head>
<body>
<%
    ExerciseDAO exercise = new ExerciseDAO();
    ArrayList<Exercise> exList = exercise.retrieveAllExercise();

%>
<form action="" method="get">
    <table width="80%" border="0" align="center">
        <tr>
            <td><h1 align="center">在线练习</h1></td>
        </tr>
        <%--<%--%>
            <%--System.out.println(exList.size()+ "size");--%>
            <%--for (int i = 0; i < exList.size(); i ++ ){--%>
                <%--System.out.println(exList.get(i).getexerciseName());--%>
        <%--%>--%>
        <%--<tr>--%>
            <%--<%--%>
                <%--int exerciseNo = exList.get(i).getexerciseNo();--%>
                <%--ArrayList<Question> qnsList = exercise.retrieveQuestion(exerciseNo);--%>
                <%--System.out.println(exerciseNo + "exerciseNo");--%>
                <%--for (int a =0; a < qnsList.size(); i++ ){--%>
                    <%--System.out.println(qnsList.size());--%>
            <%--%>--%>
        <%--<td>--%>
            <%--<%--%>
                <%--qnsList.get(a).getquestionDetails();--%>
            <%--%>--%>
        <%--</td>--%>
            <%--<%--%>
                <%--}--%>
            <%--%>--%>
        <%--</tr>--%>
        <%--<%--%>
            <%--}--%>
        <%--%>--%>

        <%--===========================--%>

        <%--<tr>--%>
            <%--<td>--%>
                <%--Question Details here--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--Another question detail--%>
            <%--</td>--%>

            <%--<td>--%>
                <%--Another question detail e1--%>
            <%--</td>--%>

        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--Another another question detail e2--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--Qns e2 2--%>
            <%--</td>--%>
        <%--</tr>--%>
    </table>
    <%
        String exer = "";
        int exerciseNo = 0;
    for (int i = 0; i < exList.size(); i ++ ) {
        System.out.println(exList.get(i).getexerciseName() + " exercise Name !! ");

        exer =  exList.get(i).getexerciseName();
        %>
    <br>
    <%=exList.get(i).getexerciseNo()%>. Exercise Name: <%=exer%> <br> <br>
    <%
        exerciseNo = exList.get(i).getexerciseNo();
        ArrayList<Question> qnsList = exercise.retrieveQuestion(exerciseNo);
        System.out.println(exerciseNo + " - exerciseNo");
        System.out.println(qnsList.size() + " qnsList size");
        for (int a = 0; a < qnsList.size(); a++ ) {
            qnsList.get(a).getquestionDetails();
            System.out.println(qnsList.get(a).getquestionDetails() + " details");
            %>
    <%=qnsList.get(a).getquestionNo()%>. <%=qnsList.get(a).getquestionDetails()%>
    <br>
    <%
        }
    }

    %>

</form>




</table>
<div class="back">
    <a href="index_.html" style="color:#FFF;">返回</a>
</div>
</body>
</html>


