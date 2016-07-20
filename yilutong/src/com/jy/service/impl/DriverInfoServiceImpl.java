package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DriverDao;
import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.DriverRegister;
import com.jy.service.DriverInfoService;

@Component
public class DriverInfoServiceImpl implements DriverInfoService {

	@Resource
	private DriverDao driverdao;

	// 查询分页
	public List<Driver> getDriverInfo(int rows, int page, String driver_name,
			String phone_number, String driving_type,String drivers_type,String driverid) {
		List<Driver> list = driverdao.getDriverInfo(rows, page, driver_name,
				phone_number, driving_type,drivers_type,driverid);
		return list;
	}

	public int getDriver(String driver_name, String phone_number,
			String driving_type,String drivers_type,String driverid) {
		int count = driverdao
				.getDriver(driver_name, phone_number, driving_type,drivers_type,driverid);
		return count;
	}

	// public List<Driver> getDriver(String driver_name){
	// List<Driver>list= driverdao.getDriver(driver_name);
	// return list;
	// }
	// 删除
	public int deleteDriver(String[] del) {
		int flag = driverdao.deleteDriver(del);
		return flag;
	}

	// 保存
	public int saveDriver(Driver d) {
		int flag = driverdao.saveDriver(d);
		return flag;
	}

	// 修改查询
	public Driver getUpdateDriver(String id) {
		Driver d = driverdao.getUpdateDriver(id);
		return d;
	}

	public int updateDriver(Driver d) {
		int flag = driverdao.updateDriver(d);
		return flag;
	}

	/*
	 * 选择框的查询
	 */
	public List<Driver> getDriver_length(String search) {
		List<Driver> list = driverdao.getDriver_length(search);
		return list;
	}

	public List<Driver> getPhone_length(String phones) {
		List<Driver> list = driverdao.getPhone_length(phones);
		return list;
	}

	public List<Driver> getDateLength(String date) {
		List<Driver> list = driverdao.getDateLength(date);
		return list;
	};

	public int searchDriver(String driver_name, String plate_number) {
		int i = driverdao.searchDriver(driver_name, plate_number);
		return i;
	}

	public List<Driver> driver(String num) {
		List<Driver> list = driverdao.driver(num);
		return list;
	}// 查询是司机的车牌

	public Driver ptype(String car) {
		Driver d = driverdao.ptype(car);
		return d;
	}

	/**
	 * 车牌
	 * 
	 * @param num
	 * @return
	 */
	public List<Driver> getnumberlength(String num) {
		List<Driver> list = driverdao.getnumberlength(num);
		return list;
	}

	/**
	 * 电话
	 * 
	 * @param id
	 * @return
	 */
	public Driver getPhone(String id) {
		Driver list = driverdao.getPhone(id);
		return list;
	}

	public List<CreateAgreement> getselectagreement(String[] id) {
		return driverdao.getselectagreement(id);
	}

	public int appSaveDriver(Driver d) {
		return driverdao.appSaveDriver(d);
	}

	public int appSaveRregisterImage(String id, String driverId, String imageUrl) {
		return driverdao.appSaveRregisterImage(id, driverId, imageUrl);
	}

	public DriverRegister getShenHeDriverInfo(String id) {
		return driverdao.getShenHeDriverInfo(id);
	}

	public int driverRegisterThrough(String driverId) {
		return driverdao.driverRegisterThrough(driverId);
	}

	public int deleteRegisterDriverMessage(String driverId) {
		return driverdao.deleteRegisterDriverMessage(driverId);
	}

	public int driverRegisterNotThrough(String userId) {
		return driverdao.driverRegisterNotThrough(userId);
	}

	public int updateRegisterState(String userId) {
	
		return driverdao.updateRegisterState(userId);
	}
}
