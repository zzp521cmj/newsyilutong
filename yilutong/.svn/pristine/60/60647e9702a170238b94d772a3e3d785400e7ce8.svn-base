package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public  interface IncomeDpDao {
	/**
	 * 制作协议分页
	 * @param del
	 * @return
	 */
	List<Income>IncemCarid(String id);
	 List<Income> getIncomeCAM(int rows, int page,@Param("array") String[] pid);
	 
	int getIncome( String  receipt,String goods_name,String start_address,String car_number);//查询总数
	List<Income> getIncomeInfo(int rows,int page ,String receipt,String goods_name,String start_address,String car_number);	//查询司机
	 int deleteIncome(@Param("array") String[] del);//删除
	 int saveIncome(Income d);//保存
	 Income getUpdateIncome(String id);//修改查询
	 int updateIncome(Income d);//用户修改
		List<Income> getPlateNumber(String id);
		List<Income> getIncomeAll(String name,
				String phone_number, String type,String start_date,String end_date) ;//导出
	/*
	 * 获取数据下拉表的查询
	 * */
	List<Income> getPlateNumberLength(String number);
	Income getNumber(String number);//重复订单号查询
	//List<Income> getIncomeAll(String  receipt,String goods_name,String start_address,String car_number) ;
	//协议制作订单查询
	int getIncomeCA(String  receipt,String goods_name,String start_address,String car_number);//查询总数
	List<Income> getIncomeCA(int rows,int page,String  receipt,String goods_name,String start_address,String car_number);	//查询
	/**
	 * 删除有需求关联的订单信息
	 * @param del
	 * @return
	 */
	int delIncome(@Param("array")String []del);
	/**
	 * hqhadd
	 */
	//所有人员的查询
	List<Income> getIncomeList(int rows,int page,String  receipt,String goods_name,String start_address,String car_number);
	//public  List<Driver> getDriver(String driver_name);
	int getIncomecount(String  receipt,String goods_name,String start_address,String car_number);
	
	List<Income> getIncome1(int rows,int page,String  receipt,String goods_name,String start_address,String car_number);
	int getIncomecount1(String  receipt,String goods_name,String start_address,String car_number);
	
	int saveIncome(Sign_order sign_order);
	int updatestate(String tatal_id);
	/**
	 * 批量导入
	 * @param tlist
	 * @return
	 */
	int saveIncome(List<Income> tlist);
	/**
	 * 图片路径
	 * @param sign_id
	 * @param paths
	 * @param paths2 
	 * @return
	 */
	int saveIncome(String uuid, String order_id, String paths);
	ShippingOrder getUpdateShipOrder(String id);
	/**
	 * 获取司机的运单
	 * @param car_id
	 * @return
	 */
	int updateStatemake(String id);
	int getShipOrderMake( String id);//查询总数
	List<Income> getCarIncome(String car_number);
	int updateStateship(@Param("array") String[] che);
	List<ShippingOrder> getShipOrderInfoMake(int rows,int page,String id);	//查询
}
