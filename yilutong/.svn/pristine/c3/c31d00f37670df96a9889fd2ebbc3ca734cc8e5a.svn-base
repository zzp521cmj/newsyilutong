package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.RejectedRecord;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;

public interface UnqualifiedService {
	Unqualified getunqualified(String pid);// 添加一条订单

	int addunqualified(Unqualified unqualified);// 添加不合格信息

	List<Unqualified> selectunqualified(int page, int rows,String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num);// 查询数据

	int selectunqualifiedlist(String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num);// 长度
	int updateunqualified(String [] pid,String did,String notes);//提交单据
	int deletequalified(String[] del);//删除
	int getUpdateunqualifie(Unqualified unqualified);//编辑
	
	Unqualified getselectunqualified(String pid);//查询一条
	public List<Unqualified> outShi(String[] checkarray);//勾选导出
	//导出
	List<Unqualified> exportunqualified(String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num,String [] checkarray);// 

	
	//查询记录总条数
		int Record(String abnormalid);
		
		//查询驳回记录
		List<RejectedRecord> RecordList(String abnormalid);
		
		
		List<ShippingOrder> selectorder(int page, int rows,String orderid,String ordername);//查询所有
		int selectorderlist(String orderid,String ordername);//订单
}
