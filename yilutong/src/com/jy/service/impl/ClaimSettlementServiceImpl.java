package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.ClaimSettlementDao;
import com.jy.model.Between;
import com.jy.model.Claim_settlement;
import com.jy.model.Claim_settlementmap;
import com.jy.model.Customer;
import com.jy.model.Settlement_Record;
import com.jy.model.Unqualified;
import com.jy.service.ClaimSettlementService;

@Service("ClaimSettlementService")
public class ClaimSettlementServiceImpl implements ClaimSettlementService {
	@Resource
	private ClaimSettlementDao cd;

	public int count(String numbersid, String claims_state, String claims_time,String claims_endtime,
			String custom_name, String receipt,String ddid) {
		int i = cd.count(numbersid, claims_state, claims_time,claims_endtime, custom_name,
				receipt,ddid);
		return i;
	}

	public List<Claim_settlementmap> inquire(int rows, int page, String numbersid,
			String claims_state, String claims_time, String custom_name,
			String receipt,String claims_endtime,String ddid) {
		List<Claim_settlementmap> list = cd.inquire(rows, page, numbersid,
				claims_state, claims_time, custom_name, receipt,claims_endtime,ddid);
		return list;
	}

	public int deleteTravel(String[] del) {
		int count = cd.deleteTravel(del);
		return count;
	}

	public Claim_settlement updateId(String id) {
		Claim_settlement ct = cd.updateId(id);
		return ct;
	}

	public int getupdate(Claim_settlement claimsid) {
		int i = cd.getupdate(claimsid);
		return i;
	}

	public int updateunqualified(String[] claimsid,String did,String arraign_remarks) {
		int count = cd.updateunqualified(claimsid,did,arraign_remarks);
		return count;
	}

	public List<Claim_settlementmap> exportunqualified(String numbersid,
			String claims_state, String claims_time,String claims_endtime, String custom_name,
			String receipt) {
		List<Claim_settlementmap> list = cd.exportunqualified(numbersid, claims_state, claims_time, claims_endtime, custom_name, receipt);
		return list;
	}

	public List<Customer> inquireName(String custom_name) {
		List<Customer> list=cd.inquireName(custom_name);
		return list;
	}

	public List<Unqualified> inquireName1(String receipt) {
		 List<Unqualified> list=cd.inquireName1(receipt);
		return list;
	}

	public List<Unqualified> abnormal(int row,int page,String submitfrontdate,
			String submintdqueendate,String custom_name,String shiping_order_num,String responsible_people,String types_id,String []ids,String ides) {
		List<Unqualified> list=cd.abnormal(row, page, submitfrontdate, submintdqueendate, custom_name, shiping_order_num, responsible_people, types_id,ides);
		if(ids!=null&&ids.length>0){
			List<Unqualified> list1=cd.getjUnqualified(ids);
			for(int i=0;i<ids.length;i++){
				list.add(list1.get(i));
			}
		}
		return list;
	}

	public int abnormalcount(String submitfrontdate,
			String submintdqueendate,String custom_name,String shiping_order_num,String responsible_people,String types_id,String []ids,String ides) {
		int count=cd.abnormalcount(submitfrontdate, submintdqueendate, custom_name, shiping_order_num, responsible_people, types_id,ides);
		if(ids!=null&&ids.length>0){
			count=ids.length+count;
		}
		return count;
	}

	public List<Unqualified> nquiryDisplay(String types_id) {
		List<Unqualified> list=cd.nquiryDisplay(types_id);
		return list;
	}

	 /*
	  * 添加的方法
	  */
	public int insertInfo(Claim_settlement claim_settlement){
		int count=cd.insertInfo(claim_settlement);
		return count;
		 
	 }

	public  List<Unqualified> getjUnqualified(String[] id) {
		return cd.getjUnqualified(id);
	}

	public List<Claim_settlementmap> outShi(String[] checkarray) {
		 List<Claim_settlementmap> list=cd.outShi(checkarray);
		return list;
	}

	public int Record(String claimsid) {
		int count=cd.Record(claimsid);
		return count;
	}

	public List<Settlement_Record> RecordList(String claimsid) {
		List<Settlement_Record> list=cd.RecordList(claimsid);
		return list;
	}

	public int insetinf(List<Between> between) {
		int b=cd.insetinf(between);
		return b;
	}
    //根据理赔id  查询中间表数据
	public List<Between> updateween(String id) {
		List<Between> b=cd.updateween(id);
		return b;
	}

	public int updatestate(String[] id, String ides) {
		 int i=cd.updatestate(id, ides);
		return i;
	}

	public int deleteween(String[] id) {
	    int i=cd.deleteween(id);
		return i;
	}



	

}
