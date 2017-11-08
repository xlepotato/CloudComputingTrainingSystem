package servlet;

import dataManager.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Ying on 8/11/2017.
 */
@WebServlet(name = "AdminChangePasswordServlet", urlPatterns = "/adminChangePassword")
public class AdminChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDAO user = new UserDAO();
        System.out.println("adminchangepw");
        String password = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("cfmNewPassword");

        if(password.equals(confirmPassword)){
            user.updatePassword(password, user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserId());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
