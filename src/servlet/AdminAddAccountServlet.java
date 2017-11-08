package servlet;

import dataManager.UserDAO;
import wrapper.utility.UserUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Ying on 6/11/2017.
 */
@WebServlet(name = "AdminAddAccountServlet", urlPatterns = "/adminAdd")
public class AdminAddAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        UserDAO u = new UserDAO();
        String userId = UserUtility.generateUserId();
        String username = request.getAttribute("username").toString();
        int userType = 0;
        String password = request.getAttribute("password").toString();
        String name = request.getAttribute("name").toString();
        String email = request.getAttribute("email").toString();

        Boolean success = u.createUser(userId,username,userType,password,name,email);
        if (success){
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('User account has been added')");
            // wip
            pw.println("location='accountDetail.jsp';");
            pw.println("</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
