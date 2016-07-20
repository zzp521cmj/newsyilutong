package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.Delivery_Audit;
import com.jy.model.Delivery_Clearing;
import com.jy.model.Delivery_history;
import com.jy.model.Settle_history;
import com.jy.model.ShippingOrder;

//配送费结算
public interface DistributionDao {
	// 协议查询 、、start_date2 end_date2
	List<CreateAgreement> getCustomerSetYf(int rows, int page,
			String ddId,
			String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2,String sort,String order,String carname);

	int getCustomerSetYfs(String ddId,
			String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2,String sort,String order,String carname);

	// 协议导出
	List<CreateAgreement> getCustomerSetYfout(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2,String carname, @Param("array") String[] idss);

	// 运单查询
	List<ShippingOrder> getSettlementYfInfo(int rows, int page,
			String agreement_number, String agreement_type,String id); // 查询

	int getSettlementYf(String agreement_number, String agreement_type,String id);// 查询总数
	// 编辑 结算运费修改

	int updateSettlementYf(String id, String transpfrees,String payment_bz);

	// 结算订单修改
	int addSettlementYf(@Param("array") String[] id, String transpfrees,
			String transpfree_user, String transpfree_remaks, String khbank,
			String usernames, String kahao, String zpnum);

	// 结算记录保存
	int saveSettlchecks(List<Delivery_Clearing> list);

	// 结算修改保存实收和差额
	int saveSettl_fu(@Param("list")List<CreateAgreement> list);

	// 运费结算记录保存
	int saveSettlementYf(Delivery_history list);

	// 运单导出
	List<ShippingOrder> getSettlementYfout(String agreement_number, String agreement_type, @Param("array") String[] ids);// 查询总数

	// 运费结算提审
	int delSettlementYf(@Param("array") String[] ids,
			String transpfree_sh_dids, String transpfree_th_users,
			String transpfree_th_notes);

	// 审核记录保存
	int saveSettlyfSh(@Param("list") List<Delivery_Audit> list);

	// 结算记录查询
	List<Delivery_Clearing> getSettleRc(int rows, int page, String order_id,
			String settl_order);

	int getSettleRcs(String order_id, String settl_order);

	// 结算审核查询
	List<CreateAgreement> getSettlementYfSHInfo(int rows, int page, String agreement_number,
			String payment_sh, String payment_th_did, String create_time,
			String create1_time, String settl_times, String settl1_times,
			String custom_name); // 查询

	int getSettlementYfSH( String agreement_number,
			String payment_sh, String payment_th_did, String create_time,
			String create1_time, String settl_times, String settl1_times,
			String custom_name);// 查询总数
	// 运费审核

	int shSettlementYf(@Param("array") String[] ids, String state,
			String users, String notes);

	// 结算运费审核历史记录查询
	List<Delivery_Audit> getSettleShRc(int rows, int page, String start_date,
			String end_date, String ddids);

	int getSettleShRcs(String start_date, String end_date, String ddids);

	// 审核导出
	List<CreateAgreement> getSettlementYfSHout(String ddId, String types,
			String isdelivery, String start_date, String end_date,
			String start_date1, String end_date1, String start_date2,
			String end_date2, String kname, @Param("array") String[] ids);// 查询总数
	
	//结算历史表修改查询
	List<Delivery_Clearing> getupdateSettle(String table_name,Integer  settl_order,@Param("array")String[] idss);
	//结算历史表审核状态修改
			int 	updateSettle(@Param("list")List<Delivery_Clearing> list,String table_name,String settl_state);
}
