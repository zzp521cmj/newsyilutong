package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.VehicleBiddingDao;
import com.jy.model.CreateAgreement;
import com.jy.model.VehiclevBidding;
import com.jy.service.VehicleBiddingService;
@Controller
public class VehicleBiddingServiceImp implements VehicleBiddingService {
	@Resource
	private VehicleBiddingDao biddingDao;

	public List<VehiclevBidding> getDetermineVehicleMessage(int rows, int page,String cid,String car_name,String car_number1,String phone_number) {
		return biddingDao.getDetermineVehicleMessage(rows, page,cid,car_name, car_number1,phone_number);
	}

	public int getDetermineVehicleTotal(String cid, String car_name,
			String car_number1, String phone_number) {
		return biddingDao.getDetermineVehicleTotal(cid, car_name, car_number1, phone_number);
	}

	public int determineVehicleDriver(String allMoney, String agreement_id,
			String vehiclebidding_id, String driver_id, String plate_number,
			String driver_name,String car_id,String phone_number,String is_receipt_free) {
		return biddingDao.determineVehicleDriver(allMoney, agreement_id, vehiclebidding_id, driver_id, plate_number, driver_name, car_id, phone_number,is_receipt_free);
		
	}

	public String getChannelIdNo(String driver_id) {
		String [] drivers = driver_id.split(",");
		return biddingDao.getChannelIdNo(drivers);
	}

	public CreateAgreement getEidtPriceMessage(String driver_id,
			String agreement_id) {
		return biddingDao.getEidtPriceMessage(driver_id, agreement_id);
	}

	public int appEidtPrice(String vehiclebidding_id, String price,
			String is_edit) {
		// TODO Auto-generated method stub
		return biddingDao.appEidtPrice(vehiclebidding_id, price, is_edit);
	}

	
}
