package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.CityDao;
import com.jy.model.City_info;
import com.jy.model.Menu;
import com.jy.service.CityService;
@Controller
public class CityServiceImpl implements CityService{
@Resource
private CityDao cd;
	public int getCity(String cityname, String cityzm) {
		int i=cd.getCity(cityname, cityzm);
		return i;
	}

	public List<City_info> getCityInfo(int rows, int page, String cityname,
			String cityzm) {
		List<City_info> list=cd.getCityInfo(rows, page, cityname, cityzm);
		return list;
	}

	public int deleteCity(String[] del) {
		int i=cd.deleteCity(del);
		return i;
	}

	public int saveCity(City_info d) {
		int i=cd.saveCity(d);
		return i;
	}

	public City_info getUpdateCity(int citycode) {
		City_info cityInfo=cd.getUpdateCity(citycode);
		return cityInfo;
	}

	public int updateCity(City_info d) {
		int i=cd.updateCity(d);
		return i;
	}
	/**
	 * 获取省份
	 */
	public String getcitytype1() {
		// TODO Auto-generated method stub
		List<City_info> city_infos=cd.getcitytype1();
		StringBuffer sb=new StringBuffer();
		sb.append("[");
		if(city_infos.size()>0){
			for (City_info city_info : city_infos) {
				sb.append("{\"id\":\""+city_info.getCitycode()+"\",\"citytype\":\""+city_info.getCity_type()+"\",\"iconCls\":\""+"icon-world"+"\",\"fid\":\""+city_info.getCitye_parent_id()+"\",\"text\":\""+city_info.getCityname()+"\",\"parent_id\":\""+city_info.getCitye_parent_id()+"\"},");
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
		}else{
			sb.append("{[]}");
		}
		System.out.println(sb.toString());
		return sb.toString();
	}
	/**
	 * 获取城市
	 */
	public String getcitytype2(String id) {
		// TODO Auto-generated method stub
		StringBuffer sb=new StringBuffer();
		List<City_info> city_infos=cd.getcitytype2(id);
		sb.append("[");
		if(city_infos.size()>0){
			for (City_info city_info : city_infos) {
				sb.append("{\"id\":\""+city_info.getCitycode()+"\",\"citytype\":\""+city_info.getCity_type()+"\",\"iconCls\":\""+"icon-star"+"\",\"fid\":\""+city_info.getCitye_parent_id()+"\",\"text\":\""+city_info.getCityname()+"\",\"parent_id\":\""+city_info.getCitye_parent_id()+"\"},");
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
		}else{
			sb.append("{[]}");
		}
		
		System.out.println(sb.toString());
		return sb.toString();
	}
	/**
	 * 获取区县
	 */
	public List<City_info> getcitytype3(String id) {
		// TODO Auto-generated method stub
		if(!"".equals(id)&&id!=null){
			List<City_info> list=cd.getcitytype3(id);
			return list;
		}
		else{
			return null;
		}
		
	}
	/**
	 * 添加
	 */
	public boolean addcity(City_info city_info) {
		// TODO Auto-generated method stub
		int flag=cd.addcity(city_info);
		if(flag>0)
			return true;
		else
			return false;
	}
	/**
	 * 更新
	 */
	public boolean updatecity(City_info city_info) {
		// TODO Auto-generated method stub
		int flag=cd.updatecity(city_info);
		if(flag>0)
			return true;
		else
			return false;
	}
	/**
	 * 删除
	 */
	public boolean deletecity(City_info city_info) {
		// TODO Auto-generated method stub
		int flag=cd.deletecity(city_info);
		if(flag>0)
			return true;
		else
			return false;
	}
	/**
	 * 删除区县
	 */
	public boolean deleteqx(String[] del) {
		// TODO Auto-generated method stub
		int flag=cd.deleteqx(del);
		if(flag>0)
			return true;
		else
			return false;
	}

	public int getdeletecount(int citycode) {
		// TODO Auto-generated method stub
		int flag=cd.getdeletecount(citycode);
		return flag;
	}
	
}
