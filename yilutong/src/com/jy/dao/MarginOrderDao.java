package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;

public interface MarginOrderDao {
	List<CreateAgreement> getMarginOrder(Integer rows, Integer page,String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,@Param("array")String []charray);//单车毛利查询
	List<ShippingOrder> getMarginShip(Integer rows, Integer page, String name,String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String custom_id);//单票毛利查询
	int getMarginOrderCount(String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone);
	int getMarginShipCount(String name,String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String custom_id);
	int updataRemarkShip(String id,String charge_remark1,String charge_remark2);
	int updataRemarkCustom(String id,String remarks_fee1,String remarks_fee2);
}
