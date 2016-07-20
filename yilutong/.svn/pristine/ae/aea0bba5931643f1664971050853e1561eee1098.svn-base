package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.Customer;
import com.jy.model.Settle_historyGF;
import com.jy.model.SettlGFSh;
import com.jy.model.ShippingOrder;
import com.jy.model.Agencyfund;

public interface SettlementTCService {
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
		 int saveSettlyfSh( List<SettlGFSh> list);
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
				List<CreateAgreement>getCustomerSetYf(int rows, int page,
						String agreement_number, String agreement_type,String agreementstartdate,String agreementenddate,String sort,String order);
				int 	getCustomerSetYfs(String agreement_number, String agreement_type,String agreementstartdate,String agreementenddate,String sort,String order);
				//导出
				List<CreateAgreement>getCustomerSetYfout(String agreement_number,
						String agreement_type,String agreementstartdate,String agreementenddate,String sort,String order, String[] idss);
				//结算记录查询		
				 List<Settle_historyGF>  getSettleRc(int rows,int page,String order_id,
							String settl_order);
				int  getSettleRcs(String order_id,
							String settl_order);
				//结算修改保存实收和差额
				int saveSettl_fu(List<ShippingOrder>llst);
	
}
