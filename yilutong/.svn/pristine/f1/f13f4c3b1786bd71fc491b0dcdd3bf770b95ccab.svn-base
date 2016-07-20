package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Car_owner;


public  interface Car_ownerDao {
	int getCar_owner(String car_owner_name ,String phone_number,String driving_type);//司机查询总数
	List<Car_owner> getCar_ownerInfo(int rows,int page,String car_owner_name ,String phone_number, String driving_type);	//查询司机
	 int deleteCar_owner(@Param("array") String[] del);//删除
	 int saveCar_owner(Car_owner d);//保存
	 Car_owner getUpdateCar_owner(String id);//修改查询
	 int updateCar_owner(Car_owner d);//用户修改
	/*
	 * 获取数据下拉表的查询
	 * */
	List<Car_owner> getCar_ownerLength(String search) ; 
	List<Car_owner> getPhoneLength(String phones);
	List<Car_owner> getPlateNumberLength(String number);
}
