package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Claim_settlement;
import com.jy.model.Customer;
import com.jy.model.Overbooking;
import com.jy.model.ShippingOrder;

public interface OverbookingDao {
	/*
	 * 查询总条数
	 */
	public int getShipCheckInfoConun(String shiping_order_num,
			String shiping_accept_static, String custom_name, String receipt,
			String id);// 加id 查询当前登录的用户名数据

	/*
	 * 下单查询
	 */
	public List<Overbooking> getShipCheckInfo(int rows, int page,
			String shiping_order_num, String shiping_accept_static,
			String custom_name, String receipt, String id);

	/*
	 * 添加下单
	 */

	int insertInfo(Overbooking overbooking);

	// 查询最大的下单号
	String xdselect();

	/*
	 * 获取修改是id
	 */
	Overbooking updateId(String id);

	/*
	 * 修改的方法
	 */
	int getupdate(Overbooking shiping_orders_id);

	/*
	 * 删除的方法
	 */
	int deleteTravel(@Param("array") String[] del);

	/*
	 * 接收
	 */
	int updateunqualified(@Param("array") String[] shiping_orders_id);

	/*
	 * /查询发货的方法
	 */
	List<Customer> inquireName(String custom_name);

	/*
	 * 查询收货客户
	 */
	List<Overbooking> inquireName1(String receipt);

	/*
	 * 确认的方法
	 */
	int countersign(@Param("array") String[] shiping_orders_id);

	int getNumber(String shiping_order_num);// 重复订单号查询

	// app查询下单信息
	List<Overbooking> appGetOverBooking(int row, int length, String custom_id);

	/*
	 * 其他下单查询总条数
	 */
	public int adminGetShipCheckInfoConun(String shiping_order_num,
			String shiping_accept_static, String custom_name, String receipt);// 加id 查询当前登录的用户名数据

	/*
	 * 其他 下单查询
	 */
	public List<Overbooking> adminGetShipCheckInfo(int rows, int page,
			String shiping_order_num, String shiping_accept_static,
			String custom_name, String receipt);
}
