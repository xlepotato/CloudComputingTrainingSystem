package servlet;

import wrapper.utility.UserUtility;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Ying on 8/11/2017.
 */
@WebServlet(name = "ExcelServlet", urlPatterns = "/excel")
public class ExcelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("hi");
//        UserUtility.excel();
        UserUtility uu = new UserUtility();

        response.sendRedirect("index.jsp");
    }
}
