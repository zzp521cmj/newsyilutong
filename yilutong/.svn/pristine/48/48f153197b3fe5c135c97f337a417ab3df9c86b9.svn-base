package com.jy.service;

import java.util.List;

import com.jy.model.CityAgreement;

public interface CityAgreementSearchService {
	List<CityAgreement> getCityAgreementSearchInfo(int rows,int page,String pcd_code,String car_id,String iadate);
	int getCityAgreementSearch(String pcd_code,String car_id,String iadate);
	 List<CityAgreement> getCar_idLength(String plate_number);
	 /**
	  * 查询所有承运协议
	 * @param string 
	 * @param userid 
	  * @return
	  */
	List<CityAgreement> getCityAgreementSearchAll(String string,String did, String userid);
	/**
	 * 更新到达状态
	 * @param code
	 * @return
	 */
	boolean updateCityAgreement(String code);
}
