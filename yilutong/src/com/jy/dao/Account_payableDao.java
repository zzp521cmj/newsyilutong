package com.jy.dao;
/*
 * 应付款
 */
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Claim_settlement;
import com.jy.model.Customer;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;

public interface Account_payableDao {
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
	 public List<ShippingOrder> outShi(@Param("array") String[] shiping_order_id);
	 
}
