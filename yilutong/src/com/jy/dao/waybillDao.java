package com.jy.dao;

import java.util.List;

import com.jy.model.ShippingOrder;
import com.jy.model.invoice;

public interface waybillDao {
	int getShipManual(String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name);//查询总数
	List<ShippingOrder> getShipManualInfo(int rows,int page,String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name );	//查询司机
	
	List<ShippingOrder> getShipManuals(String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name);//查询总数
	List<ShippingOrder> outShi(String[] ShippingOrderid);
}
