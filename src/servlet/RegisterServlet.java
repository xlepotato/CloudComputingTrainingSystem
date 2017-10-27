package servlet;

import dataManager.UserDAO;
import wrapper.utility.UserUtility;
import wrapper.utility.VerifyRecaptcha;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Ying on 6/9/2017.
 */
@WebServlet(name = "RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        String confirmPassword = request.getParameter("confirmPassword");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        String jcaptcha = request.getParameter("captcha");
        System.out.println(gRecaptchaResponse);
        System.out.println(jcaptcha);

        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
        boolean verifyJCaptcha = jcaptcha.equals(session.getAttribute("code"));
     //   int userType = Integer.parseInt(request.getParameter("userType"));
        int userType = 0;
        String email = request.getParameter("email");
        String userId = UserUtility.generateUserId();
        UserDAO user = new UserDAO();

        System.out.println(verify);
        System.out.println(verifyJCaptcha);

        if (confirmPassword.equals(password) && verifyJCaptcha){
            user.createUser(userId, username, userType, password, name, email);
            if (userType == 0){
                user.createUserDetail(userId,0,"0%","0000-00-00 00:00:00", "-");
            }
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Register success')");
            pw.println("location='index.jsp';");
            pw.println("</script>");
//            response.sendRedirect("index.jsp");
        }else if(verifyJCaptcha && confirmPassword.equals(password)==false){
            System.out.println("Password does not match with the confirm password");
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Password and confirmed password does not match')");
            pw.println("location='register.jsp';");
            pw.println("</script>");
        }else{
            pw.println("<script type=\"text/javascript\">");
            pw.println("alert('Captcha verification fail.')");
            pw.println("location='register.jsp';");
            pw.println("</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
