package com.tjx.controller;

import com.tjx.code.Code;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class CodeController {
    @RequestMapping("/code")
    public void code(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String str=Code.randomString(4);
        request.getSession().setAttribute("code",str);
        //生成图片之前，就知道图片要的多大
        int width=80;
        int height=30;
        BufferedImage img=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //这是一个画笔
        Graphics2D g = img.createGraphics();
        //设置图颜色
        g.setColor(Code.randomColor());
        //x y 宽 高 画图案
        g.fillRect(0, 0, width, height);
        //设置字颜色
        g.setColor(new Color(0,0,0));
        //设置字的字体和字体大小
        g.setFont(new Font("",Font.BOLD,21));
        //把文字传输到页面
        g.drawString(str, 7, 25);
        //添加混淆码 --就是让用户看不清
        Code.randomLine(10,g,width,height);

        Code.randomPoin(10,g,width,height);

        ServletOutputStream sos=response.getOutputStream();
        //ImageIO 是专门用来传输Image
        ImageIO.write(img, "jpg", sos);

        sos.close();
    }

    /*@RequestMapping("/imgcode")
    @ResponseBody
    public Result imgcode(String cod,HttpServletRequest request){
        String code = request.getSession().getAttribute("code")+"";
        String replace = code.replace(" ", "");
        System.out.println(replace+""+cod);
        if (!cod.equalsIgnoreCase(replace)){
            System.out.println("验证码错误");
            return Result.setError("","验证码错误");
        }
        return  new Result();
    }*/
}
