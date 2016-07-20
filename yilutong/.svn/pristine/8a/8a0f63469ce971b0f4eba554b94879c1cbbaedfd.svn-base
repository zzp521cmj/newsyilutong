package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.DriverRegister;

public interface DriverDao {
	int getDriver(String driver_name, String phone_number, String driving_type,String drivers_type,String driverid);// 司机查询总数

	List<Driver> getDriverInfo(int rows, int page, String driver_name,
			String phone_number, String driving_type,String drivers_type,String driverid); // 查询司机
	// public List<Driver> getDriver(String driver_name);

	public int deleteDriver(@Param("array") String[] del);// 删除

	public int saveDriver(Driver d);// 保存

	public Driver getUpdateDriver(String id);// 修改查询

	public int updateDriver(Driver d);// 用户修改

	public List<CreateAgreement> getselectagreement(@Param("array") String[] id);// 查询是否已做协议

	/*
	 * 获取数据下拉表的查询
	 */
	/**
	 * 司机人名查询
	 * 
	 * @param search
	 * @return
	 */
	public List<Driver> getDriver_length(String search);

	/**
	 * 司机模块的车牌查询
	 * 
	 * @param phones
	 * @return
	 */
	public List<Driver> getPhone_length(String phones);

	public List<Driver> getDateLength(String date);

	public int searchDriver(String driver_name, String plate_number);

	public List<Driver> driver(String num);// 查询是司机的车牌

	public Driver ptype(String car);// 信息查询

	/**
	 * 所有车牌
	 * 
	 * @param num
	 * @return
	 */
	public List<Driver> getnumberlength(String num);

	/**
	 * 电话
	 * 
	 * @param id
	 * @return
	 */
	public Driver getPhone(String id);

	// app保存司机信息
	public int appSaveDriver(Driver d);

	// APP司机注册保存图片信息
	public int appSaveRregisterImage(String id, String driverId, String imageUrl);

	// 获取审核司机信息
	public DriverRegister getShenHeDriverInfo(String id);

	// 审核通过
	int driverRegisterThrough(String driverId);
	//审核通过更新用户状态
	int updateRegisterState(String userId);

	// 审核不通过
	int deleteRegisterDriverMessage(String driverId);

	// 审核不通过
	int driverRegisterNotThrough(String userId);

}
