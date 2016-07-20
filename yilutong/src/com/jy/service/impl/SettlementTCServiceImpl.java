package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.jy.dao.SettlementTCDao;
import com.jy.model.CreateAgreement;
import com.jy.model.Settle_historyGF;
import com.jy.model.SettlGFSh;
import com.jy.model.ShippingOrder;
import com.jy.model.Agencyfund;
import com.jy.service.SettlementTCService;
@Component
public class SettlementTCServiceImpl implements SettlementTCService {
	@Resource
	private SettlementTCDao settlementTCDao;
	//结算运费修改
	public	int updateSettlementYf(String id,String transpfrees){
		int i =settlementTCDao.updateSettlementYf(id, transpfrees);
		return i;
	}
	public int addSettlementYf(String[] id,String transpfrees,String transpfree_user,String transpfree_remaks,String khbank,String usernames,String kahao,String zpnum){
		int i =settlementTCDao.addSettlementYf(id, transpfrees, transpfree_user, transpfree_remaks, khbank, usernames, kahao,zpnum);
			return i;
	}

	public int delSettlementYf(String []ids,String transpfree_sh_dids,String transpfree_th_users,String transpfree_th_notes ) {
	int i = settlementTCDao.delSettlementYf(ids, transpfree_sh_dids, transpfree_th_users, transpfree_th_notes);
		return i;
	}

	public List<ShippingOrder> getSettlementYfInfo(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname) {
		return settlementTCDao.getSettlementYfInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}
	
	public int getSettlementYf(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2, String kname) {
		return settlementTCDao.getSettlementYf(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}
	//导出
	public List<ShippingOrder> getSettlementYfout(String ddId,
					String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,@Param("array")String [] ids){
		return settlementTCDao.getSettlementYfout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname, ids);
	}
		
	public int saveSettlyfSh(List<SettlGFSh> list) {
		return settlementTCDao.saveSettlyfSh(list);
	}

	public int saveSettlementYf(Agencyfund list) {
		return settlementTCDao.saveSettlementYf(list);
	}

	public int shSettlementYf(String[] ids, String state, String users,
			String notes) {
		return settlementTCDao.shSettlementYf(ids, state, users, notes);
	}

	public List<ShippingOrder> getSettlementYfSHInfo(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname) {
		return settlementTCDao.getSettlementYfSHInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public int getSettlementYfSH(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2, String kname) {	
		return settlementTCDao.getSettlementYfSH(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public List<Agencyfund> getSettlementYfRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		return settlementTCDao.getSettlementYfRc(rows, page, start_date, end_date, ddids);
	}

	public int getSettlementYfRcs(String start_date, String end_date,
			String ddids) {
		return settlementTCDao.getSettlementYfRcs(start_date, end_date, ddids);
	}

	public List<SettlGFSh> getSettleShRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		return settlementTCDao.getSettleShRc(rows, page, start_date, end_date, ddids);
	}

	public int getSettleShRcs(String start_date, String end_date, String ddids) {
		return settlementTCDao.getSettleShRcs(start_date, end_date, ddids);
	}
		//结算记录保存
		public	int	saveSettlchecks(List <Settle_historyGF> list){
					return settlementTCDao.saveSettlchecks(list);
				}
		//客户查询导出？？？这？
		public List<CreateAgreement> getCustomerSetYf(int rows, int page,
				String agreement_number, String agreement_type,String agreementstartdate,String agreementenddate,String sort,String order) {
			return settlementTCDao.getCustomerSetYf(rows, page, agreement_number, agreement_type,agreementstartdate,agreementenddate,sort,order);		}
		public int getCustomerSetYfs(String customer_name, String customer_num,String agreementstartdate,String agreementenddate,String sort,String order) {
			return settlementTCDao.getCustomerSetYfs(customer_name, customer_num,agreementstartdate,agreementenddate,sort,order);
		}
		public List<CreateAgreement> getCustomerSetYfout(String agreement_number,
				String agreement_type,String agreementstartdate,String agreementenddate,String sort,String order  ,String[] idss){
					return settlementTCDao.getCustomerSetYfout(agreement_number, agreement_type, agreementstartdate,agreementenddate,sort,order, idss);
			
			
		}
		public List<ShippingOrder> getSettlementYfSHout(String ddId,
				String types, String isdelivery, String start_date,
				String end_date, String start_date1, String end_date1,
				String start_date2, String end_date2, String kname, String[] ids) {
		
			return settlementTCDao.getSettlementYfSHout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname, ids);
		}
		public List<Settle_historyGF> getSettleRc(int rows, int page,
				String order_id, String settl_order) {
			return settlementTCDao.getSettleRc(rows, page, order_id, settl_order);
		}
		public int getSettleRcs(String order_id, String settl_order) {
			return settlementTCDao.getSettleRcs(order_id, settl_order);
		}
		public int saveSettl_fu(List<ShippingOrder> llst) {	
			return settlementTCDao.saveSettl_fu(llst);
		}
}
