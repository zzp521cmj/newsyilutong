package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.CityTarmAgreementSearchDao;
import com.jy.model.CityAgreement;
import com.jy.service.CityTarmAgreementSearchService;
@Controller
public class CityTarmAgreementSearchServiceImpl implements CityTarmAgreementSearchService{
	@Resource
	private CityTarmAgreementSearchDao cas;

	public List<CityAgreement> getCityTarmAgreementSearchInfo(int rows, int page,String pcd_code, String car_id,String iadate) {
		List< CityAgreement> list=cas.getCityTarmAgreementSearchInfo(rows, page, pcd_code, car_id,iadate);
		return list;
	}
	public int getCityTarmAgreementSearch(String pcd_code, String car_id,String iadate) {
		int count=cas.getCityTarmAgreementSearch(pcd_code, car_id,iadate);
		return count;
	}
	public List<CityAgreement> getCar_idLength(String plate_number) {
		List< CityAgreement> list=cas.getCar_idLength(plate_number);
		return list;
	}
	/**
	 * 查询所有信息
	 */
	public List<CityAgreement> getCityTarmAgreementSearchAll(String isArrive) {
		// TODO Auto-generated method stub
		List< CityAgreement> list=cas.getCityTarmAgreementSearchAll(isArrive);
		return list;
	}
}
