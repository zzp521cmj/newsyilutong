package com.jy.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.common.UUIDUtils;
import com.jy.dao.InsuranceDao;
import com.jy.model.Insurance;
import com.jy.model.Source;
import com.jy.service.InsuranceService;
/**
 * 保险信息
 *@author lx
 */
@Component
public class InsuranceServiceImpl implements InsuranceService {
	@Resource
	private InsuranceDao insurance;
	public List<Insurance> getInsurance(Integer page, Integer rows,String plateNumber) {
		List<Insurance> list = insurance.getInsurance(page, rows, plateNumber);
		return list;
	}

	public int getCount(String plateNumber) {
		int count = insurance.getCount(plateNumber);
		return count;
	}

	public int addInsurance(Insurance in) {
		in.setInsuranceId(UUIDUtils.getUUID());
		int add = insurance.addInsurance(in);
		return add;
	}

	public Insurance getEditInsurance(String insuranceId) {
		Insurance in = insurance.getEditInsurance(insuranceId);
		return in;
	}

	public int editInsurance(Insurance in) {
		int edit = insurance.editInsurance(in);
		return edit;
	}

	public int deleteInsurance(String[] insuranceId) {
		int delete = insurance.deleteInsurance(insuranceId);
		return delete;
	}

	public List<Insurance> getCar_Num(String travelCardId) {
		List<Insurance> list = insurance.getCar_Num(travelCardId);
		return list;
	}

	public List<Insurance> getAllInsurance(String plateNumber) {
		
		return insurance.getAllInsurance(plateNumber);
	}
	public List<Insurance> dangyueInsurance(String year, String month) {
		List<Insurance> list =insurance.dangyueInsurance(year, month);
		return list;
	}
	
}
