package servlet;

import dataManager.UserDAO;

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
@WebServlet(name = "UpdateParticularServlet")
public class UpdateParticularServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        String name = request.getAttribute("name").toString();
        String email = request.getAttribute("email").toString();
        String username = request.getAttribute("username").toString();
        String password = request.getAttribute("password").toString();
        UserDAO u = new UserDAO();
        boolean success = u.updateUser(name,password,email,username);
        if (success){
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Update success')");
            pw.println("location='accountDetail.jsp';");
            pw.println("</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}