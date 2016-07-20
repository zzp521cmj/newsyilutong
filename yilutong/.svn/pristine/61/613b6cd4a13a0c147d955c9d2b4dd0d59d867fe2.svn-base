package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;


import com.jy.dao.SettleDaiskDao;
import com.jy.dao.SettleDaiskgfDao;
import com.jy.model.Agencyfund;
import com.jy.model.Customer;
import com.jy.model.Settle_historyGF;
import com.jy.model.SettlGFSh;
import com.jy.model.ShippingOrder;
import com.jy.model.Agencyfund;
import com.jy.service.SettleDaiskService;
import com.jy.service.SettleDaiskgfService;

@Component
public class SettleDaiskgfServiceImpl implements SettleDaiskgfService {
	@Resource
	private SettleDaiskgfDao SettlementYfDao;
	//结算运费修改
	public	int updateSettlementYf(String id,String transpfrees){
		int i =SettlementYfDao.updateSettlementYf(id, transpfrees);
		return i;
	}
	public int addSettlementYf(String[] id,String transpfrees,String transpfree_user,String transpfree_remaks,String khbank,String usernames,String kahao,String zpnum){
		int i =SettlementYfDao.addSettlementYf(id, transpfrees, transpfree_user, transpfree_remaks, khbank, usernames, kahao,zpnum);
			return i;
	}

	public int delSettlementYf(String []ids,String transpfree_sh_dids,String transpfree_th_users,String transpfree_th_notes ) {
	int i = SettlementYfDao.delSettlementYf(ids, transpfree_sh_dids, transpfree_th_users, transpfree_th_notes);
		return i;
	}

	public List<ShippingOrder> getSettlementYfInfo(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname) {
		return SettlementYfDao.getSettlementYfInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}
	
	public int getSettlementYf(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2, String kname) {
		return SettlementYfDao.getSettlementYf(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}
	//导出
	public List<ShippingOrder> getSettlementYfout(String ddId,
					String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,@Param("array")String [] ids){
		return SettlementYfDao.getSettlementYfout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname, ids);
	}
		
	public int saveSettlGFSh(List<SettlGFSh> list) {
		return SettlementYfDao.saveSettlGFSh(list);
	}

	public int saveSettlementYf(Agencyfund list) {
		return SettlementYfDao.saveSettlementYf(list);
	}

	public int shSettlementYf(String[] ids, String state, String users,
			String notes) {
		return SettlementYfDao.shSettlementYf(ids, state, users, notes);
	}

	public List<ShippingOrder> getSettlementYfSHInfo(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname) {
		return SettlementYfDao.getSettlementYfSHInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public int getSettlementYfSH(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2, String kname) {	
		return SettlementYfDao.getSettlementYfSH(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public List<Agencyfund> getSettlementYfRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		return SettlementYfDao.getSettlementYfRc(rows, page, start_date, end_date, ddids);
	}

	public int getSettlementYfRcs(String start_date, String end_date,
			String ddids) {
		return SettlementYfDao.getSettlementYfRcs(start_date, end_date, ddids);
	}

	public List<SettlGFSh> getSettleShRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		return SettlementYfDao.getSettleShRc(rows, page, start_date, end_date, ddids);
	}

	public int getSettleShRcs(String start_date, String end_date, String ddids) {
		return SettlementYfDao.getSettleShRcs(start_date, end_date, ddids);
	}
		//结算记录保存
		public	int	saveSettlchecks(List <Settle_historyGF> list){
					return SettlementYfDao.saveSettlchecks(list);
				}
		//客户查询导出
		public List<Customer> getCustomerSetYf(int rows, int page,
				String customer_name, String customer_num,String js_time,String js_times,String chayi,String order) {
			return SettlementYfDao.getCustomerSetYf(rows, page, customer_name, customer_num,js_time,js_times,chayi,order);
		}
		public int getCustomerSetYfs(String customer_name, String customer_num,String js_time,String js_times,String chayi,String order) {
			return SettlementYfDao.getCustomerSetYfs(customer_name, customer_num,js_time,js_times,chayi,order);
		}
		public List<Customer> getCustomerSetYfout(String customer_name,
				String customer_num,String js_time,String js_times,String chayi,String order, String[] idss) {
			return SettlementYfDao.getCustomerSetYfout(customer_name, customer_num,js_time,js_times,chayi,order, idss);
		}
		public List<ShippingOrder> getSettlementYfSHout(String ddId,
				String types, String isdelivery, String start_date,
				String end_date, String start_date1, String end_date1,
				String start_date2, String end_date2, String kname, String[] ids) {
		
			return SettlementYfDao.getSettlementYfSHout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname, ids);
		}
		public List<Settle_historyGF> getSettleRc(int rows, int page,
				String order_id, String settl_order) {
			return SettlementYfDao.getSettleRc(rows, page, order_id, settl_order);
		}
		public int getSettleRcs(String order_id, String settl_order) {
			return SettlementYfDao.getSettleRcs(order_id, settl_order);
		}
		public int saveSettl_fu(List<ShippingOrder> llst) {	
			return SettlementYfDao.saveSettl_fu(llst);
		}
		public List<Settle_historyGF> getupdateSettle(String table_name,
				Integer settl_order,String[] idss) {
			return SettlementYfDao.getupdateSettle(table_name, settl_order,idss);
		}
		public int updateSettle(List<Settle_historyGF> list, String table_name,
				String settl_state) {
			return SettlementYfDao.updateSettle(list, table_name, settl_state);
		}
}
