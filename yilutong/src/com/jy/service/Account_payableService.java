package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Claim_settlement;
import com.jy.model.Customer;
import com.jy.model.ShippingOrder;

public interface Account_payableService {

	/*
	   * 查询总条数
	   */
		int count(String custom_name,String receipt, String shiping_order_num,String close_recheck);
		/*
		 * 应付款 查询
		 */
		List<ShippingOrder> dueselect(int row, int page,String custom_name,String receipt, String shiping_order_num,String close_recheck);

		/*
		 * /查询发货的方法
		 */
		List<Customer> inquireName(String custom_name);
		
		/*
		 * /查询收货的方法
		 */
		List<ShippingOrder> inquireName1(String receipt);
		
		/*
		 * 导出
		 */
		List<ShippingOrder> exportunqualified();
		
		/*
		 * 勾选导出
		 */
		 public List<ShippingOrder> outShi(String[] shiping_order_id);//回单勾选导出
		 

}
