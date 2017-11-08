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
        String userType = request.getParameter("userType");
        String userId = UserUtility.generateUserId();
        String username = request.getParameter("username").toString();
        String password = request.getParameter("password").toString();
        String name = request.getParameter("name").toString();
//        String email = request.getAttribute("email").toString();
        if (userType.equals("student")){
            int userTypeInDB = 0;
            Boolean success = u.createUserAdmin(userId,username,userTypeInDB,password,name);
            if (success){
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Student account has been added')");
                // wip
                pw.println("location='adminStudentRecord.jsp';");
                pw.println("</script>");
            }
        }else if (userType.equals("teacher")){
            int userTypeInDB = 2;
            Boolean success = u.createUserAdmin(userId,username,userTypeInDB,password,name);
            if (success){
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Teacher account has been added')");
                // wip
                pw.println("location='adminTeacherRecord.jsp';");
                pw.println("</script>");
            }
        }

//        Boolean success = u.createUserAdmin(userId,username,userTypeInDB,password,name);
//        if (success){
//            pw.println("<script type=\"text/javascript\">");
//            pw.println("alert('User account has been added')");
//            // wip
//            pw.println("location='accountDetail.jsp';");
//            pw.println("</script>");
//        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
