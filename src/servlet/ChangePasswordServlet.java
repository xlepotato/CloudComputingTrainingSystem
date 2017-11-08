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
 * Created by Ying on 8/11/2017.
 */
@WebServlet(name = "ChangePasswordServlet", urlPatterns = "/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        UserDAO user = new UserDAO();
        String password = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("cfmNewPassword");

        if (confirmNewPassword.equals(newPassword) && password.equals(user.retrieveUserByUsername(session.getAttribute("username").toString()).getPassword())) {
            user.updatePassword(newPassword, user.retrieveUserByUsername(session.getAttribute("username").toString()).getUserId());
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Password has been changed successfully')");
            pw.println("location='updateParticular.jsp';");
            pw.println("</script>");
          //  response.sendRedirect("updateParticular.jsp");
        } else if (confirmNewPassword.equals(newPassword) && !password.equals(user.retrieveUserByUsername(session.getAttribute("username").toString()).getPassword())){
            System.out.println("Change password failed");

            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Incorrect password in the Old Password field')");
            pw.println("location='passwordChange.jsp';");
            pw.println("</script>");
        } else {
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Mismatch between New Password and Confirm New Password')");
            pw.println("location='passwordChange.jsp';");
            pw.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
