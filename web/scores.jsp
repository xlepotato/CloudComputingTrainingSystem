<%--
  Created by IntelliJ IDEA.
  User: Ying
  Date: 20/10/2017
  Time: 9:29 AM
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
<head>
    <title>无标题文档</title>
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

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
        }
    </style>
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

<div class="back">
    <a href="homepage.jsp" style="color:#FFF;">返回</a>
</div>
</body>
<%
    session.getCreationTime();
    session.getLastAccessedTime();
    session.removeAttribute("grade");
    session.removeAttribute("servlet");
    session.removeAttribute("ex1Score");
    session.removeAttribute("ex2Score");
%>
</html>
