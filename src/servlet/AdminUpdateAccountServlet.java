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
@WebServlet(name = "AdminUpdateAccountServlet", urlPatterns = "/adminUpdate")
public class AdminUpdateAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO user = new UserDAO();
        PrintWriter pw = response.getWriter();
        HttpSession session = request.getSession();
        String btnType = request.getParameter("detail");
        String clickuser = request.getParameter("selectedUser");
        session.setAttribute("selectedUser",clickuser);
        if (btnType.equals("update")){
            System.out.println("adminupdate");
            System.out.println(clickuser);
            if (user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserType()==0){
                response.sendRedirect("updateStudentInfo.jsp");
            }else if (user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserType()==2){
                response.sendRedirect("updateTeacherInfo.jsp");
            }

        }else if (btnType.equals("change")){
            System.out.println("changepassword");
            System.out.println(clickuser);
            if (user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserType()==0){
                response.sendRedirect("changeStudentPassword.jsp");
            }else if (user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserType()==2){
                response.sendRedirect("changeTeacherPassword.jsp");
            }
        }else if (btnType.equals("remove")){
            System.out.println("remove acc");
            if (user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserType()==0){
                Boolean success = user.removeUser(user.retrieveUserByUsername(clickuser).getUserId());
                if (success){
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Student account is removed')");
                    pw.println("location='adminStudentRecord.jsp';");
                    pw.println("</script>");
                }
            }else if (user.retrieveUserByUsername(session.getAttribute("selectedUser").toString()).getUserType()==2){
                Boolean success = user.removeUser(user.retrieveUserByUsername(clickuser).getUserId());
                if (success){
                    pw.println("<script type=\"text/javascript\">");
                    pw.println("alert('Teacher account is removed')");
                    pw.println("location='adminTeacherRecord.jsp';");
                    pw.println("</script>");
                }
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
