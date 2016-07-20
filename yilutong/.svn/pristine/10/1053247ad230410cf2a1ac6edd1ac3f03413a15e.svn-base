package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jy.dao.Driver_evaluationDao;
import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.Evaluate;
import com.jy.model.ShippingOrder;
import com.jy.service.Driver_evaluationService;

@Service("Driver_evaluationService")
public class Driver_evaluationServiceImpl implements Driver_evaluationService {
    @Resource
    private Driver_evaluationDao deo;
    
	public int count(String shiping_order_num, String goods_name,String grade, String bouns,String driverid) {
		int count=deo.count(shiping_order_num, goods_name, grade, bouns, driverid);
		return count;
	}

	public List<CreateAgreement> inquire(int rows, int page, String shiping_order_num, String goods_name,String grade, String bouns,String driverid) {
		List<CreateAgreement> list=deo.inquire(rows, page, shiping_order_num, goods_name, grade, bouns, driverid);
		return list;
	}

	public List<CreateAgreement> carp(String car_number1) {
		List<CreateAgreement> list=deo.carp(car_number1);
		return list;
	}

	public int insertinfo(Evaluate evaluate) {
		int count=deo.insertinfo(evaluate);
		return count;
	}

	public ShippingOrder getjUnqualified(String id) {
		ShippingOrder ct=deo.getjUnqualified(id);
		return ct;
	}

	public int deleteTravel(String[] agreement_id) {
		int count=deo.deleteTravel(agreement_id);
		return count;
	}

	public int drivercount(String driver_name,String ptype,String bouns,String bouns_time) {
		int count=deo.drivercount(driver_name, ptype,bouns, bouns_time);
		return count;
	}

	public List<Driver> listdriver(int rows, int pages, String driver_name,String ptype,String bouns,String bouns_time) {
		List<Driver> list=deo.listdriver(rows, pages, driver_name,  ptype,bouns, bouns_time);
		return list; 
	}

	public List<Driver> exportunqualified(String[] checkarray) {
		List<Driver> list=deo.exportunqualified(checkarray);
		return list;
	}



  
}
