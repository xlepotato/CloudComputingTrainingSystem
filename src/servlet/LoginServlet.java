package servlet;

import dataManager.UserDAO;
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

/**
 * Created by Ying on 5/9/2017.
 */
@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username =  request.getParameter("username");
        String password = request.getParameter("password");
        session.setAttribute("username",username);

        System.out.println(username);
        System.out.println(password);
        UserDAO user = new UserDAO();
        List<User>userList = new ArrayList<>();
        int userType;

        boolean userVerification ;
        userVerification = user.checkForExistingUser(username, password);
        if (userVerification){

            userType = user.checkForUserType(username);
            System.out.println("usertype:" + userType);
            if (userType == 0) {
                response.sendRedirect("homepage.jsp");
            } else if (userType == 1){
                response.sendRedirect("loginAdmin.jsp");
            }
        }else{
            System.out.println("Login failed");
            response.sendRedirect("failAuthentication.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
