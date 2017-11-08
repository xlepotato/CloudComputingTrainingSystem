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
@WebServlet(name = "AdminRemoveAccountServlet", urlPatterns = "/remove")
public class AdminRemoveAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        UserDAO u = new UserDAO();

        Boolean success = u.removeUser(request.getAttribute("userId").toString());
        if (success){
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('User account is removed')");
            // wip
            pw.println("location='accountDetail.jsp';");
            pw.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
