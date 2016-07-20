package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public interface IncomeInfoService {
	List<ShippingOrder> getShipOrderCAM(int rows, int page, String[] pid);
	 
	int getIncome(String name ,String  phone_number,String type,String start_date,String end_date);//查询总数
	List<Income> getIncomeInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date);	//查询司机
	 int deleteIncome(String[] del);//删除
	 int saveIncome(Income d);//保存
	 Income getUpdateIncome(String id);//修改查询
	 int updateIncome(Income d);//用户修改
	/*
	 * 获取数据下拉表的查询
	 * */
	List<Income>  getPlateNumber(String id);
	ShippingOrder getUpdateShipOrder(String id);
	List<Income> getIncomeAll(String name,
			String phone_number, String type,String start_date,String end_date) ;//导出
	/**
	 * 查询制作总数据
	 * @param del
	 * @return
	 */
	int getShipOrderMake(String id);//查询总数
	List<ShippingOrder> getShipOrderInfoMake(int rows,int page,String id);	//查询
	/**
	 * 批量导入
	 * @param tlist
	 * @return
	 */
	int saveIncomes(List<Income> tlist);
	/**
	 * 
	 * 制作总汇表订单的状态改变
	 * @param id
	 * @return
	 */
	int updateStatemake(String id);
	/**
	 * 总汇表车牌号查询
	 * @param id
	 * @return
	 */
	List<Income>IncemCarid(String id);
	/**
	 * 删除汇总信息修改订单状态
	 * @param del
	 * @return
	 */
	int updateStateship(String[] che);
}

