package com.jy.service;

import java.util.List;

import com.jy.model.CreateAgreement;
import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public interface DeliveryInfoService {
			//库存
			int getDelivery(String send_type,String num,String start_time,String end_time,String types);//查询总数
			List<ShippingOrder> getDeliveryInfo(Integer rows,Integer page,String send_type,String num,String start_time,String end_time,String []checkarray,String types);	//全部查询
				public List<Delivery> outgetDeliveryInfo(String endaddress,String num,String carnum,String receipt,String pay_type,String send_type,String custom_name,String order_state,String customid);
				 /**
				  * 
				  * 结算历史
				  */
				 int getSetle(String num,String start_time,String end_time,String table_name,String table_type,String things,String free);//查询总数
				 List<ShippingOrder> getDeliverySetle(Integer rows,Integer page,String num,String start_time,String end_time,String table_name,String table_type,String []checkarray,String free,String things);//查询全部
				 public List<Delivery> outgetSign(String num,String carnum,String receipt,String signperson,String goods_name,String goods_num,String pay_type,String send_time,String end_date,String customid);
			
					//配送结算记录
					public List<CreateAgreement> deliverGoodsInfo(Integer rows,Integer page,String num,String start_time,String end_time, String [] ids);
					public int  deliverGoods (String num,String start_time,String end_time);//查询全部
					List<Delivery> outdeliverGoodsInfo(String send_time,String send_timet,String num ,String carnum ,String signperson ,String goods_name,String goods_num ,String car_name,String receipt_address,String order_state,String customid);
			
				
				//删除
			public int deleteDelivery(String[] del);
			//保存
			public int saveDelivery(Delivery d);
			//修改查询
			public Delivery getUpdateDelivery(String id);
			//用户修改
			public int updateDelivery(Delivery d);
					//转运查询
			public List<Delivery> gettransferGoodsInfo(int rows,int page,String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid);
			public int gettransferGoods(String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid);
			public List<Delivery> outgettransferGoods(String  endaddress,String num,String carnum,String receipt,String changecompany,String pay_type,String goods_name,String goods_num,String order_state,String send_time,String end_date,String customid);
				/*
			 * select 查询
			 * */
			List<Delivery> getPlateNumberLength(String number);
			Delivery getNumber(String number);//重复订单号查询
			int getAorder(String number);//重复订单号查询
			List<Delivery> getDeliveryAll(String name,
					String phone_number, String type,String start_date,String end_date) ;//导出查询
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
			public List<Delivery> getSignDelivery(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String shipping_order_state);
			//public  List<Driver> getDriver(String driver_name);
			public int getSignDeliverycount(String name ,String phone_number, String type,String start_date,String end_date,String shipping_order_state);
			
			public List<Delivery> getSignDelivery1(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
			//public  List<Driver> getDriver(String driver_name);
			public int getSignDeliverycount1(String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
			
			public int saveSignDelivery(Sign_order sign_order);
			public int updatestate(String shiping_order_id);
			//修改查询
			public Delivery getUpdateSignDelivery(String id);
			//协议制作
			int getDeliveryCA(String id ,String type,String start_date,String end_date,String send_station,String end_address,String car_number);//查询总数
			List<Delivery> getDeliveryInfoCA(int rows,int page,String id ,String type,String start_date,String end_date,String send_station,String end_address,String car_number);	//查询
			List<Delivery> getDeliveryCAM(int rows, int page, String[] pid);//查询确定订单信息
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
			public List<Delivery> getCarDelivery(String car_id);
			public List<Delivery> getUpdateDeliveryArray(
					String[] checkarray);
			/**
			 * 查询扫描信息
			 * @param string
			 * @return
			 */
			public Delivery getAppDelivery(String string);
			
			/**
			 * 提货记录表车牌号查询
			 * @param custom_id
			 * @return
			 */
			public  List<Delivery>selectCarNumber(String  custom_id);
			 /**
			  * 中转公司名查询
			  * @param company
			  * @return
			  */
			public	 List<Delivery>selectCompany(String  company);
			 	
			 		/**
			 	 	 * 送货记录表车牌号查询
			 	 	 * @param car_id
			 	 	 * @return
			 	 	 */
			public List<Delivery>selectSendCar(String  car_id);
			 	 		
			 		
			 		/**
			 		 * 转运（中转）记录表车牌号查询
			 		 * @param car_id
			 		 * @return
			 		 */
			public	 List<Delivery>selectChangeCar(String  car_id);
			 			
			 /**
			  * 总库从表车牌号查询
			  * @param car_id
			  * @return
			  */
			public List<Delivery>selectCar(String  car_id);
			/**
			  * 总库存表客户名称查询
			  * @param custom_name
			  * @return
			  */
			public List<OrderCustom>selectCustom(String  custom_name);

}

