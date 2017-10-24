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
<form id="result" name="result" method="post" action="">

    <div class="ScoreTable">

        <table style="width:100%">
            <caption>测验结果</caption>
            <%
                if (session.getAttribute("servlet").equals("ex1")){
            %>
            <tr>
                <th>练习号: 1</th>
                <th>练习结果: <%=session.getAttribute("ex1Score")%></th>
                <th>成绩级别: <%=session.getAttribute("grade")%></th>
            </tr>
            <tr>
                <td> asd </td>
                <td> aaa </td>
            </tr>
            <tr>
                <td> aa </td>
                <td> sss </td>
            </tr>
            <%
                }
                else if(session.getAttribute("servlet").equals("ex2")){
            %>
            <tr>
                <th>练习号: 2</th>
                <th>练习结果: <%=session.getAttribute("ex2Score")%></th>
                <th>成绩级别: <%=session.getAttribute("grade")%></th>
            </tr>
            <tr>
                <td> asd </td>
                <td> aaa </td>
            </tr>
            <tr>
                <td> aa </td>
                <td> sss </td>
            </tr>
            <%
                }
            %>
        </table>



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
