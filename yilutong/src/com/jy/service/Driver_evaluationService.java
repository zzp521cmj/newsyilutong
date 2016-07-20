package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.Evaluate;
import com.jy.model.ShippingOrder;

public interface Driver_evaluationService {
	
	/*
	 * 查询司机总条数
	 */
	int drivercount(String driver_name,String ptype,String bouns,String bouns_time);
   /*
   * 查询所以司机
   */
	List<Driver> listdriver(int rows,int pages,String driver_name,String ptype,String bouns,String bouns_time);
	
	/*
	 * 查询总条数
	 */
	int count(String shiping_order_num, String goods_name,String grade, String bouns,String driverid);

	/*
	 * 查询所有数据
	 */
	List<CreateAgreement> inquire(int rows, int page, String shiping_order_num, String goods_name,String grade, String bouns,String driverid);
	
	/*
	 * 查询车牌号的方法
	 */
	List<CreateAgreement> carp(String car_number1);
	
	
	//添加的方法
	int insertinfo(Evaluate evaluate);
	
	
	/*
	 * 查询协议表id  添加到司机评价表
	 */
		 public ShippingOrder getjUnqualified(String id);
		 
		 /*
		 * 删除的方法
		*/
		int deleteTravel(String[] agreement_id);
		
		/*
		 * 导出
		 */
		List<Driver> exportunqualified(String[] checkarray);

}
