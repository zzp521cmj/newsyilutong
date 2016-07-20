package com.jy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.shipmentStatistics;

public interface OrderInfoService {
	/**
	 * 添加报表
	 * */
	int insertIntoShipStatis(shipmentStatistics ss);
			//所有人员的查询
			public List<OrderCustom> getOrderCustomInfo(int rows,int page,String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String costomersid);
			//public  List<Driver> getDriver(String driver_name);
			public int getOrderCustom(String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String costomersid);
			//删除
			public int deleteOrderCustom(String[] del);
			 /**
			  * 根据客户车辆信息id删除相关订单信息
			  * @param pid
			  * @return
			  */
			public int deleteOrderMsg(String[] pid);
			/**
			  * 查询是否有关联的订单
			  * @param pid
			  * @return
			  */
			public  int OrderMsgNum(String[] pid);
			//保存
			public int saveOrderCustom(OrderCustom d);
			//修改查询
			public OrderCustom getUpdateOrderCustom(String id);
			//用户修改
			public int updateOrderCustom(OrderCustom d);
			/*
			 * select 查询
			 * */
			List<OrderCustom> getPlateNumber(String number);
			
			/**
			 * 客户名称查询
			 * @param name
			 * @return
			 */
			public List<OrderCustom> getCustomer(String name);
			/**
			 * 查询客户发车车次最大数
			 * */
			public OrderCustom getCar_timeMax(String customer_id);
			public List<OrderCustom> getOrderCustomAll(String name,
					String phone_number, String type,String start_date,String end_date) ;//导出查询
			/**
			 * 查询重复订单号
			 * @param id
			 * @return
			 */
			public	int getAorder(String id);
			 	/**
			 *  查询订单所以信息页面展示
			 * @param pid
			 * @return
			 */
			public Delivery getShipOrderMsg(String pid);
			
			 /**
			  * 修改订单备注
			  * @param pid
			  * @param notes
			  * @return
			  */
			public  int getRemakesOrder(String pid,String notes,String remarks_orde ,String remarks_date);
			/**
			 * 首页订单页面显示
			 * @param name
			 * @param phone_number
			 * @param type
			 * @param start_date
			 * @param end_date
			 * @param pid
			 * @param phone
			 * @param order_state
			 * @param pay_type
			 * @param send_address
			 * @return
			 */
			int getShipOrder(String name ,String  phone_number,String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name);//查询总数
			List<ShippingOrder> getShipOrderInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name );	//查询司机
			/**
			 * 订单修改记录查询
			 * @param pid
			 * @return
			 */
			int getShipOrder1(String pid);//查询总数
			List<ShippingOrder> getShipOrderInfo1(int rows,int page,String pid );	//查询司机
			//查询订单id
			List<ShippingOrder> OrderMsgIds(@Param("array")String[] pid);
			int deleteOrder(List<ShippingOrder> list);
			int deleteOrdercustoms(@Param("array")String[] pid);
}

