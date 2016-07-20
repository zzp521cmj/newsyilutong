package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.model.shipmentStatistics;

public  interface OrderDao {
	
	int getOrderCustom(String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String cid);//查询总数
	List<OrderCustom> getOrderCustomInfo(int rows,int page,String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String cid);	//查询司机
	 int deleteOrderCustom(@Param("array") String[] del);//删除
	 /**
	  * 根据客户车辆信息id删除相关订单信息
	  * @param pid
	  * @return
	  */
	 int deleteOrderMsg(@Param("array")String[] pid);
	 /**
	  * 查询是否有关联的订单
	  * @param pid
	  * @return
	  */
	 int OrderMsgNum(@Param("array")String[] pid);
	 int saveOrderCustom(OrderCustom d);//保存
	 OrderCustom getUpdateOrderCustom(String id);//修改查询
	 int updateOrderCustom(OrderCustom d);//用户修改
	 /**
	  * 修改订单备注
	  * @param pid
	  * @param notes
	  * @return
	  */
	 int getRemakesOrder(String pid,String notes,String remarks_orde ,String remarks_date);
	/*
	 * 获取数据下拉表的查询
	 * */
	List<OrderCustom> getPlateNumber(String number);
	
	List<OrderCustom> getOrderCustomAll(String name,
			String phone_number, String type,String start_date,String end_date) ;
	/**
	 * 批量导入
	 * @param tlist
	 * @return
	 */
	int saveShipOrders(List<ShippingOrder> tlist);
	/**
	 * 添加报表
	 * */
	int insertIntoShipStatis(shipmentStatistics ss); 
	/**
	 * 客户名称查询
	 * @param name
	 * @return
	 */
	List<OrderCustom> getCustomer(String name);
	/**
	 * 查询客户发车车次最大数
	 * */
	public OrderCustom getCar_timeMax(String customer_id);
	/**
	 * 查询重复订单号
	 * @param id
	 * @return
	 */
	int getAorder(String id);
	/**
	 *  查询订单所以信息页面展示
	 * @param pid
	 * @return
	 */
	Delivery getShipOrderMsg(String pid);
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
	User getUserCostom(String id);
}
