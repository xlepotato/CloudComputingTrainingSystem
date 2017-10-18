package servlet;

import dataManager.ExerciseDAO;
import entity.Exercise;
import entity.MCQ;
import entity.Question;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by Ying on 16/10/2017.
 */
@WebServlet(name = "ExerciseServlet", urlPatterns = "/exercise")
public class ExerciseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        ExerciseDAO ex = new ExerciseDAO();
        ArrayList<Exercise> exList = ex.retrieveAllExercise();
        String msg = "";
        int score = 0;
        System.out.println("exercise Size: " + exList.size());
        for (int q = 0; q < exList.size(); q++ ) {
            ArrayList<Question> q1 = ex.retrieveQuestion(exList.get(q).getexerciseNo());
            System.out.println(q1.size());
            for (int i = 0; i < q1.size(); i++ ) {
//                String qns [] = request.getParameterValues("selectedChoice" + q1.get(i).getQuestionId());
                ArrayList<String> arrList = new ArrayList<String>();
                arrList.add(request.getParameter("selectedChoice" + q1.get(i).getQuestionId()));
                request.setAttribute("userInput", arrList);
                //   System.out.println(arrList.size());
                for (int a = 0; a < arrList.size(); a++) {
                    //    System.out.println(arrList.get(a) + " choice");
                    if (arrList.get(a) == null){
                        msg = "There are field that is not filled up";
                    }


                }
            }
        }

        // changed > to < for better testing purposes
        if (msg.length() < 0){

            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Please answer all the question before submission')");
            pw.println("location='onlinePractice.jsp';");
            pw.println("</script>");

//            getServletContext().getRequestDispatcher("onlinePractice.jsp").forward(request, response);

        }else{


            for (int q = 0; q < exList.size(); q++ ) {
                ArrayList<Question> q1 = ex.retrieveQuestion(exList.get(q).getexerciseNo());
                for (int i = 0; i < q1.size(); i++ ) {
//                String qns [] = request.getParameterValues("selectedChoice" + q1.get(i).getQuestionId());
                    ArrayList<String> arrList = new ArrayList<String>();
                    arrList.add(request.getParameter("selectedChoice" + q1.get(i).getQuestionId()));
                    for (int a = 0; a < arrList.size(); a++) {
                        ArrayList<MCQ> mcqList = ex.retrieveMCQOption(q1.get(a).getQuestionNo());
                        if (arrList.get(a).equals(mcqList.get(a).getOption())){
                            score++;
                            System.out.println(score);
                        }


                    }
                }
            }

            System.out.println("You have scored " + score);

            response.sendRedirect("homepage.jsp");

        }
        //    String qns = request.getParameter("selectedChoice");

        List<String> params = Collections.list(request.getParameterNames());//Get param name
        for (String p: params)
        {

            System.out.println(request.getParameter(p));// get param value for each param
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
