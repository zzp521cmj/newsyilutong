package com.jy.service;

import java.util.List;

import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public interface IncomeDpInfoService {
			//所有人员的查询
			public List<Income> getIncomeInfo(int rows,int page,String  receipt,String goods_name,String start_address,String car_number);
			//public  List<Driver> getDriver(String driver_name);
			public int getIncome(String  receipt,String goods_name,String start_address,String car_number);
			//删除
			public int deleteIncome(String[] del);
			//保存
			public int saveIncome(Income d);
			//修改查询
			public Income getUpdateIncome(String id);
			//用户修改
			 int updateIncome(Income d);
			/*
			 * select 查询
			 * */
			 List<Income>  getPlateNumber(String id);
			List<Income> getPlateNumberLength(String number);
			Income getNumber(String number);//重复订单号查询
//			List<Income> getIncomeAll(String  receipt,String goods_name,String start_address,String car_number) ;//导出查询
			/**
			 * 删除与需求相关的当单信息
			 * @param del
			 * @return
			 */
			int delIncome(String []del);
		
			/**
			 * hqhadd
			 */
			//所有人员的查询
			public List<Income> getIncomeList(String rows,String page,String  receipt,String goods_name,String start_address,String car_number);
			//public  List<Driver> getDriver(String driver_name);
			public int getIncomecount(String  receipt,String goods_name,String start_address,String car_number);
			
			public List<Income> getIncome1(int rows,int page,String  receipt,String goods_name,String start_address,String car_number);
			//public  List<Driver> getDriver(String driver_name);
			public 	int getIncomecount1(String  receipt,String goods_name,String start_address,String car_number);

			public int saveIncome(Sign_order sign_order);
			public int updatestate(String tatal_id);
			
			/**
			 * 订单图片路径
			 * @param sign_id
			 * @param paths
			 * @param paths2 
			 * @return
			 */
			int updateStatemake(String id);
			int getShipOrderMake(String id);//查询总数
			List<ShippingOrder> getShipOrderInfoMake(int rows,int page,String id);	//查询
			int updateStateship(String[] che);
			ShippingOrder getUpdateShipOrder(String id);
			public int saveIncome(String uuid, String order_id, String paths);
			/**
			 * 获取司机的订单
			 * @param string
			 * @return
			 */
			public List<Income> getCarIncome(String car_number);
			
			List<Income> getIncomeAll(String name,
					String phone_number, String type,String start_date,String end_date) ;//导出
			/**
			 * 总汇表车牌号查询
			 * @param id
			 * @return
			 */
			List<Income>IncemCarid(String id);

			  public int saveIncome2(List<Income> tlist);
}

