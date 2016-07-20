package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.ShippingOrder;
import com.jy.model.TranspfreeCheckeds;
import com.jy.model.Transportfree;

public interface TransportfreeDao {
	//调整运费修改
	int addTransportfree(String id,String transpfrees,String transpfree_user,String transpfree_remaks,String transport_pay);
	//运费调整提审
	int delTransportfree(@Param("array")String []ids,String transpfree_sh_dids,String transpfree_th_users,String transpfree_th_notes);
	//运费审核
	int shTransportfree(@Param("array")String []ids,String state,String users,String notes);
	//查询
	 List<ShippingOrder>getTransportfreeInfo(int rows,int page,String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);	//查询
	 int getTransportfree(String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);//查询总数
	//审核记录保存
	 int saveTranspchecks( List<TranspfreeCheckeds> list);
	 //运费调整记录保存
	 int saveTransportFree( Transportfree  list);
	 //调整审核查询
	 List<ShippingOrder>getTransportfreeSHInfo(int rows,int page,String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);	//查询
	 int getTransportfreeSH(String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);//查询总数
	//调整运费历史记录查询
	 List<Transportfree>  getTransportfreeRc(int rows,int page,String start_date,
				String end_date, String ddids);
	int  getTransportfreeRcs(String start_date,
				String end_date, String ddids);
	//调整运费审核历史记录查询
		 List<TranspfreeCheckeds>  getTranfreeShRc(int rows,int page,String start_date,
					String end_date, String ddids);
		int  getTranfreeShRcs(String start_date,
					String end_date, String ddids);
		//运费调整导出
		 List<ShippingOrder>  getTransportfreeOut(String ddId, String types, String isdelivery, String start_date,
		String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname,@Param("array")String []checkarray);
		 //运费调整审核导出
		 List<ShippingOrder>  getTransportfreeShOut(String ddId, String types, String isdelivery, String start_date,
					String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname,@Param("array")String []checkarray);
		 
}
