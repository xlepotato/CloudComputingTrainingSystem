package servlet;
import dataManager.ExerciseDAO;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Aloysius on 13/9/2017.
 */

@WebServlet(name = "ExerciseServlet")
public class ExerciseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username =  session.getAttribute("username").toString();
        String qns1 = request.getParameter("qns1").toString();
        String qns2 = request.getParameter("qns2").toString();
        String qns3 = request.getParameter("qns3").toString();
        String qns4 = request.getParameter("qns4").toString();
        String qns5 = request.getParameter("qns5").toString();
        String qns6 = request.getParameter("qns6").toString();
        String qns7 = request.getParameter("qns7").toString();
        String qns8 = request.getParameter("qns8").toString();
        String qns9 = request.getParameter("qns9").toString();
        String qns10 = request.getParameter("qns10").toString();





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username =  session.getAttribute("username").toString();


        String searching = request.getParameter("text");

        System.out.println(username);
        ExerciseDAO Exercise = new ExerciseDAO();

        boolean search;
        search = Exercise.checkForSearchResult(searching);
        if(search )
        {
            response.sendRedirect("SearchResult.jsp");
        }
        else
        {
            System.out.println("No search result found");
            response.sendRedirect("homepage.jsp");
        }

    }
}
