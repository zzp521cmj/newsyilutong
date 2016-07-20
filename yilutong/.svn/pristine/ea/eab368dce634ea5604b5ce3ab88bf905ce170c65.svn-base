package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DistributionDao;
import com.jy.model.CreateAgreement;
import com.jy.model.Delivery_Audit;
import com.jy.model.Delivery_Clearing;
import com.jy.model.Delivery_history;
import com.jy.model.ShippingOrder;
import com.jy.service.DistributionService;

@Component
public class DistributionServiceImpl implements DistributionService {

	@Resource
	private DistributionDao dad;

	public List<CreateAgreement> getCustomerSetYfout(String ddId, String types,
			String isdelivery, String start_date, String end_date,
			String start_date1, String end_date1, String start_date2,
			String end_date2,String carname, String[] idss) {
		List<CreateAgreement> list = dad.getCustomerSetYfout(ddId, types,
				isdelivery, start_date, end_date, start_date1, end_date1,
				start_date2, end_date2,carname, idss);
		return list;
	}

	public int updateSettlementYf(String id, String transpfrees,String payment_bz) {
		int count = dad.updateSettlementYf(id, transpfrees,payment_bz);
		return count;
	}

	public int addSettlementYf(String[] id, String transpfrees,
			String transpfree_user, String transpfree_remaks, String khbank,
			String usernames, String kahao, String zpnum) {
		int count = dad.addSettlementYf(id, transpfrees, transpfree_user,
				transpfree_remaks, khbank, usernames, kahao, zpnum);
		return count;
	}

	public int saveSettlchecks(List<Delivery_Clearing> list) {
		int count = dad.saveSettlchecks(list);
		return count;
	}

	public int saveSettl_fu(List<CreateAgreement> llst) {
		int count = dad.saveSettl_fu(llst);
		return count;
	}

	public int saveSettlementYf(Delivery_history list) {
		int count = dad.saveSettlementYf(list);
		return count;
	}

	public List<ShippingOrder> getSettlementYfout(String agreement_number,
			String agreement_type, String[] ids) {
		List<ShippingOrder> list = dad.getSettlementYfout(agreement_number,
				agreement_type, ids);
		return list;
	}

	public int delSettlementYf(String[] ids, String transpfree_sh_dids,
			String transpfree_th_users, String transpfree_th_notes) {
		int count = dad.delSettlementYf(ids, transpfree_sh_dids,
				transpfree_th_users, transpfree_th_notes);
		return count;
	}

	public int saveSettlyfSh(List<Delivery_Audit> list) {
		int count = dad.saveSettlyfSh(list);
		return count;
	}

	public List<Delivery_Clearing> getSettleRc(int rows, int page,
			String order_id, String settl_order) {
		List<Delivery_Clearing> list = dad.getSettleRc(rows, page, order_id,
				settl_order);
		return list;
	}

	public int getSettleRcs(String order_id, String settl_order) {
		int count = dad.getSettleRcs(order_id, settl_order);
		return count;
	}

	public List<CreateAgreement> getSettlementYfSHInfo(int rows, int page,
			String agreement_number, String payment_sh, String payment_th_did,
			String create_time, String create1_time, String settl_times,
			String settl1_times, String custom_name) {
		List<CreateAgreement> list = dad.getSettlementYfSHInfo(rows, page,
				agreement_number, payment_sh, payment_th_did, create_time,
				create1_time, settl_times, settl1_times, custom_name);
		return list;
	}

	public int getSettlementYfSH(String agreement_number, String payment_sh,
			String payment_th_did, String create_time, String create1_time,
			String settl_times, String settl1_times, String custom_name) {
		int count = dad.getSettlementYfSH(agreement_number, payment_sh,
				payment_th_did, create_time, create1_time, settl_times,
				settl1_times, custom_name);
		return count;
	}

	public int shSettlementYf(String[] ids, String state, String users,
			String notes) {
		int count = dad.shSettlementYf(ids, state, users, notes);
		return count;
	}

	public List<Delivery_Audit> getSettleShRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		List<Delivery_Audit> list = dad.getSettleShRc(rows, page, start_date,
				end_date, ddids);
		return list;
	}

	public int getSettleShRcs(String start_date, String end_date, String ddids) {
		int count = dad.getSettleShRcs(start_date, end_date, ddids);
		return count;
	}

	public List<CreateAgreement> getSettlementYfSHout(String ddId,
			String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname, String[] ids) {
		List<CreateAgreement> list = dad.getSettlementYfSHout(ddId, types,
				isdelivery, start_date, end_date, start_date1, end_date1,
				start_date2, end_date2, kname, ids);
		return list;
	}

	public List<CreateAgreement> getCustomerSetYf(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String sort, String order,String carname) {
		List<CreateAgreement> list = dad.getCustomerSetYf(rows, page, ddId,
				types, isdelivery, start_date, end_date, start_date1,
				end_date1, start_date2, end_date2, sort, order,carname);
		return list;
	}

	public int getCustomerSetYfs(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2,
			String sort, String order,String carname) {
		int count = dad.getCustomerSetYfs(ddId, types, isdelivery, start_date,
				end_date, start_date1, end_date1, start_date2, end_date2, sort,
				order,carname);
		return count;
	}

	public List<ShippingOrder> getSettlementYfInfo(int rows, int page,
			String agreement_number, String agreement_type, String id) {
		List<ShippingOrder> list = dad.getSettlementYfInfo(rows, page,
				agreement_number, agreement_type, id);
		return list;
	}

	public int getSettlementYf(String agreement_number, String agreement_type,
			String id) {
		int count = dad.getSettlementYf(agreement_number, agreement_type, id);
		return count;
	}

	public List<Delivery_Clearing> getupdateSettle(String table_name,
			Integer settl_order, String[] idss) {
		List<Delivery_Clearing> list = dad.getupdateSettle(table_name, settl_order, idss);
		return list;
	}

	public int updateSettle(List<Delivery_Clearing> list, String table_name,
			String settl_state) {
		int count=dad.updateSettle(list, table_name, settl_state);
		return count;
	}
}
