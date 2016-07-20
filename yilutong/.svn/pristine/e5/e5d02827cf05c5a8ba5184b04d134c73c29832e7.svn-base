package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.AgreementCarMessage;
import com.jy.model.Company;
import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.GuanlianCA;
import com.jy.model.JySplitShiping;
import com.jy.model.ShippingOrder;
import com.jy.model.VehiclevBidding;

public interface CreatAgreementDao {
	
	/**
	 * 查询总数
	 * @param id
	 * @param start_date
	 * @param end_date
	 * @param car_name
	 * @param car_number1
	 * @param agreement_type
	 * @param end_address
	 * @param company_id
	 * @param phone_number
	 * @param order_state
	 * @param departid
	 * @param start_address
	 * @return
	 */
	int getCreateAgreement(String id, String start_date, String end_date,
			String car_name, String car_number1, String agreement_type,
			String end_address, String company_id, String phone_number,
			String order_state, String departid, String start_address);// 

	/**
	 * 查询协议信息
	 * @param rows
	 * @param page
	 * @param id
	 * @param start_date
	 * @param end_date
	 * @param car_name
	 * @param car_number1
	 * @param agreement_type
	 * @param end_address
	 * @param company_id
	 * @param phone_number
	 * @param order_state
	 * @param departid
	 * @param start_address
	 * @return
	 */
	List<CreateAgreement> getCreateAgreementInfo(int rows, int page, String id,
			String start_date, String end_date, String car_name,
			String car_number1, String agreement_type, String end_address,
			String company_id, String phone_number, String order_state,
			String departid, String start_address); 

	/**
	 * 保存协议
	 * @param d
	 * @return
	 */
	int saveCreateAgreement(CreateAgreement d);// 保存

	/**
	 * 修改协议查询
	 * @param id
	 * @return
	 */
	CreateAgreement getUpdateCreateAgreement(String id);// 修改查询

	/**
	 * 更新承运协议
	 * 
	 * @param d
	 * @return
	 */
	int updateCreateAgreement(CreateAgreement d);

	int searchOrder(String ids);

	/*
	 * 获取数据下拉表的查询
	 */
	List<CreateAgreement> getPlateNumberLength(String number);

	CreateAgreement getNumber(String number);// 重复订单号查询

	List<CreateAgreement> getCreateAgreementAll(
			@Param("array") String[] getCreateAgreementAll, String start_date,
			String end_date, String car_name, String car_number1,
			String agreement_type, String end_address, String company_id,
			String phone_number, String order_state, String departid);

	/**
	 * 关联表的保存
	 * 
	 * @param list
	 * @return
	 */
	int saveAgreementToorder(List<GuanlianCA> list);

	/**
	 * 制作协议修改订单状态
	 * 
	 * @param pid
	 * @return
	 */
	int updateState(Integer state, @Param("array") String[] pid);

	/**
	 * 详情信息订单号关联查询
	 * 
	 * @param id
	 * @return
	 */
	List<GuanlianCA> getXXCreateAgreement(String id);

	// 作废时 的步骤
	/**
	 * 协议表的删除
	 * 
	 * @param del
	 * @return
	 */
	int deleteCreateAgreement(@Param("array") String[] del);// 删除

	/**
	 * 关联表订单号查询
	 * 
	 * @param del
	 * @return
	 */
	List<GuanlianCA> orderNumber(@Param("array") String[] del);

	/**
	 * 删除关联表的关联信息
	 * 
	 * @param del
	 * @return
	 */
	int deleToOder(@Param("array") String[] del);

	/**
	 * 将订单修改到初始状态
	 * 
	 * @param list
	 * @return
	 */
	int deleState(List<GuanlianCA> list);

	/**
	 * 中转公司查询
	 * 
	 * @param name
	 * @return
	 */
	List<Company> getCompany(String name);

	/**
	 * 修改金额
	 * 
	 * @param name
	 * @return
	 */
	int updataMoney(String id, String practiacl_num, String send_fee,
			String send_remarks, String change_pay, String change_remarks,
			String chanage_pay_type, String change_other, String upstairs_fee,
			String change_back_fee, String change_back_type,
			String change_handling, String paidtc_fu, String change_feilv);

	/**
	 * 修改协议价格查询原先的协议信息
	 * 
	 * @param id
	 * @return
	 */
	ShippingOrder getUpdateShipping(String id);

	/**
	 * 修改总金额
	 * 
	 * @param name
	 * @return
	 */
	int updataZong(String cid, String money, Integer count);

	/**
	 * 移除协议中的运单
	 * 
	 * @param name
	 * @return
	 */
	int removeShip(String cid, @Param("array") String[] pid);

	/**
	 * 制作承运协议查询总条数
	 * 
	 * @param id
	 * @param startDate
	 * @param end_date
	 * @param ddId
	 * @param order_state
	 * @param pay_type
	 * @param perpole
	 * @param end_address
	 * @param send_address
	 * @param phone_number
	 * @return
	 */
	int getShipOrderCA(String id, String startDate, String end_date,
			String ddId, String order_state, String pay_type, String perpole,
			String end_address, String send_address, String phone_number,
			String send_type);// 查询总数

	/**
	 * 制作承运协议查询信息
	 * 
	 * @param rows
	 * @param page
	 * @param id
	 * @param startDate
	 * @param end_date
	 * @param ddId
	 * @param order_state
	 * @param pay_type
	 * @param perpole
	 * @param end_address
	 * @param send_address
	 * @param phone_number
	 * @return
	 */
	List<ShippingOrder> getShipOrderInfoCA(int rows, int page, String id,
			String startDate, String end_date, String ddId, String order_state,
			String pay_type, String perpole, String end_address,
			String send_address, String phone_number, String send_type);

	/**
	 * 制作承运协议的时候选择司机信息
	 * 
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @param did
	 * @return
	 */
	public List<AgreementCarMessage> getTravel(Integer page, Integer rows,
			String plateNumber, String did, String carLength, String length_name);

	/**
	 * 制作承运协议查询司机总条数
	 * 
	 * @param plateNumber
	 * @param did
	 * @return
	 */
	public int getCount(String plateNumber, String did, String carLength,
			String length_name);

	/**
	 * 拆分订单是查询订单信息
	 * 
	 * @param pid
	 * @return
	 */
	List<ShippingOrder> getSplitShipOrderMessage(@Param("array") String[] pid);

	/**
	 * 保存被拆分之前的订单信息
	 * 
	 * @param oldShipId
	 * @return
	 */
	int saveSplitOldShipOrder(String oldShipId);

	/**
	 * 保存新的拆分单子信息
	 * 
	 * @param list
	 * @return
	 */
	int saveSplitNewShipOrder(@Param("list") List<ShippingOrder> list);

	/**
	 * 建立份单子的关联表信息
	 * 
	 * @param list
	 * @return
	 */
	int saveSplitShipOrderMessage(@Param("list") List<JySplitShiping> list);

	/**
	 * 删除老表中的数据
	 * 
	 * @param oldShipId
	 * @return
	 */
	int deleteSplitShipOrder(String oldShipId);

	/**
	 * app获取协议
	 * 
	 * @param driverID
	 * @param rows
	 * @param page
	 * @return
	 */
	List<CreateAgreement> appGetCreateAgreementInfo(String driverID, int rows,
			int page);

	/**
	 * app获取协议下面的订单
	 * 
	 * @param agreementId
	 * @param rows
	 * @param page
	 * @return
	 */
	List<ShippingOrder> appGetAgreementShip(String agreementId, int rows,
			int page, String state);

	/**
	 * 查询已拆分订单信息
	 * 
	 * @param oldShipId
	 * @return
	 */
	int getSplitOldShipOrder(String oldShipId);

	/**
	 * 获取5公里以内的司机信息
	 */
	public List<Driver> getPushDriverId();

	/**
	 * 查询是否存在推送的协议信息如果存在则不在插入
	 * 
	 * @param driver_id
	 * @param agreementId
	 * @return
	 */
	public int getVehbidInfo(String driver_id, String agreementId);

	/**
	 * 将推送消息插入推送表
	 * 
	 * @param vp
	 * @return
	 */
	public int insertVehbidPush(@Param("list") List<VehiclevBidding> vp);

	/**
	 * 查询司机对应的设备号
	 * 
	 * @param drivers
	 * @return
	 */
	public String getDriverChannelId(@Param("list") List<Driver> drivers);

	/**
	 * app查看竞价消息
	 * 
	 * @param driverId
	 * @return
	 */
	List<CreateAgreement> appVehbidPushMessage(String driverId, int rows,
			int page, String is_vehbid);

	/**
	 * APP车辆竞价
	 * 
	 * @param driverId
	 * @param agreement_id
	 * @param vehiclebidding_message
	 * @param vehiclebidding_price
	 * @return
	 */
	int appVehbidAgreementDriver(String driverId, String agreement_id,
			String vehiclebidding_message, String vehiclebidding_price,
			String vehiclebidding_id, String is_receipt_free);

	/**
	 * 客户查询订单进行评价
	 * 
	 * @param customer_id
	 * @param phone
	 * @param state
	 * @return
	 */
	List<CreateAgreement> appGetEvaluateInfo(String customer_id, String phone,
			String state);

	/**
	 * 发货客户评价
	 * 
	 * @param ratingid
	 * @param shiping_order_id
	 * @param customer_grade
	 * @param customer_bouns
	 * @param customer_user
	 * @return
	 */
	int appCustomerEvaluateDriver(String ratingid, String shiping_order_id,
			String customer_grade, String customer_bouns, String customer_user);

	/**
	 * 收货客户评价
	 * 
	 * @param ratingid
	 * @param shiping_order_id
	 * @param receiving_grade
	 * @param receiving_bouns
	 * @param receiving_user
	 * @return
	 */
	int appReceivingEvaluateDriver(String ratingid, String shiping_order_id,
			String receiving_grade, String receiving_bouns,
			String receiving_user);

	/**
	 * 获取打印的承运协议信息
	 * 
	 * @param agreementId
	 * @return
	 */
	CreateAgreement getPrinterAgreement(String agreementId);

	/**
	 * 承运协议导出运单信息
	 * 
	 * @param orderIds
	 * @param caId
	 * @return
	 */
	List<ShippingOrder> getCreateAgreementOrder(@Param("array")String[] orderIds, String caId);

}
