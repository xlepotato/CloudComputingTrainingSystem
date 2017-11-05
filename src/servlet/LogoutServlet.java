package servlet;

import dataManager.ExerciseDAO;
import dataManager.UserDAO;
import entity.Exercise;
import entity.User;
import wrapper.TimestampUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Ying on 22/9/2017.
 */
@WebServlet(name = "LogoutServlet", urlPatterns = "/logout")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDAO u = new UserDAO();
        User user = u.retrieveUserByUsername(session.getAttribute("username").toString());
        u.updateUserLastLogin("CURRENT_TIMESTAMP",user.getUserId());
        session.invalidate();
        response.sendRedirect("initialIndex.jsp");
    }
}
