package com.jy.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.codehaus.xfire.client.XFireProxyFactory;
import org.codehaus.xfire.service.Service;
import org.codehaus.xfire.service.binding.ObjectServiceFactory;

import com.jy.model.Taskonlineimport;
import com.jy.webservice.CarPointService;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*Service serviceModel = new ObjectServiceFactory().create(CarPointService.class);  
	    String url = "http://127.0.0.1:8080/truck_cloud/service/CarPointService";  
	    CarPointService service = null;  
	      
	    try {
	        service = (CarPointService) new XFireProxyFactory().create(serviceModel, url);  
	        System.out.println(">>>>>>>>Client: " + service.getpoint());  
	    } catch (Exception e) {
	        e.printStackTrace();
	    }*/
		/*String json = "{\"a\":\"asd\",\"b\":\"asd\",\"c\":\"asd\"}";
		JSONObject jsons=JSONObject.fromObject(json);
		
		System.out.println(jsons.size());
		for(int i=0;i<jsons.size();i++){
			System.out.println(jsons.getJSONObject("a"));
		}*/
		@SuppressWarnings("unused")
		List<Taskonlineimport> tlist = new ArrayList<Taskonlineimport>();
		Taskonlineimport t=new Taskonlineimport();
		tlist.add(t);
	}

}
