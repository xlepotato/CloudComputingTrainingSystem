package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Ying on 7/11/2017.
 */
@WebServlet(name = "QuizReviewServlet", urlPatterns = "/quizreview")
public class QuizReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String exNo = request.getParameter("detail");
//       String exNo = session.getAttribute("exxNo").toString();
       session.setAttribute("exNo",exNo);
        response.sendRedirect("quizReview.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
