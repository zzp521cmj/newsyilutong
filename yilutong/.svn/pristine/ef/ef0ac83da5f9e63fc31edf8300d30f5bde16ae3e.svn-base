package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.waybillDao;
import com.jy.model.ShippingOrder;
import com.jy.service.waybillService;
@Service("waybillService")
public class waybillServiceImpl implements waybillService{
	@Resource
	private waybillDao waybillDao;
	public int getShipManual(String start_time, String end_time,
			String send_station, String end_address, String num,
			String receipt, String custom_name, String order_state,
			String pay_type, String send_type, String goods_name) {
		// TODO Auto-generated method stub
		return waybillDao.getShipManual(start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type, send_type, goods_name);
	}

	public List<ShippingOrder> getShipManualInfo(int rows, int page,
			String start_time, String end_time, String send_station,
			String end_address, String num, String receipt, String custom_name,
			String order_state, String pay_type, String send_type,
			String goods_name) {
		// TODO Auto-generated method stub
		return waybillDao.getShipManualInfo(rows, page, start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type, send_type, goods_name);
	}

	public List<ShippingOrder> getShipManuals(String start_time,
			String end_time, String send_station, String end_address,
			String num, String receipt, String custom_name, String order_state,
			String pay_type, String send_type, String goods_name
			) {
		// TODO Auto-generated method stub
		return waybillDao.getShipManuals(start_time, end_time, send_station, end_address, num, receipt, custom_name, order_state, pay_type, send_type, goods_name);
	}

	public List<ShippingOrder> outShi(String[] ShippingOrderid) {
		// TODO Auto-generated method stub
		return waybillDao.outShi(ShippingOrderid);
	}

}
