package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.ChangeOrder;
import com.jy.model.CreateAgreement;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public interface ChangeOrderInfoService {
	       public List<ShippingOrder> outShi(String[] checkarray);
	       public List<ShippingOrder> outShipOrder(String name,
					String phone_number, String type, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String[] checkarray,String driver_id);
			//所有人员的查询
			public List<ShippingOrder> getChangeOrderInfo(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date);
			//public  List<Driver> getDriver(String driver_name);
			public int getChangeOrder(String name ,String phone_number, String type,String start_date,String end_date);
			//删除
			public int deleteChangeOrder(String[] del);
			//保存
			public int saveChangeOrder(ChangeOrder d);
			//修改查询
			public ChangeOrder getUpdateChangeOrder(String id);
			//用户修改
			public int updateChangeOrder(ChangeOrder d);
			/*
			 * select 查询
			 * */
			List<ShippingOrder> getPlateNumberLength(String number);
			CreateAgreement getAddOrderFee(String id);//重复订单号查询
			List<ShippingOrder> getShipOrderAll(String name,
					String phone_number, String type,String start_date,String end_date) ;//导出查询
			/**
			 *  添加中转费时，修改订单状态是否录入 is_update 
			 * @param id
			 * @return
			 */
			public int  updateOrder(String id);
			/**
			 * 添加费用判断该订单是否已经被编辑费用：费用表是否有该订单信息
			 * @param id
			 * @return
			 */
			public int searchOrder(String id);
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
			public List<ShippingOrder>getBackOrderInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String driver_id);	//查询
			public  int getBackOrder(String name ,String  phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String driver_id);//查询总数
			 /**
			  *订单处理，是否接收
			  * @param deal
			  * @return
			  */
			public int dealBackOrder(@Param("array") String[] deal);//处理成接收
			public  int dealNotBackOrder(@Param("array") String[] deal,String nums,String company);//处理成为未收
			int dealBackOrderUpdate(@Param("array") String[] deal);//处理成接收取消
			int dealOrderUpdate(@Param("array") String[] deal);
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
			public List<ShippingOrder> getOrderInfo(int rows,int page,String num ,String receipt,String phone,String send_type);
			public int  getOrderInfoCount(String num ,String receipt,String phone,String send_type);
			 //提货单查询
			 List<ShippingOrder>getDeliveryOrderInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name);	//查询
			 int getDeliveryOrder(String name ,String  phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name);//查询总数
			 List<ShippingOrder> outDeliveryOrder(String name ,String  phone_number,String type,String start_date,String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String []checkarray);//查询总数
			//提货操作
			 int  updateFreeOrder(String[] ids,String users);
			 List<ShippingOrder> getShipOrder(String[] ids);
			 //打印提货单操作
			 int updateDyOrder(@Param("array")String[] ids,String users);
			 //保存图片
			 int  saveFilename(	List<ShipperOrderImg> list);
			// 查询订单签收图片
				List<ShipperOrderImg> getSingShiperOrderImg(String orderId);
}

