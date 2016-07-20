package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;



import com.jy.dao.Car_ownerDao;
import com.jy.model.Car_owner;
import com.jy.service.Car_ownerInfoService;

@Controller
public class Car_ownerInfoServiceImpl  implements Car_ownerInfoService{
	@Resource
	private Car_ownerDao car_ownerdao;
	//查询分页
		public List<Car_owner> getCar_ownerInfo(int rows,int page,String car_owner_name ,String phone_number, String driving_type) {
			List<Car_owner> list=car_ownerdao.getCar_ownerInfo(rows,page,car_owner_name,phone_number,driving_type);
			return list;
		}
		public int getCar_owner(String car_owner_name ,String phone_number, String driving_type) {
			int count =car_ownerdao.getCar_owner(car_owner_name,phone_number,driving_type);
			return count;
		}
//		public List<Driver> getDriver(String driver_name){
//			List<Driver>list= driverdao.getDriver(driver_name);
//			 return list;
//		}
		//删除
		public int deleteCar_owner(String[] del) {
				int flag=car_ownerdao.deleteCar_owner(del);
			return flag;
		}
		//保存
		public int saveCar_owner(Car_owner d) {
			int flag=car_ownerdao.saveCar_owner(d);
			return flag;
		}
		//修改查询
		public Car_owner getUpdateCar_owner(String id){
			Car_owner d=car_ownerdao.getUpdateCar_owner(id);
			return d;
		}
		public int updateCar_owner(Car_owner d){
			int flag=car_ownerdao.updateCar_owner(d);
				return flag;
		}
		/*
		 * 选择框的查询
		 * */
		public List<Car_owner> getCar_ownerLength(String search) {
			 	List<Car_owner> list=car_ownerdao.getCar_ownerLength(search);
			return list;
		}
		public List<Car_owner> getPhoneLength(String phones){
			List<Car_owner>list=car_ownerdao.getPhoneLength(phones);
			return list;
		}
		public List<Car_owner> getPlateNumberLength(String number){
			List<Car_owner>list=car_ownerdao.getPlateNumberLength(number);
			return list;
		}
}
