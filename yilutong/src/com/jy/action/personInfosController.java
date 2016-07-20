package com.jy.action;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jy.common.SessionInfo;
import com.jy.model.PersonInfo;
import com.jy.model.User;
import com.jy.service.PersonInfoService;

@Controller
@RequestMapping(value="/person.do")

public class personInfosController {
	@Resource
	private PersonInfoService personInfoService;
	@RequestMapping(params = "method=uploadHeadImage")
    public String uploadHeadImage(HttpServletRequest request,
    		@RequestParam(value = "x") String x,
    		@RequestParam(value = "y") String y,
    		@RequestParam(value = "h") String h, 
    		@RequestParam(value = "w") String w,
    		@RequestParam(value = "imgFile") 
    		MultipartFile imageFile,
    		HttpSession session
    ) throws Exception{
        System.out.println("==========Start=============");
        if(imageFile!=null){
        	String path = request.getSession().getServletContext()
    				.getRealPath("WebRoot/uploadImages/");// 文件路径
    		File filez = new File(path);
    		if (!filez.exists()) {
    			filez.mkdirs();
    		}
    		MultipartFile myfile = imageFile;
    		String filename = myfile.getOriginalFilename();
    		String prefix = filename.substring(filename.lastIndexOf("."));
    		File newfile = filez.createTempFile("cut", prefix, filez);
    		String filesname = newfile.toString();
            imageFile.transferTo(newfile);
            int imageX = Integer.parseInt(x);
            int imageY = Integer.parseInt(y);
            int imageH = Integer.parseInt(h);
            int imageW = Integer.parseInt(w);
            //这里开始截取操作
            System.out.println("==========imageCutStart=============");
            imgCut(filesname,imageX,imageY,imageW,imageH);
            System.out.println("==========imageCutEnd=============");
            System.out.println(newfile.getAbsolutePath());
            User user=(User) session.getAttribute(SessionInfo.SessionName);
            personInfoService.deleteimages(user.getId());
            int flag=personInfoService.inserpersonhead(user.getId(),filesname);
        }
        request.setAttribute("flag","1");
        return "admin/personInfo";
    }
	@RequestMapping(params = "method=showimages")
	@ResponseBody
    public void showimages(HttpServletRequest re,HttpServletResponse response,String pic_addr,HttpSession session) {
		User user=(User) session.getAttribute(SessionInfo.SessionName);
		PersonInfo personinfo=personInfoService.getimages(user.getId());
		response.setContentType("image/*");
        FileInputStream fis = null; 
        OutputStream os = null; 
        try {
        	if(personinfo!=null){
        	fis = new FileInputStream(personinfo.getImage_url());
        	os = response.getOutputStream();
            int count = 0;
            byte[] buffer = new byte[1024*8];
            while ( (count = fis.read(buffer)) != -1 ){
            	os.write(buffer, 0, count);
            	os.flush();
            }
        }}catch(Exception e){
        	System.out.println("文件不存在");
        }finally {
            try {
				fis.close();
				os.close();
			}catch (Exception e) {
				
			}
         }
    }

	
	/**
     * 截取图片
     * @param srcImageFile  原图片地址
     * @param x    截取时的x坐标
     * @param y    截取时的y坐标
     * @param desWidth   截取的宽度
     * @param desHeight   截取的高度
     */
    public static void imgCut(String srcImageFile, int x, int y, int desWidth,
                              int desHeight) {
        try {
            Image img;
            ImageFilter cropFilter;
            BufferedImage bi = ImageIO.read(new File(srcImageFile));
            int srcWidth = bi.getWidth();
            int srcHeight = bi.getHeight();
            if (srcWidth >= desWidth && srcHeight >= desHeight) {
                Image image = bi.getScaledInstance(srcWidth, srcHeight,Image.SCALE_DEFAULT);
                cropFilter = new CropImageFilter(x, y, desWidth, desHeight);
                img = Toolkit.getDefaultToolkit().createImage(
                        new FilteredImageSource(image.getSource(), cropFilter));
                BufferedImage tag = new BufferedImage(desWidth, desHeight,
                        BufferedImage.TYPE_INT_RGB);
                Graphics g = tag.getGraphics();
                g.drawImage(img, 0, 0, null);
                g.dispose();
                //输出文件
                ImageIO.write(tag, "JPEG", new File(srcImageFile));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public boolean deleteFile(String sPath) {
		boolean flag;
		flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}
}
