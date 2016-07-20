package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.ChangeOrder;
import com.jy.model.CreateAgreement;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;

public  interface ChangeOrderDao {
	int getChangeOrder(String name ,String  phone_number,String type,String start_date,String end_date);//查询总数
	List<ShippingOrder> getChangeOrderInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date);	//查询司机
	 int deleteChangeOrder(@Param("array") String[] del);//删除
	 int saveChangeOrder(ChangeOrder d);//保存
	 ChangeOrder getUpdateChangeOrder(String id);//修改查询
	 int updateChangeOrder(ChangeOrder d);//修改
	List<ShippingOrder> getPlateNumberLength(String number);
	//订单号查询协议类型
	CreateAgreement getAddOrderFee(String id);
	List<ShippingOrder> getShipOrderAll(String name,
			String phone_number, String type,String start_date,String end_date) ;
	/**
	 *  添加中转费时，修改订单状态是否录入 is_update 
	 * @param id
	 * @return
	 */
	int  updateOrder(String id);
	/**
	 * 添加费用判断该订单是否已经被编辑费用：费用表是否有该订单信息
	 * @param id
	 * @return
	 */
	int searchOrder(String id);
	/**
	 * 客户回单查询订单
	 * @param rows
	 * @param page
	 * @param name
	 * @param phone_number
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
	 List<ShippingOrder>getBackOrderInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String driver_id);	//查询
	 int getBackOrder(String name ,String  phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String driver_id);//查询总数
	/***
	 * 回单导出
	 * */
	 public List<ShippingOrder> outShipOrder(String name,
				String phone_number, String type, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,@Param("array")String[] checkarray,String driver_id);
	 public List<ShippingOrder> outShi(@Param("array") String[] checkarray);//回单勾选导出
	 /**
	  *订单处理，是否接收
	  * @param deal
	  * @return
	  */
	 int dealBackOrder(@Param("array") String[] deal);//处理成接收
	 int dealNotBackOrder(@Param("array") String[] deal,String nums,String company);//处理成为寄出
	 int dealBackOrderUpdate(@Param("array") String[] deal);//处理成接收取消
	 int dealOrderUpdate(@Param("array") String[] deal);//寄出取消
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
	 List<ShippingOrder> getOrderInfo(int rows,int page,String num ,String receipt,String phone,String send_type);
	 int  getOrderInfoCount(String num ,String receipt,String phone,String send_type);
	 //提货单查询
	 List<ShippingOrder>getDeliveryOrderInfo(int rows,int page,String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);	//查询
	 int getDeliveryOrder(String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);//查询总数
	 List<ShippingOrder> outDeliveryOrder(String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,@Param("array")String []checkarray);//查询总数		
	//添加提货人
	 int  updateFreeOrder(@Param("array")String[] ids,String users);
	 List<ShippingOrder> getShipOrder(@Param("array")String[] ids);
	 //打印提货单操作
	 int updateDyOrder(@Param("array")String[] ids,String users);
	 //保存图片
	 int  saveFilename(	List<ShipperOrderImg> list);
	// 查询订单签收图片
		List<ShipperOrderImg> getSingShiperOrderImg(String orderId);
}
