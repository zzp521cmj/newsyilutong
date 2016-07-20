package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.Payable_fee_feeDAO;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.service.Payable_fee_feeService;
@Component
public class Payable_fee_feeServiceImpl implements Payable_fee_feeService {
		
	@Resource
	private Payable_fee_feeDAO payable_fee_feeDAO;

	public int updateShippingOrdersFee(ShippingOrder d) {
		// TODO Auto-generated method stub
		return payable_fee_feeDAO.updateShippingOrdersFee(d);
	}
	public int update(String shiping_order_id, String fee_writeoff,
			String fee_remarks1, String send_date_fee, String people_jie) {
		// TODO Auto-generated method stub
		return payable_fee_feeDAO.update(shiping_order_id, fee_writeoff, fee_remarks1, send_date_fee, people_jie);
	}
	public int delfee(String shiping_order_id, String fee_writeoff,
			String send_date_fee, String people_jie) {
		// TODO Auto-generated method stub
		return payable_fee_feeDAO.delfee(shiping_order_id, fee_writeoff, send_date_fee, people_jie);
	}
	public int addSettlement(List<Settlement> list) {
		int i = payable_fee_feeDAO.addSettlement(list);
		return i;
	}
	public List<ShippingOrder> getDeliveryfeeList(int rows, int page,
			String send_station, String end_address, String send_time,
			String car_name, String send_date, String create_time,
			String write_off1, String receipt, String goods_name,
			String goods_num, String pay_type, String send_fee) {
		// TODO Auto-generated method stub
		return payable_fee_feeDAO.getDeliveryfeeList(rows, page, send_station, end_address, send_time, car_name, send_date, create_time, write_off1, receipt, goods_name, goods_num, pay_type, send_fee);
	}
	public int getDeliveryfeeCount(String send_station, String end_address,
			String send_time, String car_name, String send_date,
			String create_time, String write_off1, String receipt,
			String goods_name, String goods_num, String pay_type,
			String send_fee) {
		// TODO Auto-generated method stub
		return payable_fee_feeDAO.getDeliveryfeeCount(send_station, end_address, send_time, car_name, send_date, create_time, write_off1, receipt, goods_name, goods_num, pay_type, send_fee);
	}
	
}
