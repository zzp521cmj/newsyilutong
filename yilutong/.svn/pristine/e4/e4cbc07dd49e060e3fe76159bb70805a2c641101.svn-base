package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.Account_receivableDao;
import com.jy.model.Customer;
import com.jy.model.ShippingOrder;
import com.jy.service.Account_receivableService;
@Service("Account_receivableService")
public class Account_receivableServiceImpl implements Account_receivableService {
	@Resource
	private Account_receivableDao ado;
	
	public int count(String custom_name, String receipt,
			String shiping_order_num, String close_recheck) {
		int count=ado.count(custom_name, receipt, shiping_order_num, close_recheck);
		return count;
	}

	public List<ShippingOrder> dueselect(int row, int page, String custom_name,
			String receipt, String shiping_order_num, String close_recheck) {
		List<ShippingOrder> list=ado.dueselect(row, page, custom_name, receipt, shiping_order_num, close_recheck);
		return list;
	}

	public List<Customer> inquireName(String custom_name) {
		List<Customer> list=ado.inquireName(custom_name);
		return list;
	}

	public List<ShippingOrder> inquireName1(String receipt) {
		List<ShippingOrder> list=ado.inquireName1(receipt);
		return list;
	}

	public List<ShippingOrder> exportunqualified() {
		List<ShippingOrder> list=ado.exportunqualified();
		return list;
	}

	public List<ShippingOrder> outShi(String[] shiping_order_id) {
		List<ShippingOrder> list=ado.outShi(shiping_order_id);
		return list;
	}

}
