package com.jy.service;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.jy.model.Car_owner;

public interface Car_ownerInfoService {
			//所有人员的查询
			public List<Car_owner> getCar_ownerInfo(int rows,int page,String car_owner_name ,String phone_number, String driving_type);
			//public  List<Driver> getDriver(String driver_name);
			public int getCar_owner(String car_owner_name ,String phone_number, String driving_type);
			//删除
			public int deleteCar_owner(String[] del);
			//保存
			public int saveCar_owner(Car_owner d);
			//修改查询
			public Car_owner getUpdateCar_owner(String id);
			//用户修改
			public int updateCar_owner(Car_owner d);
			/*
			 * select 查询
			 * */
			public List<Car_owner> getCar_ownerLength(String search) ;
			public List<Car_owner> getPhoneLength(String phones);
			List<Car_owner> getPlateNumberLength(String number);
}
