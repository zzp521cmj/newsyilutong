package com.jy.service;

import java.util.List;

import com.jy.model.ShippingOrder;

public interface KickbackService {
	// 所有的查询
	public List<ShippingOrder> getKickbackInfo(int rows, int page,
			String shiping_order_num, String receipt, String startDate,
			String endDate, String kickback, String custom_name,
			String goods_name, String goods_num, String pay_type,
			String back_fee);

	public int getKickback(String shiping_order_num, String receipt,
			String startDate, String endDate, String kickback, String custom_name,
			String goods_name, String goods_num, String pay_type,
			String back_fee);

	public int update(String zid, String type, String bz, String username);

	public int comback(String zid);
}
