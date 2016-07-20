package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.KickbackDao;
import com.jy.model.ShippingOrder;
import com.jy.service.KickbackService;

@Component
public class KickbackServiceImpl implements KickbackService {
	@Resource
	private KickbackDao kickbackDao;

	public List<ShippingOrder> getKickbackInfo(int rows, int page, String shiping_order_num,
			String receipt,String startDate,String endDate,String kickback,
			String custom_name, String goods_name, String goods_num,
			String pay_type, String back_fee) {
		return kickbackDao.getKickbackInfo(rows, page, shiping_order_num, receipt, startDate, endDate, kickback, custom_name, goods_name, goods_num, pay_type, back_fee);
	}

	public int getKickback(String shiping_order_num, String receipt,
			String startDate, String endDate, String kickback,
			String custom_name, String goods_name, String goods_num,
			String pay_type, String back_fee) {
		return kickbackDao.getKickback(shiping_order_num, receipt, startDate, endDate, kickback, custom_name, goods_name, goods_num, pay_type, back_fee);
	}

	public int update(String zid, String type, String bz, String username) {
		return kickbackDao.update(zid, type, bz, username);
	}

	public int comback(String zid) {
		return kickbackDao.comback(zid);
	}

}
