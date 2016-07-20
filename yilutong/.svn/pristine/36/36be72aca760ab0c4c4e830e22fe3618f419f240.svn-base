package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.City_info;



public interface CityDao {
	//查询总数
	int getCity(String cityname,String cityzm);
	List<City_info> getCityInfo(int rows,int page,String cityname,String cityzm);	//查询
	public int deleteCity(@Param("array") String[] del);//删除
	public int saveCity(City_info d);//保存
	public City_info getUpdateCity(int citycode);//修改查询
	public int updateCity(City_info d);//用户修改
	/**
	 * 获取省份
	 * @return
	 */
	List<City_info> getcitytype1();
	/**
	 * 获取城市
	 * @param id
	 * @return
	 */
	List<City_info> getcitytype2(String id);
	/**
	 * 获取区县
	 * @param id
	 * @return
	 */
	List<City_info> getcitytype3(String id);
	/**
	 * 添加
	 * @param city_info
	 * @return
	 */
	int addcity(City_info city_info);
	/**
	 * 更新
	 * @param city_info
	 * @return
	 */
	int updatecity(City_info city_info);
	/**
	 * 删除
	 * @param city_info
	 * @return
	 */
	int deletecity(City_info city_info);
	/**
	 * 删除区县
	 * @param del
	 * @return
	 */
	int deleteqx(String[] del);
	/**
	 * 返回要删除的节点下边是否有子节点
	 * @param citycode
	 * @return
	 */
	int getdeletecount(int citycode);
}
