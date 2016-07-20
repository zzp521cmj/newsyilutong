package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.ChangeOrder;
import com.jy.model.CreateAgreement;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public interface CoustomBaobInfoService {
	int getCoustomBaob(String ddId, String city1, String start_date,
			String end_date, String start_date1, String end_date1,
			String pay_type, String fhname);// 查询总数

	List<ShippingOrder> getCoustomBaobInfo(int rows, int page, String ddId,
			String city1, String start_date, String end_date,
			String start_date1, String end_date1, String pay_type, String fhname); // 查询司机

	/**
	 * 每日报表
	 */
	List<ShippingOrder> getOrderInfoT(String statrt, String end, String name);// 查询

	/**
	 * 周报表
	 */
	List<ShippingOrder> getOrderInfoD(String statrt, String end, String name); // 查询

	List<ShippingOrder> getOrderInfoM(String statrt, String end, String name);// 查询总数

	/**
	 * 年报表
	 */
	List<ShippingOrder> getOrderInfoY(String statrt, String end, String name);

	/***
	 * 导出
	 * */
	public List<ShippingOrder> outCoustomBaob(String ddId, String city1,
			String start_date, String end_date, String start_date1,
			String end_date1, String pay_type, String fhname,String []checkarray);

	// 查询当天签收数量
	public int outShi(String checkarray);

	// 保存当天签收数据
	public int addDelivery(String censusid, String nums, String censustimes);
	// 预留方法 int updateDyOrder(@Param("array")String[] ids,String users);

}
