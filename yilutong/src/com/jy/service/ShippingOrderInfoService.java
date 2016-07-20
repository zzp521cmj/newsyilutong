package com.jy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.jy.model.MsgModel;
import com.jy.model.OrderHistory;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.jiLuLiShi;

public interface ShippingOrderInfoService {
	/**
	 * 添加修改历史记录
	 * */
    public int InsertShippjilu(jiLuLiShi js);
			//所有人员的查询
			public List<ShippingOrder> getShipOrderInfo(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String userid,String weitoudanhao);
			//public  List<Driver> getDriver(String driver_name);
			public int getShipOrder(String name ,String phone_number, String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String userid,String weitoudanhao);
			//删除
			public int deleteShipOrder(String[] del);
			//保存
			public int saveShipOrder(ShippingOrder d);
			//修改查询
			public ShippingOrder getUpdateShipOrder(String id);
			//用户修改
			public int updateShipOrder(ShippingOrder d);
			
			public  int isArrive(@Param("array") String[] del);//到达
			 /**
			  * 确定到达时候修改客户车到时间
			  * @param custom_id
			  * @return
			  */
			public  int isArriveCoustom(String custom_id);
			public  int isNotArrive(@Param("array") String[] del);//取消到达
			 /**
			  * 到达订单历史表存储
			  * @param order
			  * @return
			  */
			 public int saveOrderHistory(List<OrderHistory> order);
			 /**
			  * 取消到达删除数据
			  * @param order
			  * @return
			  */
			public  int deleteOrderHistory(String[] order);
			 
			/*
			 * select 查询
			 * */
			List<ShippingOrder> getPlateNumberLength(String number);
			ShippingOrder getNumber(String number);//重复订单号查询
			int getAorder(String number);//重复订单号查询
			List<ShippingOrder> getShipOrderAll(String[] customid,String custom_name1) ;//导出查询
			/**
			 * 删除与需求相关的当单信息
			 * @param del
			 * @return
			 */
			int deleteShipToDemand(String []del);
		
			/**
			 * hqhadd
			 */
			//订单签收导出
			List<ShippingOrder> getSignOutput( String name, String start_date, String end_date,
					String shipping_order_state,String custom_name,String receipt,String address,String dirivid,String[] fieleid);
			//所有人员的查询
			public List<ShippingOrder> getSignShipOrder(Integer rows,Integer page,String name ,String start_date,String end_date,String shipping_order_state,String custom_name,String receipt,String address,String dirivid);
			//public  List<Driver> getDriver(String driver_name);
			public int getSignShipOrdercount(String name,String start_date,String end_date,String shipping_order_state,String custom_name,String receipt,String address,String dirivid);
			
			public List<ShippingOrder> getSignShipOrder1(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
			//public  List<Driver> getDriver(String driver_name);
			public int getSignShipOrdercount1(String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
			
			public int saveSignShipOrder(Sign_order sign_order);
			public int updatestate(String shiping_order_id);
			//修改查询
			public ShippingOrder getUpdateSignShipOrder(String id);
			//协议制作
			int getShipOrderCA(String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number);//查询总数
			List<ShippingOrder> getShipOrderInfoCA(int rows,int page,String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number);	//查询
			List<ShippingOrder> getShipOrderCAM(int rows, int page, String[] pid);//查询确定订单信息
			/**
			 * 订单图片路径
			 * @param sign_id
			 * @param paths
			 * @param paths2 
			 * @return
			 */
			public int saveSignImages(String uuid, String order_id, String paths);
			/**
			 * 获取司机的订单
			 * @param string
			 * @return
			 */
			public List<ShippingOrder> getCarShipOrder(String car_id);
			public List<ShippingOrder> getUpdateShipOrderArray(
					String[] checkarray);
			/**
			 * 查询扫描信息
			 * @param string
			 * @return
			 */
			public ShippingOrder getAppShipOrder(String string);
			/**
			 * zzp添加发送短信模板
			 * @param msgTitle
			 * @param msgContent
			 * @return
			 */
			public int sendMsgModelInfo(String msgTitle, String msgContent);
			/**
			 * zzp select查询模板
			 * @return
			 */
			public List<MsgModel> getMsgModel();
			public String sendMsgContent(String msgid);
			/**
			 * f 跟踪单票
			 * @return
			 */
			public List<OrderHistory> getShowOrder(String pid);
			/**
			 * 订单历史修改记录
			 * @param d
			 * @return
			 */
			public int  saveOrderEHistory(ShippingOrder d);
			/**
			 * 删除订单修改信息
			 */
			public 	int deleteOrderEH(String []del);
			int deleteOrders(String []del);
			/**
			 * 电话预约
			 * */
			int updatePhone(@Param("array")String [] del,String tiem,String maeks);
			 //保存图片
			 int  saveFilename(	List<ShipperOrderImg> list);
			// 查询订单签收图片
				List<ShipperOrderImg> getSingShiperOrderImg(String orderId);
}

