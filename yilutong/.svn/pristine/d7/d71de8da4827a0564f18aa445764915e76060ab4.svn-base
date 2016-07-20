package com.jy.service;

import java.util.List;

import com.jy.model.Car_bid_record;
import com.jy.model.Car_bid_recordforoutput;

public interface Car_bid_recordInfoService {
	List<Car_bid_record> getCar_bid_recordInfo(int i, int page1,
			String publisher, String contactInformation, String plate_number);

	int getCar_bid_record(String publisher, String contactInformation,
			String plate_number);

	List<Car_bid_record> getCar_idLength(String plate_number);

	 List<Car_bid_record> getManuals(int i,int page,String zhuang, String xie, String models,String truckTypeId,String publisher,String determine);
	 int getManualsCount(String zhuang, String xie, String models,String truckTypeId,String publisher,String determine);

	int addManual(Car_bid_record record,String ids);

	 List<Car_bid_recordforoutput> getdc(String driname, String tele, String carno);
	 List<Car_bid_record> getAllCar(String username,String plateNumber,String tel);
}
