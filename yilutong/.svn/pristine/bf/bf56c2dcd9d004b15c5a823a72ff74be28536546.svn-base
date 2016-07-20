package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;

import com.jy.dao.CreatAgreementDao;
import com.jy.model.AgreementCarMessage;
import com.jy.model.Company;
import com.jy.model.CreateAgreement;
import com.jy.model.Driver;
import com.jy.model.GuanlianCA;
import com.jy.model.JySplitShiping;
import com.jy.model.ShippingOrder;
import com.jy.model.VehiclevBidding;
import com.jy.service.CreateAgreementInfoService;

@Controller
public class CreateAgreementInfoServiceImpl implements
		CreateAgreementInfoService {
	@Resource
	private CreatAgreementDao ca;

	// 查询分页

	public List<CreateAgreement> getCreateAgreementInfo(int rows, int page,
			String id, String start_date, String end_date, String car_name,
			String car_number1, String agreement_type, String end_address,
			String company_id, String phone_number, String order_state,
			String departid,String start_address) {
		List<CreateAgreement> list = ca.getCreateAgreementInfo(rows, page, id,
				start_date, end_date, car_name, car_number1, agreement_type,
				end_address, company_id, phone_number, order_state, departid,start_address);
		return list;
	}

	public int getCreateAgreement(String id, String start_date,
			String end_date, String car_name, String car_number1,
			String agreement_type, String end_address, String company_id,
			String phone_number, String order_state, String departid,String start_address) {
		int i = ca.getCreateAgreement(id, start_date, end_date, car_name,
				car_number1, agreement_type, end_address, company_id,
				phone_number, order_state, departid,start_address);
		return i;
	}

	public int saveCreateAgreement(CreateAgreement d) {
		int i = ca.saveCreateAgreement(d);
		return i;
	}

	public CreateAgreement getUpdateCreateAgreement(String id) {
		CreateAgreement c = ca.getUpdateCreateAgreement(id);
		return c;
	}

	public int updateCreateAgreement(CreateAgreement d) {
		int i = ca.updateCreateAgreement(d);
		return i;
	}

	public List<CreateAgreement> getPlateNumberLength(String number) {
		List<CreateAgreement> list = ca.getPlateNumberLength(number);
		return list;
	}

	public CreateAgreement getNumber(String number) {
		CreateAgreement c = ca.getNumber(number);
		return c;
	}

	public List<CreateAgreement> getCreateAgreementAll(
			String[] getCreateAgreementAll, String start_date, String end_date,
			String car_name, String car_number1, String agreement_type,
			String end_address, String company_id, String phone_number,
			String order_state, String departid) {
		List<CreateAgreement> list = ca.getCreateAgreementAll(
				getCreateAgreementAll, start_date, end_date, car_name,
				car_number1, agreement_type, end_address, company_id,
				phone_number, order_state, departid);
		return list;
	}

	public int saveAgreementToorder(List<GuanlianCA> list) {
		int i = ca.saveAgreementToorder(list);
		return i;
	}

	/**
	 * 制作协议修改订单好
	 */
	public int updateState(String[] pid, Integer state) {
		int i = ca.updateState(state, pid);
		return i;
	}

	/**
	 * 详情信息订单号查询
	 * 
	 * @param id
	 * @return
	 */
	public List<GuanlianCA> getXXCreateAgreement(String id) {
		List<GuanlianCA> list = ca.getXXCreateAgreement(id);
		return list;
	}

	/**
	 * 获取订单id
	 */
	public List<GuanlianCA> orderNumber(String[] del) {
		List<GuanlianCA> list = ca.orderNumber(del);
		return list;
	}

	/**
	 * 删除关联表表
	 */
	public int deleToOder(String[] del) {
		int i = ca.deleToOder(del);
		return i;
	}

	/**
	 * 协议删除时候，修改订单状态
	 */
	public int deleState(List<GuanlianCA> list) {
		int i = ca.deleState(list);
		return i;
	}

	/**
	 * 删除协议表
	 */
	public int deleteCreateAgreement(String[] del) {
		int i = ca.deleteCreateAgreement(del);
		return i;
	}

	/**
	 * 中转公司查询
	 */
	public List<Company> getCompany(String name) {
		List<Company> list = ca.getCompany(name);
		return list;
	}

	public int searchOrder(String ids) {
		int i = ca.searchOrder(ids);
		return i;
	}

	/**
	 * 修改金额
	 * */
	public int updataMoney(String id, String practiacl_num, String send_fee,
			String send_remarks, String change_pay, String change_remarks,
			String chanage_pay_type, String change_other, String upstairs_fee,
			String change_back_fee, String change_back_type,
			String change_handling, String paidtc_fu, String change_feilv) {

		return ca.updataMoney(id, practiacl_num, send_fee, send_remarks,
				change_pay, change_remarks, chanage_pay_type, change_other,
				upstairs_fee, change_back_fee, change_back_type,
				change_handling, paidtc_fu, change_feilv);
	}

	/**
	 * 修改总金额
	 * 
	 * @param name
	 * @return
	 */
	public int updataZong(String id, String money, Integer count) {
		return ca.updataZong(id, money, count);
	}

	/**
	 * 修改总金额
	 * 
	 * @param name
	 * @return
	 */
	public int removeShip(String cid, String[] pid) {
		return ca.removeShip(cid, pid);
	}

	public int getShipOrderCA(String id, String startDate, String end_date,
			String ddId, String order_state, String pay_type, String perpole,
			String end_address, String send_address, String phone_number,String send_type) {

		return ca.getShipOrderCA(id, startDate, end_date, ddId, order_state,
				pay_type, perpole, end_address, send_address, phone_number,send_type);
	}

	public List<ShippingOrder> getShipOrderInfoCA(int rows, int page,
			String id, String startDate, String end_date, String ddId,
			String order_state, String pay_type, String perpole,
			String end_address, String send_address, String phone_number,String send_type) {

		return ca.getShipOrderInfoCA(rows, page, id, startDate, end_date, ddId,
				order_state, pay_type, perpole, end_address, send_address,
				phone_number,send_type);
	}

	public List<AgreementCarMessage> getTravel(Integer page, Integer rows,
			String plateNumber, String did, String carLength, String length_name) {

		return ca.getTravel(page, rows, plateNumber, did, carLength,
				length_name);
	}

	public int getCount(String plateNumber, String did, String carLength,
			String length_name) {

		return ca.getCount(plateNumber, did, carLength, length_name);
	}

	public List<ShippingOrder> getSplitShipOrderMessage(String[] pid) {

		return ca.getSplitShipOrderMessage(pid);
	}

	public int saveSplitOldShipOrder(String oldShipId) {

		return ca.saveSplitOldShipOrder(oldShipId);
	}

	public int saveSplitNewShipOrder(List<ShippingOrder> list) {

		return ca.saveSplitNewShipOrder(list);
	}

	public int saveSplitShipOrderMessage(List<JySplitShiping> list) {

		return ca.saveSplitShipOrderMessage(list);
	}

	public int deleteSplitShipOrder(String oldShipId) {

		return ca.deleteSplitShipOrder(oldShipId);
	}

	public List<CreateAgreement> appGetCreateAgreementInfo(String driverID,
			int rows, int page) {

		return ca.appGetCreateAgreementInfo(driverID, rows, page);
	}

	public List<ShippingOrder> appGetAgreementShip(String agreementId,
			int rows, int page, String state) {

		return ca.appGetAgreementShip(agreementId, rows, page, state);
	}

	public int getSplitOldShipOrder(String oldShipId) {
		return ca.getSplitOldShipOrder(oldShipId);
	}

	public List<Driver> getPushDriverId() {

		return ca.getPushDriverId();
	}

	public int insertVehbidPush(List<VehiclevBidding> vp) {

		return ca.insertVehbidPush(vp);
	}

	public String getDriverChannelId(List<Driver> drivers) {

		return ca.getDriverChannelId(drivers);
	}

	public List<CreateAgreement> appVehbidPushMessage(String driverId,
			int rows, int page, String is_vehbid) {

		return ca.appVehbidPushMessage(driverId, rows, page, is_vehbid);
	}

	public int appVehbidAgreementDriver(String driverId, String agreement_id,
			String vehiclebidding_message, String vehiclebidding_price,
			String vehiclebidding_id, String is_receipt_free) {

		return ca.appVehbidAgreementDriver(driverId, agreement_id,
				vehiclebidding_message, vehiclebidding_price,
				vehiclebidding_id, is_receipt_free);
	}

	public int getVehbidInfo(String driver_id, String agreementId) {

		return ca.getVehbidInfo(driver_id, agreementId);
	}

	public List<CreateAgreement> appGetEvaluateInfo(String customer_id,
			String phone, String state) {
		return ca.appGetEvaluateInfo(customer_id, phone, state);
	}

	public int appCustomerEvaluateDriver(String ratingid,
			String shiping_order_id, String customer_grade,
			String customer_bouns, String customer_user) {

		return ca.appCustomerEvaluateDriver(ratingid, shiping_order_id,
				customer_grade, customer_bouns, customer_user);
	}

	public int appReceivingEvaluateDriver(String ratingid,
			String shiping_order_id, String receiving_grade,
			String receiving_bouns, String receiving_user) {
		return ca.appReceivingEvaluateDriver(ratingid, shiping_order_id,
				receiving_grade, receiving_bouns, receiving_user);
	}

	public ShippingOrder getUpdateShipping(String id) {

		return ca.getUpdateShipping(id);
	}

	public CreateAgreement getPrinterAgreement(String agreementId) {
	
		return ca.getPrinterAgreement(agreementId);
	}

	public List<ShippingOrder> getCreateAgreementOrder(String[] orderIds,
			String caId) {
		
		return ca.getCreateAgreementOrder(orderIds, caId);
	}
	
	
	

}
