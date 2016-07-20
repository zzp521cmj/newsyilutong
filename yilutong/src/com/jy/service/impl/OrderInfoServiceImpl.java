package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.OrderDao;
import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.model.shipmentStatistics;
import com.jy.service.OrderInfoService;

@Service("OrderInfoService")

public class OrderInfoServiceImpl  implements OrderInfoService{
	@Resource
	private OrderDao so_dao;
	//查询分页

	public List<OrderCustom> getOrderCustomInfo(int rows, int page,
			String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String costomersid) {
		/*if(user.getCostomersid()==null||user.getCostomersid().equals("")){
			List<OrderCustom> list=so_dao.getOrderCustomInfo(rows, page, name, start_date1, end_date2, start_date, end_date, car_number, type, send_address, phone,is_arrive, null);			
		}else{
			List<OrderCustom> list=so_dao.getOrderCustomInfo(rows, page, name, start_date1, end_date2, start_date, end_date, car_number, type, send_address, phone,is_arrive, user.getCostomersid());		
		}*/
		List<OrderCustom> list=so_dao.getOrderCustomInfo(rows, page, name, start_date1, end_date2, start_date, end_date, car_number, type, send_address, phone,is_arrive, costomersid);
		return list;
	}

	public int getOrderCustom(String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String costomersid ) {
		int count=so_dao.getOrderCustom(name, start_date1, end_date2, start_date, end_date, car_number, type, send_address, phone,is_arrive,costomersid);
		return count;
	}

	public int deleteOrderCustom(String[] del) {
		int i=so_dao.deleteOrderCustom(del);
		return i;
	}
	/**
	  * 根据客户车辆信息id删除相关订单信息
	  * @param pid
	  * @return
	  */
	public  int deleteOrderMsg(String[] pid){
		int i=so_dao.deleteOrderMsg(pid);
		return i;
	}
	/**
	  * 查询是否有关联的订单
	  * @param pid
	  * @return
	  */
	public  int OrderMsgNum(String[] pid){
		int i=so_dao.OrderMsgNum(pid);
		return i;
	}
	public int saveOrderCustom(OrderCustom d) {
		int i=so_dao.saveOrderCustom(d);
		return i;
	}

	public OrderCustom getUpdateOrderCustom(String id) {
		OrderCustom sp=so_dao.getUpdateOrderCustom(id);
		return sp;
	}

	public int updateOrderCustom(OrderCustom d) {
		int i=so_dao.updateOrderCustom(d);
		return i;
	}

	public List<OrderCustom> getPlateNumber(String number) {
		List<OrderCustom> list=so_dao.getPlateNumber(number);
		return list;
	}
	

	public List<OrderCustom> getOrderCustomAll(String name,
			String phone_number, String type,String start_date,String end_date) {
		List<OrderCustom> list=so_dao.getOrderCustomAll(name, phone_number, type,start_date,end_date);
		return list;
	}
	
	/**
	 * 导入
	 * @param tlist
	 * @return
	 */
	public int saveimp(List<ShippingOrder> tlist) {
		// TODO Auto-generated method stub
		
		int i=so_dao.saveShipOrders(tlist);
		return i;
	}

	public List<OrderCustom> getCustomer(String name) {
		List<OrderCustom> list=so_dao.getCustomer(name);
		return list;
	}
	/**
	 * 查询重复订单号
	 * @param id
	 * @return
	 */
	public int getAorder(String id) {
		int i=so_dao.getAorder(id);
		return i;
	}
	//查询订单所有的信息
	public Delivery getShipOrderMsg(String pid) {
		Delivery d=so_dao.getShipOrderMsg(pid);
		return d;
	}
	 /**
	  * 修改订单备注
	  * @param pid
	  * @param notes
	  * @return
	  */
	public  int getRemakesOrder(String pid,String notes,String remarks_orde ,String remarks_date){
		int i=so_dao.getRemakesOrder(pid, notes, remarks_orde , remarks_date);
		return i;
	}
	/**
	 * 首页订单显示
	 */
	public List<ShippingOrder> getShipOrderInfo(int rows, int page,
			String name, String phone_number, String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name) {
		 List<ShippingOrder> list=so_dao.getShipOrderInfo(rows, page, name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address,goods_name);
		return list;
	}

	public int getShipOrder(String name, String phone_number,
			String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name) {
		int count=so_dao.getShipOrder(name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address,goods_name);
		return count;
	}
	/**
	 * 订单修改记录查询
	 * @param pid
	 * @return
	 */
	public int getShipOrder1(String pid){
		return so_dao.getShipOrder1(pid);
	}
	public List<ShippingOrder> getShipOrderInfo1(int rows,int page,String pid ){
		return so_dao.getShipOrderInfo1(rows, page, pid);
	}

	public List<ShippingOrder> OrderMsgIds(String[] pid) {
		return so_dao.OrderMsgIds(pid);
	}

	public int deleteOrder(List<ShippingOrder> list) {
		return so_dao.deleteOrder(list);
	}

	public int deleteOrdercustoms(String[] pid) {
		return so_dao.deleteOrdercustoms(pid);
	}

	public int insertIntoShipStatis(shipmentStatistics ss) {
		// TODO Auto-generated method stub
		return so_dao.insertIntoShipStatis(ss);
	}

	public OrderCustom getCar_timeMax(String customer_id) {
		// TODO Auto-generated method stub
		return so_dao.getCar_timeMax(customer_id);
	}
}
