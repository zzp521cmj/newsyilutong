package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.model.CityAgreement;
import com.jy.service.CityAgreementSearchService;

/*
 * 车辆承运协议记录
 * */
@Controller
@RequestMapping(value = "cityAgreem.do")
public class CityAgreementSearchController {
	
	@Resource
	private CityAgreementSearchService bid;
	
	@RequestMapping(params="method=cityAgreemPage")
	public String getCityAgreementSearchPage(){
		return "cityAgreement/cityAgreementInfo";
	}
	
	@RequestMapping(params = "method=getCityAgreement")
	public @ResponseBody
	Map<String,Object> getAgreementInfo(String rows, String page,String pcd_code,String car_id,String iadate) {
		//当前第几页
				Integer page1 = 1;
				//当前页一共几条
				Integer rows1 = 0;
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<CityAgreement> list = bid.getCityAgreementSearchInfo((page1 - 1) * rows1,rows1 ,pcd_code, car_id,iadate);
		int count = bid.getCityAgreementSearch(pcd_code, car_id,iadate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
//		JSONObject json=new JSONObject();
//		json.put("rows", list);
//		System.out.println(json.toString());
		return map;
	}
//车牌检索
	@RequestMapping(params = "method=getCar_idLength")
	public @ResponseBody
	String getCar_idLength(String plate_number) {
		List<CityAgreement> list = bid.getCar_idLength(plate_number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (CityAgreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getId());
			jb.put("name", d.getCar_id());
			jsons.add(jb);
		}
		return jsons.toString();
	}
}
