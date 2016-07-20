package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.model.CreateAgreement;
import com.jy.model.VehiclevBidding;

/**
 * 车辆竞价
 * 
 * @author 90
 * 
 */
public interface VehicleBiddingDao {

	List<VehiclevBidding> getDetermineVehicleMessage(int rows, int page,
			String cid, String car_name, String car_number1, String phone_number);

	// 查询进价条数
	int getDetermineVehicleTotal(String cid, String car_name,
			String car_number1, String phone_number);

	int determineVehicleDriver(String allMoney, String agreement_id,
			String vehiclebidding_id, String driver_id, String plate_number,
			String driver_name, String car_id, String phone_number,
			String is_receipt_free);

	// 查询司机对应的设备号
	String getChannelIdNo(@Param("array")String[] driver_id);
	
	//修改价格查询信息
	CreateAgreement getEidtPriceMessage(String driver_id,String agreement_id);
	
	//修改竞价价格
	int appEidtPrice(String vehiclebidding_id,String price,String is_edit);
	

}
