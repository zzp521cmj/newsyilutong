package com.jy.dao;

import java.util.List;

import com.jy.model.CityAgreement;

public interface CityAgreementSearchDao {
	List<CityAgreement> getCityAgreementSearchInfo(int rows,int page,String pcd_code,String car_id,String iadate);
	int getCityAgreementSearch(String pcd_code,String car_id,String iadate);
	 List<CityAgreement> getCar_idLength(String plate_number);
	 /**
	  * 查询所有信息
	 * @param isArrive 
	 * @param did 
	 * @param userid 
	  * @return
	  */
	List<CityAgreement> getCityAgreementSearchAll(String isArrive, String did, String userid);
	/**
	 * 更新到达状态
	 * @param code
	 * @return
	 */
	int updateCityAgreement(String code);
}
