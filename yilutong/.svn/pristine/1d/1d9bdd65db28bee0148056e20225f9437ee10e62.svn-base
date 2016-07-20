package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.jy.dao.UnqualifiedDao;
import com.jy.model.RejectedRecord;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;
import com.jy.service.UnqualifiedService;

@Component
public class UnqualifiedServiceImpl implements UnqualifiedService{
	@Resource
	private UnqualifiedDao uqd;
	
	public Unqualified getunqualified(String pid) {
		// TODO Auto-generated method stub
		Unqualified unqualified=uqd.getunqualified(pid);
		System.out.println(unqualified);
		return unqualified;
	}

	public int addunqualified(Unqualified unqualified) {
		// TODO Auto-generated method stub
		int a =uqd.addunqualified(unqualified);
		System.out.println("是否添加成功"+a);
		return a;
	}

	public List<Unqualified> selectunqualified(int page, int rows,String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num) {
		// TODO Auto-generated method stub
		List<Unqualified> list=uqd.selectunqualified(page,rows,reportedfrontdate, reportedqueendate, submitfrontdate, submintdqueendate, auditsign, documents_state, shiping_order_num);
		System.out.println("list ======"+list);
		return list;
	}

	public int selectunqualifiedlist(String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num) {
		// TODO Auto-generated method stub
		int a=uqd.selectunqualifiedlist(reportedfrontdate, reportedqueendate, submitfrontdate, submintdqueendate, auditsign, documents_state, shiping_order_num);
		System.out.println("========================"+a);
		
		return a;
	}
	public int updateunqualified(String [] pid,String did,String notes) {
		// TODO Auto-generated method stub
		int a=uqd.updateunqualified(pid,did,notes);
		System.out.println("====="+a);
		return a;
	}

	public int deletequalified(String[] del) {
		// TODO Auto-generated method stub
		int a=uqd.deletequalified(del);
		return a;
	}

	public int getUpdateunqualifie(Unqualified unqualified) {
		// TODO Auto-generated method stub
		int a=uqd.getUpdateunqualifie(unqualified);
		return a;
	}

	public Unqualified getselectunqualified(String pid) {
		// TODO Auto-generated method stub
		Unqualified unqualified=uqd.getselectunqualified(pid);
		return unqualified;
	}

	public List<Unqualified> exportunqualified(String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num,String [] checkarray) {
		// TODO Auto-generated method stub
		List<Unqualified> list=uqd.exportunqualified(reportedfrontdate, reportedqueendate, submitfrontdate, submintdqueendate, auditsign, documents_state, shiping_order_num,checkarray);
		return list;
	}



	public int Record(String abnormalid) {
		int count=uqd.Record(abnormalid);
		return count;
	}

	public List<RejectedRecord> RecordList(String abnormalid) {
		List<RejectedRecord> list=uqd.RecordList(abnormalid);
		System.out.println(list.size());
		System.out.println(abnormalid+"111");
		return list;
	}

	public List<Unqualified> outShi(String[] checkarray) {
		// TODO Auto-generated method stub
		return uqd.outShi(checkarray);
	}

	public List<ShippingOrder> selectorder(int page, int rows,String orderid,String ordername) {
		// TODO Auto-generated method stub
		return uqd.selectorder(page,rows,orderid,ordername);
	}


	public int selectorderlist(String orderid,String ordername) {
		// TODO Auto-generated method stub
		return uqd.selectorderlist(orderid,ordername);
	}
	
	
	
	
	
}
