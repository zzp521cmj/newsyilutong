package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Company;
import com.jy.model.Confluence;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;

public interface Payable_fee_feeDAO {
	 int addSettlement(List<Settlement> list);
	int updateShippingOrdersFee(ShippingOrder d);//用户修改
	List<ShippingOrder> getDeliveryfeeList(int rows, int page,String send_station,
			String end_address, String send_time, String car_name,
			String send_date, String create_time,String write_off1,String receipt,String goods_name,String goods_num,String pay_type,String send_fee);
	public int getDeliveryfeeCount(String send_station,
			String end_address, String send_time, String car_name,
			String send_date, String create_time,String write_off1,String receipt,String goods_name,String goods_num,String pay_type,String send_fee);//查询总数
	int update(String shiping_order_id,String fee_writeoff,String fee_remarks1,String send_date_fee,String people_jie);//用户修改
	int delfee(String shiping_order_id,String fee_writeoff,String send_date_fee,String people_jie);
}
