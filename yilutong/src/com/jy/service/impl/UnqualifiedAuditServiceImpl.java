package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jy.common.UUIDUtils;
import com.jy.dao.UnqualifiedAuditDao;
import com.jy.model.RejectedRecord;
import com.jy.model.Unqualified;
import com.jy.service.UnqualifiedAuditService;
@Service("UnqualifiedAuditService")
public class UnqualifiedAuditServiceImpl implements UnqualifiedAuditService{
	@Resource 
	  private UnqualifiedAuditDao ud;
	public int count(String shiping_order_num, String custom_name, String send_time,String send1_time,String audit_state,String report_date,String report1_date) {
		int count=ud.count(shiping_order_num, custom_name, send_time,send1_time, audit_state,report_date, report1_date);
		return count;
	}

	public List<Unqualified> inquire(int rows, int page,
			String shiping_order_num, String custom_name, String send_time,String send1_time,
			String audit_state,String report_date,String report1_date) {
		List <Unqualified> list=ud.inquire(rows, page, shiping_order_num, custom_name, send_time,send1_time, audit_state,report_date,report1_date);
		return list;
	}


	public Unqualified updateInfo(String id) {
		Unqualified unqualified=ud.updateInfo(id);
		return unqualified;
	}

	public int update(String reason,String [] abnormalid) {
		int flag=ud.update(reason, abnormalid);
		return flag;
	}

	public List<Unqualified> inquireName(String name) {
		List<Unqualified> list=ud.inquireName(name);
		return list;
	}

	public Unqualified bohuiInfo(String id) {
		Unqualified un=ud.bohuiInfo(id);
		return un;
	}

	public int bohui(String reason,String[] abnormalid) {
		int i=ud.bohui(reason,abnormalid);
		return i;
	}

	public List<Unqualified> recordInfo(String[] abnormalid) {
		List<Unqualified> list=ud.recordInfo(abnormalid);
		
		return list;
	}

	public int insertInfo(List<RejectedRecord> reject_id) {
		int count=ud.insertInfo(reject_id);
		return count;
	}

	

}
