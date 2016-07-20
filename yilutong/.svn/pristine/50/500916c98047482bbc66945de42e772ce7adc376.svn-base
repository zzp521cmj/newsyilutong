package com.jy.service;

import java.util.List;

import com.jy.model.CreateAgreement;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;

public interface MarginOrderService {
	public List<CreateAgreement> getMarginOrder(Integer rows, Integer page,String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String[]charray);
	public List<ShippingOrder> getMarginShip(Integer rows, Integer page, String name,String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String custom_id);
	public int getMarginOrderCount(String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone);
	public int getMarginShipCount(String name,String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String custom_id);
	public int updataRemarkShip(String id,String charge_remark1,String charge_remark2);
	public int updataRemarkCustom(String id,String remarks_fee1,String remarks_fee2);
}
