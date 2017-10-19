package servlet;

import dataManager.ExerciseDAO;
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

/**
 * Created by Ying on 19/10/2017.
 */
@WebServlet(name = "Exercise2Servlet", urlPatterns = "/exercise2")
public class Exercise2Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        ExerciseDAO ex = new ExerciseDAO();
        //   ArrayList<Exercise> exList = ex.retrieveAllExercise();
        int exerciseNoFromFrontEnd = Integer.parseInt(session.getAttribute("exercy").toString());
        System.out.println("exerciseNoFromFrontEnd ~ " + exerciseNoFromFrontEnd);
        String msg = "";
        int score = 0;
//        System.out.println("exercise Size: " + exList.size());
//        for (int q = 0; q < exList.size(); q++ ) {
        ArrayList<Question> q1 = ex.retrieveQuestion(exerciseNoFromFrontEnd);
        System.out.println(q1.size());
        for (int i = 0; i < q1.size(); i++ ) {
//                String qns [] = request.getParameterValues("selectedChoice" + q1.get(i).getQuestionId());
            ArrayList<String> arrList = new ArrayList<String>();
            arrList.add(request.getParameter("selectedChoice" + q1.get(i).getQuestionId()));
            System.out.println(q1.get(i).getQuestionId() + "qns id @@@@@@@@@@@@@@@@");
            request.setAttribute("userInput", arrList);
            //   System.out.println(arrList.size());
            for (int a = 0; a < arrList.size(); a++) {
                //    System.out.println(arrList.get(a) + " choice");
                if (arrList.get(a) == null){
                    msg = "There are field that is not filled up";
                }


            }
        }
        //   }

        // changed > to < for better testing purposes
        if (msg.length() > 0){

            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Please answer all the question before submission')");
            pw.println("location='onlinePracticeEx2.jsp';");
            pw.println("</script>");

//            getServletContext().getRequestDispatcher("onlinePracticeEx2.jsp").forward(request, response);

        }else{

            // To be continued at here :DDD
            ArrayList<String> arrList = new ArrayList<>();
//            for (int q = 0; q < exList.size(); q++ ) {
//           int exerciseNoFromFrontEnd = Integer.parseInt(request.getAttribute("exerciseNo").toString());
//           System.out.println("exerciseNoFromFrontEnd ~ " + exerciseNoFromFrontEnd);

            //  q1 = ex.retrieveQuestion(exerciseNoFromFrontEnd);
            for (int i = 0; i < q1.size(); i++ ) {
                System.out.println(i + " i atm ~ ");
                System.out.println(q1.get(i).getQuestionId() + " qns id currently retrieving qns ");
                arrList.add(request.getParameter("selectedChoice" + q1.get(i).getQuestionId()));
                //    while (i < q1.size()) {

                //*NOTE: change QuestionNo to QuestionId
                ArrayList<MCQ> mcqList = ex.retrieveMCQOption(q1.get(i).getQuestionId());
                System.out.println(arrList.get(i) + " **** user given input");
                //       System.out.println(mcqList.get(i).getOption() + " *** right answer taken from DB");
                System.out.println(q1.get(i).getAnswer() + " *** right answer taken from DB");
                if (arrList.get(i).equals(q1.get(i).getAnswer())) {
                    System.out.println(arrList.get(i) + " user given input");
                    System.out.println(q1.get(i).getAnswer() + " right answer taken from DB");
                    score = score + 1;
                    System.out.println(score + " score nyan");
                }


            }
            System.out.println("You have scored " + score);

            response.sendRedirect("homepage.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
