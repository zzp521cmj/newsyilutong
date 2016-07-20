package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.Account_payableDao;
import com.jy.model.Claim_settlement;
import com.jy.model.Customer;
import com.jy.model.ShippingOrder;
import com.jy.service.Account_payableService;
@Service("Account_payableService")
public class Account_payableServiceImpl implements Account_payableService {
 @Resource 
  private Account_payableDao ao;
	public int count(String custom_name, String receipt,
			String shiping_order_num,String close_recheck) {
		int count=ao.count(custom_name, receipt, shiping_order_num,close_recheck);
		return count;
	}

	public List<ShippingOrder> dueselect(int row, int page, String custom_name,
			String receipt, String shiping_order_num,String close_recheck) {
		List<ShippingOrder> list=ao.dueselect(row, page, custom_name, receipt, shiping_order_num, close_recheck);
		return list;
	}

	public List<Customer> inquireName(String custom_name) {
		List<Customer> list = ao.inquireName(custom_name);
		return list;
	}

	public List<ShippingOrder> inquireName1(String receipt) {
		List<ShippingOrder> list=ao.inquireName1(receipt);
		return list;
	}

	public List<ShippingOrder> exportunqualified() {
		List<ShippingOrder> list=ao.exportunqualified();
		return list;
	}

	public List<ShippingOrder> outShi(String[] shiping_order_id) {
		List<ShippingOrder> list=ao.outShi(shiping_order_id);
		return list;
	}

}
