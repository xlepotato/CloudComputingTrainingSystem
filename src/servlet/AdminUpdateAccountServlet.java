package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Ying on 8/11/2017.
 */
@WebServlet(name = "AdminUpdateAccountServlet", urlPatterns = "/adminUpdate")
public class AdminUpdateAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String btnType = request.getParameter("detail");
        String clickuser = request.getParameter("detail");

        if (btnType.equals("update")){
            System.out.println("adminupdate");
            System.out.println(clickuser);
            response.sendRedirect("updateStudentInfo.jsp");
        }else if (btnType.equals("change")){
            System.out.println("changepassword");
            System.out.println(clickuser);
            response.sendRedirect("changeStudentPassword.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
