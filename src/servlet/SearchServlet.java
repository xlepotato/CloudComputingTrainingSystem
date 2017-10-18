package servlet;

import dataManager.SearchDAO;
import dataManager.UserDAO;
import entity.Exercise;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {

    protected void doPost(HttpServlet request, HttpServletResponse response) throws ServletException, IOException {
//
//        String SearchResult;
//
//        String EntSearch =  request.getInitParameter("ss");
//        SearchDAO search = new SearchDAO();
//
//        SearchResult = search.checkforSearchResult(EntSearch);
//
//        boolean SearchSuccess;
//
//        SearchSuccess = search.checkforExistingResult(EntSearch);
//
//        if(SearchSuccess)
//        {
//            System.out.println("Search Success");
//            response.sendRedirect( "SearchResult.jsp");
//        }
//        else
//        {
//            System.out.println("Search fail");
//            response.sendRedirect("homepage.jsp");
//        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String SearchResult;

        String EntSearch =  request.getParameter("ss");
        SearchDAO search = new SearchDAO();

        SearchResult = search.checkforSearchResult(EntSearch);

        boolean SearchSuccess;

        SearchSuccess = search.checkforExistingResult(EntSearch);

        if(SearchSuccess)
        {
            System.out.println("Search Success");
            response.sendRedirect( "SearchResult.jsp");
        }
        else
        {
            System.out.println("Search fail");
            response.sendRedirect("homepage.jsp");
        }
    }
}
