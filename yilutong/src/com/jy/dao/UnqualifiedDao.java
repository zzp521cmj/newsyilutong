package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.RejectedRecord;
import com.jy.model.ShippingOrder;
import com.jy.model.Unqualified;

/**
 * @author lxk 不合格商品上报
 * 
 * */
public interface UnqualifiedDao {
	Unqualified getunqualified(String pid);// 添加一个订单

	int addunqualified(Unqualified unqualified);// 添加不合格信息

	List<Unqualified> selectunqualified(int page, int rows,String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num);// 查询数据

	int selectunqualifiedlist(String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num);// 长度
	int updateunqualified(@Param("array")String [] pid,String did,String notes);//提交单据
	int deletequalified(@Param("array") String[] del);//删除
	int getUpdateunqualifie(Unqualified unqualified);//编辑nengbuenng huoqu zhe 个累的id
	
	Unqualified getselectunqualified(String pid);//查询一条

	//查询记录总条数
	int Record(String abnormalid);
	
	//查询驳回记录
	List<RejectedRecord> RecordList(String abnormalid);
	//导出
	List<Unqualified> exportunqualified(String reportedfrontdate,
			String reportedqueendate, String submitfrontdate,
			String submintdqueendate, String auditsign, String documents_state,
			String shiping_order_num,@Param("array") String [] checkarray);// 
	public List<Unqualified> outShi(String[] checkarray);//勾选导出
	

	List<ShippingOrder> selectorder(int page, int rows,String orderid,String ordername);//查询所有订单
	int selectorderlist(String orderid,String ordername);//订单
	
}
