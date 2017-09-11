package servlet;

import dataManager.UserDAO;
import wrapper.UserUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Ying on 6/9/2017.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String confirmPassword = request.getParameter("confirmPassword");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
     //   int userType = Integer.parseInt(request.getParameter("userType"));
        int userType = 0;
        String email = request.getParameter("email");
        String userId = UserUtility.generateUserId();
        UserDAO user = new UserDAO();

        if (confirmPassword.equals(password)){
            user.createUser(userId, username, userType, password, name, email);
            response.sendRedirect("index.jsp");
        }else{
            System.out.println("Password does not match with the confirm password");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
