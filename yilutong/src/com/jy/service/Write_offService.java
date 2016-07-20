package com.jy.service;

import java.util.List;

import com.jy.model.Company;
import com.jy.model.ShippingOrder;

public interface Write_offService {
	/**
	 * 中转费用核销service
	 * fjz
	 */
	
	List<ShippingOrder> getChangeOrderInfo(int rows,int page,String shiping_order_num,String check_time,String updatetime);	
	//分页查询总数
	int getChangeOrder( String shiping_order_num,String check_time,String updatetime);
	
	ShippingOrder getUpdateShippingOrder(String id);//修改查询
	 int updateShippingOrder(ShippingOrder d);//是否核销
}
