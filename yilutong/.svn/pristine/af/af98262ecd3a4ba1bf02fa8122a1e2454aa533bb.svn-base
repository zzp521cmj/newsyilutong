package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Customer;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;
import com.jy.model.ShippingOrder;
import com.jy.model.Transportfree;

public interface SettlementYfService {
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
		 int saveSettlyfSh( List<SettlyfSh> list);
		 //运费调整记录保存
		 int saveSettlementYf(Transportfree list);
		 
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
		 List<Transportfree>  getSettlementYfRc(int rows,int page,String start_date,
					String end_date, String ddids);
		int  getSettlementYfRcs(String start_date,
					String end_date, String ddids);
		//调整运费审核历史记录查询
		 List<SettlyfSh>  getSettleShRc(int rows,int page,String start_date,
					String end_date, String ddids);
		int  getSettleShRcs(String start_date,
					String end_date, String ddids);
		//结算记录保存
				int	saveSettlchecks(List <Settle_history> list);
				//客户查询
				List<Customer>getCustomerSetYf(int rows,int page,String customer_name,
						String customer_num,String starts, String ends,String sort,String order);
				int 	getCustomerSetYfs(String customer_name,
						String customer_num,String starts, String ends);
				//导出
				List<Customer>getCustomerSetYfout(String customer_name,
						String customer_num,@Param("array")String[] idss,String starts, String ends);
				//结算记录查询		
				 List<Settle_history>  getSettleRc(int rows,int page,String order_id,
							String settl_order);
				int  getSettleRcs(String order_id,
							String settl_order);
				//结算修改保存实收和差额
				int saveSettl_fu(List<ShippingOrder>llst);
	
}
