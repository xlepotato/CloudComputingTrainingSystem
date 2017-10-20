<%@ page import="dataManager.ExerciseDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Exercise" %>
<%@ page import="entity.Question" %>
<%@ page import="entity.MCQ" %>
<%@ page import="java.io.PrintWriter" %>
<%--
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
        #question {
            text-indent: 50px;
        }
    </style>
    <%--<%--%>
        <%--PrintWriter pw = response.getWriter();--%>
        <%--ArrayList<String> userInput = (ArrayList<String>)request.getAttribute("userInput");--%>
        <%--System.out.println(userInput.size());--%>
        <%--for(int i = 0; i < userInput.size(); i ++){--%>
            <%--if (userInput.get(i) != null){--%>
                <%--pw.println("<script type=\"text/javascript\">");--%>
                <%--pw.println("console.log(document.getElementById(\"selectedChoice\" + i).checked = true);");--%>
                <%--pw.println("document.getElementById(\"selectedChoice\" + i).checked = true;");--%>
                <%--pw.println("</script>");--%>

            <%--}--%>
        <%--}--%>

    <%--%>--%>
</head>
<body>
<a href="onlinePracticeEx1.jsp"> Exercise 1 </a>
<%
    ExerciseDAO exercise = new ExerciseDAO();
  //  ArrayList<Exercise> exList = exercise.retrieveAllExercise();
    int exerciseNo = 2;
    session.setAttribute("exercy", exerciseNo);

%>
<form name="qnsForm" action="/exercise2" method="post" onsubmit="return validateRadioBtn()">
    <table width="80%" border="0" align="center">
        <tr>
            <td><h1 align="center">在线练习</h1></td>
        </tr>

    </table>
    <%
      //  String exer = "";
        String exer = exercise.retrieveExerciseByExerciseNo(exerciseNo).getexerciseName();
//    for (int i = 0; i < exList.size(); i ++ ) {
//        System.out.println(exList.get(i).getexerciseName() + " exercise Name !! ");
//
//        exer =  exList.get(1).getexerciseName();
        %>
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
        }

    %>

</p>

    <input type="submit" value="Submit" style="background:#00F; color:#FFF; width:50px; height:30px; font-size:15px;"/>

</form>




</table>
<div class="back">
    <a href="homepage.jsp" style="color:#FFF;">返回</a>
</div>
<script>
    var count = 0;
   <%
   String parameterName = "";
   %>
    function validateRadioBtn() {
        <%

//    for (int i = 0; i < exList.size(); i ++ ) {
//        System.out.println(exList.get(i).getexerciseName() + " exercise Name !! ");
//        exerciseNo = exList.get(i).getexerciseNo();
   //     ArrayList<Question> qnsList = exercise.retrieveQuestion(exerciseNo);
        System.out.println(exerciseNo + " - exerciseNo");
        System.out.println(qnsList.size() + " qnsList size");
        for (int a = 0; a < qnsList.size(); a++ ) {
            qnsList.get(a).getQuestionDetail();
            System.out.println(qnsList.get(a).getQuestionDetail() + " details");
            ArrayList<MCQ> mcqList = exercise.retrieveMCQOption(qnsList.get(a).getQuestionNo());
               parameterName = "selectedChoice" + qnsList.get(a).getQuestionId();

        %>
        if(document.qnsForm.<%=parameterName%>.value == "" || null) {
            alert("please answer all the question " + <%=parameterName%>);
          count = count ++;
            return false;
        } else if (count = qnsList.size() - 1 ){
            console.log(count);
            document.qnsForm.submit();
        }
        <%
          //  }
        }
        %>
    }
</script>
</body>
</html>


