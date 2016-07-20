package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.ChangeOrderDao;
import com.jy.model.ChangeOrder;
import com.jy.model.CreateAgreement;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.service.ChangeOrderInfoService;


@Service("ChangeOrderInfoService")

public class ChangeOrderInfoServiceImpl  implements ChangeOrderInfoService{
	@Resource
	private ChangeOrderDao so_dao;
	//查询分页

	public List<ShippingOrder> getChangeOrderInfo(int rows, int page,
			String name, String phone_number, String type,String start_date,String end_date) {
		 List<ShippingOrder> list=so_dao.getChangeOrderInfo(rows, page, name,  phone_number,type,start_date,end_date);
		return list;
	}

	public int getChangeOrder(String name, String phone_number,
			String type,String start_date,String end_date) {
		int count=so_dao.getChangeOrder(name, phone_number, type,start_date,end_date);
		return count;
	}

	public int deleteChangeOrder(String[] del) {
		int i=so_dao.deleteChangeOrder(del);
		return i;
	}
	
	public int saveChangeOrder(ChangeOrder d) {
		int i=so_dao.saveChangeOrder(d);
		return i;
	}

	public ChangeOrder getUpdateChangeOrder(String id) {
		ChangeOrder sp=so_dao.getUpdateChangeOrder(id);
		return sp;
	}

	public int updateChangeOrder(ChangeOrder d) {
		int i=so_dao.updateChangeOrder(d);
		return i;
	}

	public List<ShippingOrder> getPlateNumberLength(String number) {
		List<ShippingOrder> list=so_dao.getPlateNumberLength(number);
		return list;
	}

	public List<ShippingOrder> getShipOrderAll(String name,
			String phone_number, String type,String start_date,String end_date) {
		List<ShippingOrder> list=so_dao.getShipOrderAll(name, phone_number, type,start_date,end_date);
		return list;
	}
	//订单号查询协议类型
	public CreateAgreement getAddOrderFee(String id) {
		CreateAgreement der=so_dao.getAddOrderFee(id);
		return der;
	}
	/*
	 * 添加中转费，修改订单是否录入状态
	 * 	*/
	public int updateOrder(String id) {
		int i=so_dao.updateOrder(id);
		return i;
	}
	/**
	 * 添加费用判断该订单是否已经被编辑费用：费用表是否有该订单信息
	 * @param id
	 * @return
	 */
	public int searchOrder(String id){
		int i=so_dao.searchOrder(id);
		return i;
	}
	/**
	 * 客户回单模块
	 */
	public List<ShippingOrder> getBackOrderInfo(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String driver_id) {
		List<ShippingOrder> list=so_dao.getBackOrderInfo(rows, page, name, phone_number, type, start_date, end_date, start_date1, end_date1, start_date2, end_date2,custom_name, driver_id);
		return list;
	}

	public int getBackOrder(String name, String phone_number, String type,
			String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String driver_id) {
		int i=so_dao.getBackOrder(name, phone_number, type, start_date, end_date, start_date1, end_date1, start_date2, end_date2,custom_name, driver_id);
		return i;
	}

	public int dealBackOrder(String[] deal) {
		int i=so_dao.dealBackOrder(deal);
		return i;
	}

	public int dealNotBackOrder(String[] deal,String nums,String company) {
		int i=so_dao.dealNotBackOrder(deal,nums, company);
		return i;
	}
	public int dealBackOrderUpdate(String[] deal) {
		int i=so_dao.dealBackOrderUpdate(deal);
		return i;
	}

	public int dealOrderUpdate(String[] deal) {
		int i=so_dao.dealOrderUpdate(deal);
		return i;
	}
	 /**
	  * 订单发送消息页面订单查询
	  * @param rows
	  * @param page
	  * @param num
	  * @param receipt
	  * @param phone
	  * @param send_type
	  * @return
	  */
	public  List<ShippingOrder> getOrderInfo(int rows,int page,String num ,String receipt,String phone,String send_type){
		 List<ShippingOrder> list=so_dao.getOrderInfo(rows, page, num, receipt, phone, send_type);
		 return list;
	 }
	public  int  getOrderInfoCount(String num ,String receipt,String phone,String send_type){
		 int i=so_dao.getOrderInfoCount( num, receipt, phone, send_type);
		 return i;
	 }

	public List<ShippingOrder> outShipOrder(String name,
			String phone_number, String type, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String[] checkarray,String driver_id) {
		List<ShippingOrder>  list = so_dao.outShipOrder(name, phone_number, type, start_date, end_date, start_date1, end_date1, start_date2, end_date2, custom_name,checkarray, driver_id);
		return list;
	}

	public List<ShippingOrder> outShi(String[] checkarray) {
		
		return so_dao.outShi(checkarray);
	}

	public List<ShippingOrder> getDeliveryOrderInfo(int rows, int page,
			String ddId,
			String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname) {
			List<ShippingOrder>  list=so_dao.getDeliveryOrderInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
			return list;
	}

	public int getDeliveryOrder(String ddId,
			String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname) {
		int num=so_dao.getDeliveryOrder(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
		return num;
	}

	public List<ShippingOrder> outDeliveryOrder(String ddId,
			String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,String []checkarray) {
		List<ShippingOrder> list=so_dao.outDeliveryOrder(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,checkarray);
				return list;
	}

	public int updateFreeOrder(String[] ids, String users) {
		int i=so_dao.updateFreeOrder(ids, users);
		return i;
	}

	public List<ShippingOrder> getShipOrder(String[] ids) {
		 List<ShippingOrder>list=so_dao.getShipOrder(ids);
		return list;
	}

	public int updateDyOrder(String[] ids, String users) {
		int i=so_dao.updateDyOrder(ids, users);
		return i;
	}

	public int saveFilename(List<ShipperOrderImg> list) {		
		return so_dao.saveFilename(list);
	}

	public List<ShipperOrderImg> getSingShiperOrderImg(String orderId) {		
		return so_dao.getSingShiperOrderImg(orderId);
	}
}
