package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.jy.dao.Json;

import com.jy.model.City_info;
import com.jy.service.CityService;

/*
 * 城市管理
 * */
@Controller
@RequestMapping(value="/city.do")
public class CityController {
	@Resource
	private CityService cs;
	@RequestMapping(params="method=cityInfo")
	public String CityInfo(){
		return"city/CityInfo";
	}
	//跳转编辑页面并且获取合同的id 返回到页面
		@RequestMapping(params = "method=getEditCityPage")
		public String getCityEditMan1(String pid, HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "city/EditCity";
		}
	// 全部查询分页
	@RequestMapping(params = "method=getCity")
	public @ResponseBody
	Map getCityInfo(String rows, String page, String cityname,String cityzm) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
	
		List<City_info> list = cs.getCityInfo((page1 - 1) * rows1, rows1,cityname,cityzm);
		int count = cs.getCity(cityname, cityzm);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
		}
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteCity")
	public @ResponseBody
	Json delTruck(String[] del) {
		Json json = new Json();
		int truck = cs.deleteCity(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 跳转到添加页面
		@RequestMapping(params = "method=addCity")
		public String addCity() {
			return "city/AddCity";
		}
		// 保存
		@RequestMapping(params = "method=saveCity")
		public @ResponseBody Json saveCity(City_info d) {
			Json json = new Json();
			int truck = cs.saveCity(d);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		// 修改查询
		@RequestMapping(params = "method=getUpdateCity")
		public @ResponseBody
		City_info getUpdateCity(int citycode) {
			City_info city = cs.getUpdateCity(citycode);
			return city;
		}

		// 用户修改
		@RequestMapping(params = "method=updateCity")
		public @ResponseBody Json  updateCity(City_info d) {
			Json json = new Json();
			int i = cs.updateCity(d);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/**
		 * 获取省份
		 * @return
		 */
		@RequestMapping(params = "method=citytype1")
		public @ResponseBody String citytype1(){
			String citytype1=cs.getcitytype1();
			return citytype1;
		}
		/**
		 * 获取城市
		 * @param id
		 * @return
		 */
		@RequestMapping(params = "method=citytype2")
		public @ResponseBody String citytype2(String id){
			String citytype2=cs.getcitytype2(id);
			return citytype2;
		}
		/**
		 * 获取区县
		 * @param id
		 * @return
		 */
		@RequestMapping(params = "method=citytype3")
		public @ResponseBody List<City_info> citytype3(String id){
			List<City_info> citytype3=cs.getcitytype3(id);
			return citytype3;
		}
		
		/**
		 * 添加
		 * @param id
		 * @return
		 */
		@RequestMapping(params = "method=addcity")
		public @ResponseBody Json addcity(City_info city_info){
			System.out.println(city_info.getCity_type()+","+city_info.getCitye_parent_id()+","+city_info.getCityname());
			Json json = new Json();
			boolean citytype3=cs.addcity(city_info);
			json.setFlag(citytype3);
			return json;
		}
		/**
		 * 修改
		 * @param id
		 * @return
		 */
		@RequestMapping(params = "method=updatecity")
		public @ResponseBody Json updatecity(City_info city_info){
			System.out.println(city_info.getCity_type()+","+city_info.getCitye_parent_id()+","+city_info.getCityname());
			Json json = new Json();
			boolean citytype3=cs.updatecity(city_info);
			json.setFlag(citytype3);
			return json;
		}
		/**
		 * 删除
		 * @param id
		 * @return
		 */
		@RequestMapping(params = "method=deletecity")
		public @ResponseBody Json deletecity(City_info city_info){
			System.out.println(city_info.getCity_type()+","+city_info.getCitye_parent_id()+","+city_info.getCityname());
			Json json = new Json();
			int flag=cs.getdeletecount(city_info.getCitycode());
			System.out.println("多少："+flag);
			if(flag<=0){
				boolean flags=cs.deletecity(city_info);
				json.setFlag(flags);
			}else{
				json.setFlag(false);
				json.setAns("1");
			}
			
			return json;
		}
		
		/**
		 * 删除区县
		 * @param city_info
		 * @return
		 */
		@RequestMapping(params = "method=deleteqx")
		public @ResponseBody Json deleteqx(String[] del){
			Json json = new Json();
			boolean flag=cs.deleteqx(del);
			json.setFlag(flag);
			return json;
		}
		
}
