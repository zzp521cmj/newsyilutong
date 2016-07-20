package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Customer;
import com.jy.model.SettlGFSh;
import com.jy.model.Settle_historyGF;
import com.jy.model.ShippingOrder;
import com.jy.model.Agencyfund;

public interface SettleDaiskgfService {
		//结算运费修改
		int updateSettlementYf(String id,String transpfrees);
		//结算订单修改
		int addSettlementYf(String[] id,String transpfrees,String transpfree_user,String transpfree_remaks ,String khbank,String usernames,String kahao,String zpnum);
		//运费调整提审
		int delSettlementYf(String []ids,String transpfree_sh_dids,String transpfree_th_users,String transpfree_th_notes );	
		//运费审核
		int shSettlementYf(@Param("array")String []ids,String state,String users,String notes);

	//查询
	 List<ShippingOrder>getSettlementYfInfo(int rows,int page,String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);	//查询
	 int getSettlementYf(String ddId,
				String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);//查询总数
	
	//审核记录保存
		 int saveSettlGFSh( List<SettlGFSh> list);
		 //运费调整记录保存
		 int saveSettlementYf(Agencyfund list);
		 
		 //调整审核查询
		 List<ShippingOrder>getSettlementYfSHInfo(int rows,int page,String ddId,
					String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);	//查询
		 int getSettlementYfSH(String ddId,
					String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname);//查询总数
		//审核导出
		 List<ShippingOrder> getSettlementYfSHout(String ddId,
					String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,@Param("array")String[]ids);//查询总数

		 //导出
		 List<ShippingOrder> getSettlementYfout(String ddId,
					String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,@Param("array")String [] ids);//查询总数
		
		 //调整运费历史记录查询
		 List<Agencyfund>  getSettlementYfRc(int rows,int page,String start_date,
					String end_date, String ddids);
		int  getSettlementYfRcs(String start_date,
					String end_date, String ddids);
		//调整运费审核历史记录查询
		 List<SettlGFSh>  getSettleShRc(int rows,int page,String start_date,
					String end_date, String ddids);
		int  getSettleShRcs(String start_date,
					String end_date, String ddids);
		//结算记录保存
				int	saveSettlchecks(List <Settle_historyGF> list);
				//客户查询
				List<Customer>getCustomerSetYf(int rows,int page,String customer_name,
						String customer_num,String js_time,String js_times,String chayi,String order);
				int 	getCustomerSetYfs(String customer_name,
						String customer_num,String js_time,String js_times,String chayi,String order);
				//导出
				List<Customer>getCustomerSetYfout(String customer_name,
						String customer_num,String js_time,String js_times,String chayi,String order,@Param("array")String[] idss);
				//结算记录查询		
				 List<Settle_historyGF>  getSettleRc(int rows,int page,String order_id,
							String settl_order);
				int  getSettleRcs(String order_id,
							String settl_order);
				//结算修改保存实收和差额
				int saveSettl_fu(List<ShippingOrder>llst);			
				//结算历史表修改查询
				List<Settle_historyGF>	getupdateSettle(String table_name,Integer settl_order,String[] idss);
				//结算历史表审核状态修改
				int 	updateSettle(List<Settle_historyGF> list,String table_name,String settl_state);
}
