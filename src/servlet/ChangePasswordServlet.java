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
@WebServlet(name = "ChangePasswordServlet", urlPatterns = "/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserDAO user = new UserDAO();
       String password = request.getParameter("oldPassword");
       String newPassword = request.getParameter("newPassword");
       String confirmNewPassword = request.getParameter("cfmNewPassword");

       if (confirmNewPassword.equals(password) && password.equals(user.retrieveUserByUsername(session.getAttribute("username").toString()))){
           user.updatePassword(newPassword,user.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId());
       }else
           System.out.println("Change password failed");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
