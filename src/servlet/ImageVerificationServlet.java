package servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Ying on 15/9/2017.
 */
@WebServlet(name = "ImageVerificationServlet", urlPatterns = "/imageGenerate")
public class ImageVerificationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setContentType("image/jpeg");
        //告诉浏览器没有缓存 这样不会使用缓存机制 验证码也可以直接点
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        BufferedImage bf = new BufferedImage(70, 50, BufferedImage.TYPE_INT_RGB);

        Graphics gs = bf.getGraphics();//得到绘画对象 绘画对象背景颜色默认是黑色

        gs.fillRect(0, 0, 70, 50);//添加实心矩形 默认背景颜色是白色
        //gs.fillRect(250, 80, 300, 100);
        //gs.setFont(new Font("宋体", Font.BOLD, 50));//修改字形和字体大小

        Random rd = new Random();

        String a = "abcdefghijklmnopqrstuvwxyz是时候展现真正的技术了1234567890";
        char[] cs = a.toCharArray();//将字符串转化成char数组


        String[] fonts = { "新宋体", "微软雅黑", "方正兰亭超细黑简体" };

        StringBuffer code = new StringBuffer();

        for(int i=0;i<4;i++){
            int n = rd.nextInt(10);
            gs.setFont(new Font(fonts[rd.nextInt(fonts.length)], Font.BOLD,
                    25));

            gs.setColor(new Color(rd.nextInt(256), rd.nextInt(256), rd.nextInt(256)));//设置绘画对象字体颜色
            gs.drawString(cs[n]+"", i*16, 28);
            code.append(cs[n]);
        }

        request.getSession().setAttribute("code", code.toString());

        for(int i=0;i<100;i++){
            gs.setColor(new Color(rd.nextInt(256), rd.nextInt(256), rd.nextInt(256)));
            gs.drawLine(rd.nextInt(300), rd.nextInt(300), rd.nextInt(300), rd.nextInt(300));
        }

        ImageIO.write(bf, "jpeg", response.getOutputStream());
    }

}