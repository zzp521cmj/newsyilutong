package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CustomerModel;
import com.jy.model.ShippingManual;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public interface ShippingManualInfoService {
	/**
	 * 查询手动录入shou货客户
	 * */	
	public List<CustomerModel> getCustomerShouHuo(int rows,int page,String name);
	/**
	 * 查询手动录入收货客户总行数
	 * */
	public int getCustomerShouHuoCount(String name);
	/**
	 * 查询手动录入发货客户
	 * */	
	public List<CustomerModel> getCustomerFahuo(int rows,int page,String name);
	/**
	 * 查询手动录入发货客户总行数
	 * */	
	public int getCustomerFahuoCount(String name);
	/**
	 * 添加手动录入收货客户电话
	 * */
	public int InsertItoCusShouhuo(CustomerModel cm);
	/**
	 * 添加手动录入发货客户电话
	 * */
	public int InsertItoCusFahuo(CustomerModel cm);
	/**
	 * 运单核对
	 * **/
	int updateCheck(ShippingOrder d);
	/**
	 * 运单核对查询
	 * **/
	public List<ShippingOrder> getShipCheckInfo(int rows,int page,String check_shping_time,String shiping_order_id,String send_type,String custom_name,String shipping_order_state,String receipt ,String goods_name,String userid);
	public int getShipCheckInfoConun(String check_shping_time,String shiping_order_id,String send_type,String custom_name,String shipping_order_state,String receipt ,String goods_name,String userid);
			//所有人员的查询
			public List<ShippingOrder> getShipManualInfo(int rows,int page,String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name,String userid,String weitoudanhao);
			//public  List<Driver> getDriver(String driver_name);
			public int getShipManual(String start_time,String end_time,String send_station,String end_address,String num,String receipt,String custom_name,String order_state,String pay_type ,String send_type,String goods_name,String userid,String weitoudanhao);
			//删除
			public int deleteShipManual(String[] del);
			//保存
			public int saveShipManual(ShippingOrder d);
			//修改查询
			public ShippingOrder getUpdateShipManual(String id);
			//用户修改
			public int updateShipManual(ShippingOrder d);
			
			public  int isArrive(@Param("array") String[] del);//到达
			public  int isNotArrive(@Param("array") String[] del);//取消到达			 
			/*
			 * select 查询
			 * */
			List<ShippingManual> getPlateNumberLength(String number);
			ShippingManual getNumber(String number);//重复订单号查询
			int getAorder(String number);//重复订单号查询
			List<ShippingManual> getShipManualAll(String name,String phone_number, String type,String start_date,String end_date) ;//导出查询
			/**
			 * 删除与需求相关的当单信息
			 * @param del
			 * @return
			 */
			int deleteShipToDemand(String []del);
		
			/**
			 * hqhadd
			 */
			//所有人员的查询
			public List<ShippingManual> getSignShipManual(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String shipping_order_state);
			//public  List<Driver> getDriver(String driver_name);
			public int getSignShipManualcount(String name ,String phone_number, String type,String start_date,String end_date,String shipping_order_state);
			
			public List<ShippingManual> getSignShipManual1(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
			//public  List<Driver> getDriver(String driver_name);
			public int getSignShipManualcount1(String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
			
			public int saveSignShipManual(Sign_order sign_order);
			public int updatestate(String shiping_order_id);
			//修改查询
			public ShippingManual getUpdateSignShipManual(String id);
			//协议制作
			int getShipManualCA(String id ,String name,String phone_number, String type, String start_date, String end_date,String send_station,String end_address,String car_number);//查询总数
			List<ShippingManual> getShipManualInfoCA(int rows,int page,String id ,String name,String phone_number, String type, String start_date, String end_date,String send_station,String end_address,String car_number);	//查询
			List<ShippingManual> getShipManualCAM(int rows, int page, String[] pid);//查询确定订单信息
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
			public List<ShippingManual> getCarShipManual(String car_id);
			public List<ShippingManual> getUpdateShipManualArray(
					String[] checkarray);
			/**
			 * 查询扫描信息
			 * @param string
			 * @return
			 */
			public ShippingManual getAppShipManual(String string);
			/**
			 * 修改历史订单表
			 * @param d
			 * @return
			 */
			public int updateShip(ShippingOrder d);
			/**
			 * 删除订单及相关历史订单表
			 * @param del
			 * @return
			 */
			 public int deleteShip(@Param("array")String []del);
			public int updateprinttype(String[] pid);
			public List<ShippingOrder> editgetShipManualInfo(int i,
					Integer rows1, String start_time, String end_time,
					String send_station, String end_address, String num,
					String receipt, String custom_name, String order_state,
					String pay_type, String send_type, String goods_name,
					String id, String weitoudanhao);
			public int editgetShipManual(String start_time, String end_time,
					String send_station, String end_address, String num,
					String receipt, String custom_name, String order_state,
					String pay_type, String send_type, String goods_name,
					String id, String weitoudanhao);

}

