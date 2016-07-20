package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.CityAgreementSearchDao;


import com.jy.model.CityAgreement;
import com.jy.service.CityAgreementSearchService;
@Controller
public class CityAgreementSearchServiceImpl implements CityAgreementSearchService{
	@Resource
	private CityAgreementSearchDao cas;

	public List<CityAgreement> getCityAgreementSearchInfo(int rows, int page,
			String pcd_code,String car_id,String iadate) {
		List< CityAgreement> list=cas.getCityAgreementSearchInfo(rows, page, pcd_code,car_id,iadate);
		return list;
	}
	public int getCityAgreementSearch(String pcd_code, String car_id,String iadate) {
		int count=cas.getCityAgreementSearch(pcd_code, car_id,iadate);
		return count;
	}
	public List<CityAgreement> getCar_idLength(String plate_number) {
		List< CityAgreement> list=cas.getCar_idLength(plate_number);
		return list;
	}
	/**
	 * 查询所有信息
	 */
	public List<CityAgreement> getCityAgreementSearchAll(String isArrive,String did,String userid) {
		// TODO Auto-generated method stub
		List< CityAgreement> list=cas.getCityAgreementSearchAll(isArrive,did,userid);
		return list;
	}
	/**
	 * 更新到达状态
	 */
	public boolean updateCityAgreement(String code) {
		// TODO Auto-generated method stub
		int flag=cas.updateCityAgreement(code);
		if(flag>0)
			return true;
		else
		return false;
	}
	
}
