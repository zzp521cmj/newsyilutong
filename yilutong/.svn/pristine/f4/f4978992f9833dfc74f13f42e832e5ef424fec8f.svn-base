package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public  interface DeliveryDao {
	/**
	 * 制作协议分页
	 * @param del
	 * @return
	 * fgg
	 */
	 List<Delivery> getDeliveryCAM(int rows, int page,@Param("array") String[] pid);
	 
	int getDelivery(String send_type,String num,String start_time,String end_time,String types);//查询总数
	List<ShippingOrder> getDeliveryInfo(Integer rows,Integer page,String send_type,String num,String start_time,String end_time,@Param("array")String []checkarray,String types);	//全部查询
	List<Delivery> outgetDeliveryInfo(String endaddress,String num,String carnum,String receipt,String pay_type,String send_type,String custom_name,String order_state,String customid);	//全部查询
	 int deleteDelivery(@Param("array") String[] del);//删除
	 int saveDelivery(Delivery d);//保存
	 Delivery getUpdateDelivery(String id);//修改查询
	 int updateDelivery(Delivery d);//用户修改
	 /**
	  * 
	  * 结算历史
	  */
	 int getSetle(String num,String start_time,String end_time,String table_name,String table_type,String things,String free);//查询总数
	 List<ShippingOrder> getDeliverySetle(Integer rows,Integer page,String num,String start_time,String end_time,String table_name,String table_type,@Param("array")String []checkarray,String free,String things);//查询全部
	 List<Delivery> outgetSign(String num,String carnum,String receipt,String signperson,String goods_name,String goods_num,String pay_type,String send_time,String end_date,String customid);
	 /**
	  * 送货查询
	  */
	 int deliverGoods(String num,String start_time,String end_time);//查询总数
	 List<CreateAgreement> deliverGoodsInfo(Integer rows,Integer page,String num,String start_time,String end_time,@Param("array") String [] ids);//查询全部
	 List<Delivery> outdeliverGoodsInfo(String send_time,String send_timet,String num ,String carnum ,String signperson ,String goods_name,String goods_num ,String car_name,String receipt_address,String order_state,String customid);//查询全部

	 
	 /**
	  * 转运查询
	  */
	 int gettransferGoods(String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid);//查询总数
	 List<Delivery> gettransferGoodsInfo(int rows,int page,String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid);//查询全部
	 List<Delivery> outgettransferGoods(String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid);
		/*
	 * 获取数据下拉表的查询
	 * */
	List<Delivery> getPlateNumberLength(String number);
	Delivery getNumber(String number);//重复订单号查询
	int getAorder(String number);//重复订单号查询
	List<Delivery> getDeliveryAll(String name,
			String phone_number, String type,String start_date,String end_date) ;
	//协议制作订单查询
	int getDeliveryCA(String id ,String type,String start_date,String end_date,String send_station,String end_address,String car_number);//查询总数
	List<Delivery> getDeliveryInfoCA(int rows,int page,String id, String type,String start_date,String end_date,String send_station,String end_address,String car_number);	//查询
	/**
	 * 删除有需求关联的订单信息
	 * @param del
	 * @return
	 */
	int deleteShipToDemand(@Param("array")String []del);
	/**
	 * hqhadd
	 */
	//所有人员的查询
	List<Delivery> getSignDelivery(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String shipping_order_state);
	//public  List<Driver> getDriver(String driver_name);
	int getSignDeliverycount(String name ,String phone_number, String type,String start_date,String end_date,String shipping_order_state);
	Delivery getUpdateSignDelivery(String id);//修改查询
	List<Delivery> getSignDelivery1(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
	int getSignDeliverycount1(String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
	
	int saveSignDelivery(Sign_order sign_order);
	int updatestate(String shiping_order_id);
	/**
	 * 批量导入
	 * @param tlist
	 * @return
	 */
	int saveDeliverys(List<Delivery> tlist);
	/**
	 * 图片路径
	 * @param sign_id
	 * @param paths
	 * @param paths2 
	 * @return
	 */
	int saveSignImages(String uuid, String order_id, String paths);
	
	/**
	 * 获取司机的运单
	 * @param car_id
	 * @return
	 */
	List<Delivery> getCarDelivery(String car_id);

	List<Delivery> getUpdateDeliveryArray(String[] checkarray);
	/**
	 * 获取扫描信息
	 * @param string
	 * @return
	 */
	Delivery getAppDelivery(String string);
/**
 * 提货记录表车牌号查询
 * @param custom_id
 * @return
 */
	 List<Delivery>selectCarNumber(String  custom_id);
	 /**
	  * 中转公司名查询
	  * @param company
	  * @return
	  */
	 	 List<Delivery>selectCompany(String  company);
	 	
	 		/**
	 	 	 * 送货记录表车牌号查询
	 	 	 * @param car_id
	 	 	 * @return
	 	 	 */
	 	 		 List<Delivery>selectSendCar(String  car_id);
	 	 		
	 		
	 		/**
	 		 * 转运（中转）记录表车牌号查询
	 		 * @param car_id
	 		 * @return
	 		 */
	 			 List<Delivery>selectChangeCar(String  car_id);
	 			 /**
	 			  * 总库从表车牌号查询
	 			  * @param car_id
	 			  * @return
	 			  */
	 			 List<Delivery>selectCar(String  car_id);
	 			 /**
	 			  * 总库存表客户名称查询
	 			  * @param custom_name
	 			  * @return
	 			  */
	 			 List<OrderCustom>selectCustom(String  custom_name);
	 			
	
}
