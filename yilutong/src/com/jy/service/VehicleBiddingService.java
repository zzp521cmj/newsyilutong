package com.jy.service;

import java.util.List;

import com.jy.model.CreateAgreement;
import com.jy.model.VehiclevBidding;

public interface VehicleBiddingService {
	// 查询进价信息
	public List<VehiclevBidding> getDetermineVehicleMessage(int rows, int page,
			String cid, String car_name, String car_number1, String phone_number);

	// 查询进价条数
	int getDetermineVehicleTotal(String cid, String car_name,
			String car_number1, String phone_number);

	// 确定车辆
	int determineVehicleDriver(String allMoney, String agreement_id,
			String vehiclebidding_id, String driver_id, String plate_number,
			String driver_name, String car_id, String phone_number,
			String is_receipt_free);

	//查询司机对应的设备号
	String getChannelIdNo(String driver_id);
	
	//修改价格查询信息
	CreateAgreement getEidtPriceMessage(String driver_id,String agreement_id);
	
	int appEidtPrice(String vehiclebidding_id,String price,String is_edit);
	
	
	
	
}
