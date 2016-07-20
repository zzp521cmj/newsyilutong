package com.jy.common;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;



public class SimpleClient {
	public static void main(String[] args) throws DocumentException {
		
		//String str="http://192.168.5.43:8080/truck_cloud/app.do?method=applogin";
		String str="http://192.168.5.123:8013/Lorry_Cloud_WBS.asmx/InsCar";
		JSONArray json=new JSONArray();
		JSONObject jsonobjec=new JSONObject();
		jsonobjec.put("czxm", "你是猪吗!");
		jsonobjec.put("jsy", "1S");
		jsonobjec.put("tel", "13512345678");
		jsonobjec.put("len", "A");
		jsonobjec.put("lx", "B");
		jsonobjec.put("carport", "1S");
		jsonobjec.put("htksrq", "2018-12-31");
		jsonobjec.put("htjsrq", "2018-12-31");
		jsonobjec.put("jgid", 321);

		json.add(jsonobjec);
	
		JSONArray json2=doPost(str,json);
		 // 将字符串转为XML
		  System.out.println(json2.toString());
	}
	
	  public static JSONArray doPost(String url,JSONArray json){
		    DefaultHttpClient client = new DefaultHttpClient();
		    HttpPost post = new HttpPost(url);
		      String result=null;
		    JSONArray response = null;
		    try {
		    	List<NameValuePair> nvps = new ArrayList<NameValuePair>();  
		    	 nvps.add(new BasicNameValuePair("_JSONString",URLEncoder.encode(json.toString(), "UTF-8")));
		    	//System.out.println(URLEncoder.encode(json.toString(), "UTF-8"));
/*			     post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
*/
		     StringEntity s = new StringEntity(json.toString());
/*		     post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, "UTF-8");
*/
/*		      s.setContentEncoding("UTF-8");
*/		     // s.setContentEncoding("gbk");
		      //application/soap+xml
		      //application/json
		      s.setContentType("application/json");//发送json数据需要设置contentType
		      
		    
		      post.setEntity(new UrlEncodedFormEntity(nvps));
		      
/*		      post.setEntity(s);
*/		      HttpResponse res = client.execute(post);
		      if(res.getStatusLine().getStatusCode() == HttpStatus.SC_OK){
		        HttpEntity entity = res.getEntity();
		        result = EntityUtils.toString(res.getEntity());// 返回json格式：
		        //解析xml
		        Document  doc = DocumentHelper.parseText(result);
		        Element rootElt = doc.getRootElement();
		        result=rootElt.getText();
		        response = JSONArray.fromObject(result);
		      }
		    } catch (Exception e) {
		      throw new RuntimeException(e);
		    }
		    return response;
		  }
	  private String StrToBinstr(String str) {
	        char[] strChar=str.toCharArray();
	        String result="";
	        for(int i=0;i<strChar.length;i++){
	            result +=Integer.toBinaryString(strChar[i])+ " ";
	        }
	        return result;
	    }
}
