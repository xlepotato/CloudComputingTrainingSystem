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
        String username =  request.getParameter("username");
        session.setAttribute("username",username);

//        String searchingtext = request.getParameter("text");
//
//        System.out.println(username);
//        ExerciseDAO Exercise = new ExerciseDAO();
//
//        boolean search = false;
//        search = Exercise.checkForSearchResult(searchingtext);
//        if(search )
//        {
//            response.sendRedirect("SearchResult.jsp");
//        }
//        else
//        {
//            System.out.println("No search result found");
//            response.sendRedirect("homepage.jsp");
//        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username =  request.getParameter("username");
        session.setAttribute("username",username);

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
