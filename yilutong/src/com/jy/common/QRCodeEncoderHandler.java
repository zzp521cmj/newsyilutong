package com.jy.common;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

import com.swetake.util.Qrcode;

public class QRCodeEncoderHandler {
	/**
     * 生成二维码(QRCode)图片
     * @paramcontent
     * @paramimgPath
     */ 
    public BufferedImage encoderQRCode(String content,int size) { 
       try { 
 
           Qrcode qrcodeHandler = new Qrcode(); 
           qrcodeHandler.setQrcodeErrorCorrect('M'); 
           qrcodeHandler.setQrcodeEncodeMode('B');
           qrcodeHandler.setQrcodeVersion(size);
 
           System.out.println(content); 
           byte[] contentBytes = content.getBytes("utf-8"); 
           int imgSize = 67 + 12 * (size - 1);  
           BufferedImage bufImg = new BufferedImage(imgSize, imgSize, 
                   BufferedImage.TYPE_INT_RGB); 
 
           Graphics2D gs = bufImg.createGraphics();
 
          gs.setBackground(Color.WHITE);
           gs.clearRect(0, 0, imgSize, imgSize); 

           // 设定图像颜色> BLACK 
           gs.setColor(Color.BLACK);
 
           // 设置偏移量 不设置可能导致解析出错
           int pixoff = 2; 
        // 输出内容> 二维码 
           if (contentBytes.length > 0 && contentBytes.length < 120) { 
               boolean[][] codeOut = qrcodeHandler.calQrcode(contentBytes); 
               for (int i = 0; i < codeOut.length; i++) { 
                   for (int j = 0; j < codeOut.length; j++) { 
                       if (codeOut[j][i]) { 
                           gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3); 
                       } 
                   } 
               } 
           } else { 
               System.err.println("QRCode content bytes length = " 
                       +contentBytes.length + " not in [ 0,120 ]. "); 
           } 
 
           gs.dispose(); 
           bufImg.flush(); 
          // File imgFile = new File(imgPath); 
 
        // 生成二维码QRCode图片 
           //ImageIO.write(bufImg, "png", imgFile);
           //ImageIO.write(bufImg, "png", response.getOutputStream()); 
           return bufImg; 
       } catch (Exception e) {
           e.printStackTrace(); 
           return null; 
       }
	
}}
