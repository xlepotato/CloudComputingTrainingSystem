package servlet;

import dataManager.ExerciseDAO;
import dataManager.ScoreDAO;
import dataManager.UserDAO;
import entity.MCQ;
import entity.Question;
import entity.UserDetail;
import wrapper.utility.ExerciseUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
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
        UserDAO u = new UserDAO();
        ScoreDAO s = new ScoreDAO();
        int exerciseNoFromFrontEnd = Integer.parseInt(session.getAttribute("exercy").toString());
        System.out.println("exerciseNoFromFrontEnd ~ " + exerciseNoFromFrontEnd);
        String msg = "";
        int score = 0;
        ArrayList<Question> q1 = ex.retrieveQuestion(exerciseNoFromFrontEnd);
        System.out.println(q1.size());
        for (int i = 0; i < q1.size(); i++ ) {
            ArrayList<String> arrList = new ArrayList<String>();
            try {
                String[] checkboxValue = request.getParameterValues("selectedChoice" + q1.get(i).getQuestionId());

            String answer = "";
            for(int n = 0; n<checkboxValue.length;n++){

                answer = answer + checkboxValue[n];
                System.out.println(answer + " answer !!!");
                arrList.add(answer);
            }

            System.out.println(q1.get(i).getQuestionId() + "qns id @@@@@@@@@@@@@@@@");
            request.setAttribute("userInput", answer);
            }catch(NullPointerException e){
                msg = "There are field that is not filled up";
            }
            for (int a = 0; a < arrList.size(); a++) {
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
            pw.println("location='quiz2.jsp';");
            pw.println("</script>");


        }else{


            ArrayList<String> arrList = new ArrayList<>();
            for (int i = 0; i < q1.size(); i++ ) {
                System.out.println(i + " i atm ~ ");
                System.out.println(q1.get(i).getQuestionId() + " qns id currently retrieving qns ");

                String answer = "";

                String [] checkboxValue = request.getParameterValues("selectedChoice" + q1.get(i).getQuestionId());


                for(int n = 0; n<checkboxValue.length;n++){
                    answer = answer + checkboxValue[n];
                    arrList.add(answer);

                }
                System.out.println(answer + " ANSWER YOOO");
                s.createAnswer(u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId(),q1.get(i).getQuestionId(),answer,exerciseNoFromFrontEnd);



                //*NOTE: change QuestionNo to QuestionId
                ArrayList<MCQ> mcqList = ex.retrieveMCQOption(q1.get(i).getQuestionId());

                System.out.println(answer + " **** user given input");
                System.out.println(q1.get(i).getAnswer() + " *** right answer taken from DB");
                if (answer.equals(q1.get(i).getAnswer())) {
                    System.out.println(answer + " user given input");
                    System.out.println(q1.get(i).getAnswer() + " right answer taken from DB");
                    score = score + 1;
                    System.out.println(score + " score nyan");
                }


            }
            System.out.println("You have scored " + score);
            String grade = ExerciseUtility.computeGrade(score,q1.size());
            String displayScore = score + " / " + q1.size();

            s.createScore(u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId(),exerciseNoFromFrontEnd,score,q1.size());
            double latestScore = ExerciseUtility.sumUpScore(u.retrieveUserDetailByUsername(session.getAttribute("username").toString()).getTotalScore(),score);
            int latestScoreOverall = ExerciseUtility.sumUpScoreOverall(u.retrieveUserDetailByUsername(session.getAttribute("username").toString()).getTotalScoreOverall(),q1.size());
            u.updateUserTotalScore(latestScore,latestScoreOverall,u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId());
            int progressPoint = 3;
            String progressCriteria = "quiz2";
            String userId = u.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId();
            if (u.retrieveProgressByUserIdAndProgressCriteria(userId,progressCriteria)!= null){

            }else{
                UserDetail ud = u.retrieveUserDetailByUsername(session.getAttribute("username").toString()) ;
                int dbProgress = ud.getprogress();
                DecimalFormat df = new DecimalFormat("#.00");
                dbProgress = dbProgress + progressPoint;
                String formatPercent = df.format(ExerciseUtility.computeScorePercentage(dbProgress,12));
                double progressPercent = Double.parseDouble(formatPercent);
                System.out.println(progressPercent);
                boolean success = u.updateProgress(dbProgress,progressPercent,userId);
                if(success){
                    u.createProgress(progressCriteria,userId);
                }
            }

            session.setAttribute("ex2Score",displayScore);
            session.setAttribute("grade", grade);
            session.setAttribute("servlet","ex2");
            response.sendRedirect("quizResult.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
