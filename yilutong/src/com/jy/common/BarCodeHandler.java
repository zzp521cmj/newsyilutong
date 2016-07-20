package com.jy.common;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.krysalis.barcode4j.tools.MimeTypes;
import org.apache.avalon.framework.configuration.Configuration;
import org.apache.avalon.framework.configuration.DefaultConfiguration;

import org.krysalis.barcode4j.BarcodeGenerator;
import org.krysalis.barcode4j.BarcodeUtil;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;

public class BarCodeHandler {
	
	  
	    public BitmapCanvasProvider getBarcode(String content)
	    {  
	        String format = MimeTypes.MIME_JPEG;// MimeTypes.MIME_JPEG  
	  
	        String text = content;  
	  
	        ByteArrayOutputStream bout = null;  
	        try  
	        {  
	            BarcodeUtil util = BarcodeUtil.getInstance();  
	  
	            Configuration cfg = buildCfg();  
	            BarcodeGenerator gen = util.createBarcodeGenerator(cfg);  
	  
	            bout = new ByteArrayOutputStream(4096);  
	  
	            int dpi = 300; // 分辨率  
	            int orientation = 0;  
	  
	            BitmapCanvasProvider bitmap = new BitmapCanvasProvider(bout,  
	                    format, dpi, BufferedImage.TYPE_BYTE_BINARY, false,  
	                    orientation);  
	  
	            gen.generateBarcode(bitmap, text);  
	            bitmap.finish();  
/*	             response.setContentType(format);  
	             response.setContentLength(bout.size());  
	             response.getOutputStream().write(bout.toByteArray());  
	             response.getOutputStream().flush();  
*/	  
	        }  
	        catch (Exception e)  
	        {  
	            //log.error("Error while generating barcode", e);  
	        	return null;
	        }  
	        finally  
	        {  
	            if (bout != null)  
	            {  
	                try  
	                {  
	                    bout.close();  
	                }
	                catch (IOException e)  
	                {  
	                    // TODO Auto-generated catch block  
	                    e.printStackTrace();  
	                }  
	            }  
	  
	        }
			return null;  
	  
	    }  
	  
	    /** 
	     * Build an Avalon Configuration object from the request. 
	     *  
	     * @return the newly built COnfiguration object 
	     * @todo Change to bean API 
	     */  
	    public static Configuration buildCfg()  
	    {  
	        DefaultConfiguration cfg = new DefaultConfiguration("barcode");  
	        // Get type  
	  
	        String type = "code128";  
	        DefaultConfiguration child = new DefaultConfiguration(type);  
	        cfg.addChild(child);  
	  
//	      DefaultConfiguration attr;  
//	      // height  
//	      String height = "100px";  
//	      attr = new DefaultConfiguration("height");  
//	      attr.setValue(height);  
//	      child.addChild(attr);  
	//  
//	      // width  
//	      String moduleWidth = "300px";  
//	      attr = new DefaultConfiguration("module-width");  
//	      attr.setValue(moduleWidth);  
//	      child.addChild(attr);  
	  
	        return cfg;  
	    }  
}
