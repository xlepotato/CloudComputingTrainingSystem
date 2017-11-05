//package servlet;
//
///**
// * Created by Ying on 13/9/2017.
// */
//import com.octo.captcha.service.CaptchaServiceException;
//import dataManager.UserDAO;
//import wrapper.CaptchaServiceSingleton;
//import wrapper.utility.UserUtility;
//
//import javax.imageio.IIOImage;
//import javax.imageio.ImageTypeSpecifier;
//import javax.imageio.ImageWriter;
//import javax.imageio.metadata.IIOMetadata;
//import javax.imageio.stream.ImageOutputStream;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import javax.imageio.ImageIO;
//
////@WebServlet(name = "ImageCaptchaServlet" , urlPatterns = "/jcaptcha")
//public class ImageCaptchaServlet extends HttpServlet {
//
//
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//
//        response.setHeader("Cache-Control", "no-store");
//        response.setHeader("Pragma", "no-cache");
//        response.setDateHeader("Expires", 0);
//        response.setContentType("image/png");
//        //the same id must be used to validate the response,
//        //the session id is a good candidate!
////        String captchaId = request.getSession().getId();
////        // call the ImageCaptchaService getChallenge method
////        BufferedImage image =
////                CaptchaServiceSingleton.getInstance().getImageChallengeForID(captchaId,
////                        request.getLocale());
////
////
////        ServletOutputStream os = response.getOutputStream();
////        //Writing the image to outputstream
////        ImageIO.write(image, "png", os);
////        // flush it in the response
////        os.flush();
////        os.close();
//
//        // get the session id that will identify the generated captcha.
//        //the same id must be used to validate the response, the session id is a good candidate!
//        String captchaId = request.getSession().getId();
//
//        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
//
//        BufferedImage challenge =
//                CaptchaServiceSingleton.getInstance().getImageChallengeForID(captchaId,
//                        request.getLocale());
//        // Image writer
//        ImageWriter imageWriter = (ImageWriter)ImageIO.getImageWritersBySuffix("png").next();
//        ImageOutputStream ios = ImageIO.createImageOutputStream(jpegOutputStream);
//        imageWriter.setOutput(ios);
//        IIOMetadata imageMetaData = imageWriter.getDefaultImageMetadata(new ImageTypeSpecifier(challenge), null);
//        imageWriter.write(imageMetaData, new IIOImage(challenge, null, null), null);
//
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//
//        Boolean isResponseCorrect = Boolean.FALSE;
//        //remenber that we need an id to validate!
//        String captchaId = request.getSession().getId();
//        //retrieve the response
//        String response2 = request.getParameter("j_captcha_response");
//        System.out.println(response2);
//        // Call the Service method
//        try {
//            isResponseCorrect = CaptchaServiceSingleton.getInstance().validateResponseForID(captchaId,
//                    response2);
//        } catch (CaptchaServiceException e) {
//            //should not happen, may be thrown if the id is not valid
//        }
//
////do something according to the result!
//
//        System.out.println(isResponseCorrect);
//        HttpSession session = request.getSession();
//        if (isResponseCorrect) {
//            String confirmPassword = request.getParameter("confirmPassword");
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            String name = request.getParameter("name");
//            //   int userType = Integer.parseInt(request.getParameter("userType"));
//            int userType = 0;
//            String email = request.getParameter("email");
//            String userId = UserUtility.generateUserId();
//            UserDAO user = new UserDAO();
//
//            if (confirmPassword.equals(password)) {
//                user.createUser(userId, username, userType, password, name, email);
//                response.sendRedirect("initialIndex.jsp");
//            } else {
//                System.out.println("Password does not match with the confirm password");
//            }
//
//        } else {
//            System.out.println("Captcha failed");
//        }
//
//    }
//}
