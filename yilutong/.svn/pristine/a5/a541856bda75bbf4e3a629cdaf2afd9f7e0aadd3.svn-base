package com.jy.service.impl;
/*
 * 理赔结算
 */
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.jy.dao.ClaimsExaminerDao;
import com.jy.model.Claim_settlement;
import com.jy.model.Claim_settlementmap;
import com.jy.model.Customer;
import com.jy.model.Settlement_Record;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.service.ClaimSettlementService;
import com.jy.service.ClaimsExaminerService;
@Component
public class ClaimsExaminerServiceImpl implements ClaimsExaminerService{
    @Resource
    private ClaimsExaminerDao cd;
	public int count(String numbersid, String claims_state, String claims_time,String claims_endtime,
			String custom_name, String receipt,List<String> deptlist) {
		int count = cd.count(numbersid, claims_state, claims_time, claims_endtime,custom_name, receipt,deptlist);
		return count;
	}

	public List<Claim_settlementmap> checkQuery(int rows, int page,
			String numbersid, String claims_state, String claims_time,String claims_endtime,
			String custom_name, String receipt,List<String> deptlist) {
		List<Claim_settlementmap> list=cd.checkQuery(rows, page, numbersid, claims_state, claims_time,claims_endtime, custom_name, receipt,deptlist);
		return list;
	}

	public List<Customer> inquireName(String custom_name) {
		List<Customer> list=cd.inquireName(custom_name);
		return list;
	}

	public List<Unqualified> inquireName1(String receipt) {
		 List<Unqualified>  list=cd.inquireName1(receipt);
		return list;
	}

	public Claim_settlement selectID(String id) {
		Claim_settlement cm=cd.selectID(id);
		return cm;
	}

	public int review(String audit_opinion, String[] claimsid) {
		int count=cd.review(audit_opinion,  claimsid);
		return count;
	}

	public Claim_settlement bohuiId(String id) {
		Claim_settlement ct=cd.bohuiId(id);
		return ct;
	}

	public int bohuiInfo(String audit_opinion, String[] claimsid) {
		int count=cd.bohuiInfo(audit_opinion, claimsid);
		return count;
	}

	public List<Claim_settlement> recordInfo(String[] claimsid) {
		List<Claim_settlement> list=cd.recordInfo(claimsid);
		return list;
	}

	public int insertInfo(List<Settlement_Record> reject_id) {
		int i=cd.insertInfo(reject_id);
		return i;
	}

	public int addGold(List<ShippingOrder> shiping_order_id) {
		int i=cd.addGold(shiping_order_id);
		return i;
	}

	public List<Claim_settlement> recordInf(String[] claimsid) {
		List<Claim_settlement> list=cd.recordInf(claimsid);
		return list;
	}


}
