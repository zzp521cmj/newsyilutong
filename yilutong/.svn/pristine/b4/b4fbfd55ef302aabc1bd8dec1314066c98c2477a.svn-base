package com.jy.service;
/*
 * 理赔查询
 */
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Claim_settlement;
import com.jy.model.Claim_settlementmap;
import com.jy.model.Customer;
import com.jy.model.Settlement_Record;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;

public interface ClaimsExaminerService {
	/*
	 *  不合格申请总条数
	 */
	int count(String numbersid,
			String claims_state, String claims_time,String claims_endtime, String custom_name,
			String receipt,List<String> deptlist);

	/*
	 *  理赔审核查询
	 */
	List<Claim_settlementmap> checkQuery(int rows, int page, String numbersid,
			String claims_state, String claims_time,String claims_endtime, String custom_name,
			String receipt,List<String> deptlist);
	
	/*
	 * /查询发货的方法
	 */
	List<Customer> inquireName(String custom_name);

	/*
	 * /查询收货的方法
	 */
	List<Unqualified> inquireName1(String receipt);

	/*
	 * 查询审核对应的id
	 */
	Claim_settlement selectID(String id);

	/*
	 *  审核
	 */
	int review(String audit_opinion, 
			@Param("array") String[] claimsid);

	/*
	 *  查询驳回对应的id
	 */
	Claim_settlement bohuiId(String id);

	/*
	 *  驳回
	 */
	int bohuiInfo(String audit_opinion, @Param("array") String[] claimsid);
	

	/*
	 *  获取驳回记录对应的id
	 */
	List<Claim_settlement> recordInfo(@Param("array") String[] claimsid);

	/*
	 *  添加到驳回记录的方法
	 */
	int insertInfo(List<Settlement_Record> reject_id);
	
	/*
	 * 获取审核对应的id
	 */
	List<Claim_settlement> recordInf(@Param("array") String[] claimsid);
	
	/*
	 * 添加理赔金额的方法
	 */
	int addGold(List<ShippingOrder> shiping_order_id);
}
