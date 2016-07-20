package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.Expenses_inquiryDao;
import com.jy.model.Customer;
import com.jy.model.ShippingOrder;
import com.jy.service.Expenses_inquiryService;
@Service("Expenses_inquiryService")
public class Expenses_inquiryServiceImpl implements Expenses_inquiryService {

	@Resource
	private Expenses_inquiryDao eid;
	
	public int count(String custom_name, String receipt,
			String shiping_order_num, String close_recheck) {
		int count=eid.count(custom_name, receipt, shiping_order_num, close_recheck);
		return count;
	}

	public List<ShippingOrder> dueselect(int row, int page, String custom_name,
			String receipt, String shiping_order_num, String close_recheck) {
		List<ShippingOrder> list=eid.dueselect(row, page, custom_name, receipt, shiping_order_num, close_recheck);
		return list;
	}

	public List<Customer> inquireName(String custom_name) {
		List<Customer> list=eid.inquireName(custom_name);
		return list;
	}

	public List<ShippingOrder> inquireName1(String receipt) {
		List<ShippingOrder> list=eid.inquireName1(receipt);
		return list;
	}

	public List<ShippingOrder> exportunqualified() {
		List<ShippingOrder> list=eid.exportunqualified();
		return list;
	}

	public List<ShippingOrder> outShi(String[] shiping_order_id) {
		List<ShippingOrder> list=eid.outShi(shiping_order_id);
		return list;
	}

}
