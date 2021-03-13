package com.tjx.code;

import java.awt.*;
import java.util.Random;

import static java.awt.image.ImageObserver.HEIGHT;
import static java.awt.image.ImageObserver.WIDTH;

public class Code {
    /**
     生成随机的验证码
     * @parm count
     * @rutern 验证码
     */
    public static String randomString(int count){
        StringBuilder builder = new StringBuilder();
        String source = "ABCDEFGabcdefghijkLMO0123456789";
        Random rnd = new Random();
        for(int i=0;i<count;i++) {
            int pos = rnd.nextInt(source.length());
            String s = source.substring(pos, pos + 1);
            builder.append(s+" ");
        }
        return builder.toString() ;
    }
    /**
     随机生成线条
     * @parm count
     * @parm g
     */
    public static void randomLine(int count, Graphics g,int width,int height) {
        for (int i = 0; i < count; i++) {
            Random rd = new Random();
            int xB = rd.nextInt(width);
            int yB = rd.nextInt(height);
            int xE = rd.nextInt(xB + 88);
            int yE = rd.nextInt(yB + 50);
            g.setColor(randomColor());
            g.drawLine(xB,yB,xE,yE);
        }
    }
    /**
     * 随机生成点
     * @parm count
     * @parm g
     */
    public static void randomPoin(int count,Graphics g,int width,int height){
        for (int i=0;i < count;i++){
            Random rd = new Random();
            int xB = rd.nextInt(width);
            int yB = rd.nextInt(height);
            g.setColor(randomColor());
            g.drawOval(xB,yB,2,2) ;
        }
    }
    /**
     *随机生成颜色
     * @return 随机返回一种颜色
     */
    public static Color randomColor(){
        Random rd = new Random();      //Math.random()为生成0-1随机数
        int r = rd.nextInt(256);//rd.nextInt(256)为随机生成0-255随机数
        int g = rd.nextInt(256);
        int b = rd.nextInt(256);
        return new Color(r,g,b);
    }
}
