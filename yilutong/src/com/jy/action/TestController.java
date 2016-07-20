package com.jy.action;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/test.do")
public class TestController {
/*	private TestSerivce testserivce;
*/	/**
	 * 获取车长
	 * @return List<Test>
	 * @author zzp
	 */
	@SuppressWarnings("null")
	@RequestMapping(params="method=getCarlength")
	public @ResponseBody String getCar_length(String search){
/*		List<Test> list=testserivce.getCar_length(search);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Test t: list) {
			jb=new JSONObject();
			jb.put("id", t.getLength_id());
			jb.put("name",t.getLength_name());
			jsons.add(jb);
		}*/
		
		return null;
	}
	
	@RequestMapping(params="method=excelinput")
	public  String excelinput(String search){
		/*List<Test> list=testserivce.excelinput(search);*/
		/*JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Test t: list) {
			jb=new JSONObject();
			jb.put("id", t.getLength_id());
			jb.put("name",t.getLength_name());
			jsons.add(jb);
		}*/
		
		return "aaa";
	}
	
	@RequestMapping(params="method=aaptest")
	public @ResponseBody String aapinfo(String search){
		System.out.println("aap："+search);
		  /*ModelAndView modelView=new ModelAndView();  
	        Map<String,Object> modelMap=new HashMap<String,Object>();  
	        modelMap.put("search", search);  
	        modelView.addAllObjects(modelMap);*/
		JSONObject json=new JSONObject();
		json.put("put", search);
	        return json.toString();
	}
	
	@RequestMapping(params="method=testdialog")
	public String testdialog(String search){
	        return "admin/userInfo";
	}
}
