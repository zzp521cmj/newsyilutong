package com.jy.dao;

import java.util.List;

import com.jy.model.ShippingOrder;

public interface KickbackDao {
	List<ShippingOrder> getKickbackInfo(int rows, int page,
			String shiping_order_num, String receipt, String startDate,
			String endDate, String kickback,
			String custom_name, String goods_name, String goods_num,
			String pay_type, String back_fee);

	int getKickback(String shiping_order_num, String receipt, String startDate,
			String endDate, String kickback,
			String custom_name, String goods_name, String goods_num,
			String pay_type, String back_fee);

	int update(String zid, String type, String bz,String username);
	
	int comback(String zid);
}
