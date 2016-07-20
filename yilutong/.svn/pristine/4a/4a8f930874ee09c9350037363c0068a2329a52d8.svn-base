package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.jy.dao.TransportfreeDao;
import com.jy.model.ShippingOrder;
import com.jy.model.TranspfreeCheckeds;
import com.jy.model.Transportfree;
import com.jy.service.TransportfreeService;
@Component
public class TransportfreeServiceImpl implements TransportfreeService {
	@Resource
	private TransportfreeDao TransportfreeDao;
	public //调整运费修改
	int addTransportfree(String id,String transpfrees,String transpfree_user,String transpfree_remaks,String transport_pay){
		int i =TransportfreeDao.addTransportfree(id, transpfrees, transpfree_user, transpfree_remaks, transport_pay);
			return i;
	}

	public int delTransportfree(String []ids,String transpfree_sh_dids,String transpfree_th_users,String transpfree_th_notes ) {
	int i = TransportfreeDao.delTransportfree(ids, transpfree_sh_dids, transpfree_th_users, transpfree_th_notes);
		return i;
	}

	public List<ShippingOrder> getTransportfreeInfo(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname) {
		return TransportfreeDao.getTransportfreeInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public int getTransportfree(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2, String kname) {
		return TransportfreeDao.getTransportfree(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public int saveTranspchecks(List<TranspfreeCheckeds> list) {
		return TransportfreeDao.saveTranspchecks(list);
	}

	public int saveTransportFree(Transportfree list) {
		return TransportfreeDao.saveTransportFree(list);
	}

	public int shTransportfree(String[] ids, String state, String users,
			String notes) {
		return TransportfreeDao.shTransportfree(ids, state, users, notes);
	}

	public List<ShippingOrder> getTransportfreeSHInfo(int rows, int page,
			String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2, String kname) {
		return TransportfreeDao.getTransportfreeSHInfo(rows, page, ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public int getTransportfreeSH(String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2, String kname) {	
		return TransportfreeDao.getTransportfreeSH(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
	}

	public List<Transportfree> getTransportfreeRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		return TransportfreeDao.getTransportfreeRc(rows, page, start_date, end_date, ddids);
	}

	public int getTransportfreeRcs(String start_date, String end_date,
			String ddids) {
		return TransportfreeDao.getTransportfreeRcs(start_date, end_date, ddids);
	}

	public List<TranspfreeCheckeds> getTranfreeShRc(int rows, int page,
			String start_date, String end_date, String ddids) {
		return TransportfreeDao.getTranfreeShRc(rows, page, start_date, end_date, ddids);
	}

	public int getTranfreeShRcs(String start_date, String end_date, String ddids) {
		return TransportfreeDao.getTranfreeShRcs(start_date, end_date, ddids);
	}
	//运费调整导出
	public  List<ShippingOrder>  getTransportfreeOut(String ddId, String types, String isdelivery, String start_date,
	String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname,String[] checkarray){
		return TransportfreeDao.getTransportfreeOut(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,checkarray);
	 }

	public List<ShippingOrder> getTransportfreeShOut(String ddId, String types,
			String isdelivery, String start_date, String end_date,
			String start_date1, String end_date1, String start_date2,
			String end_date2, String kname, String[] checkarray) {
		return TransportfreeDao.getTransportfreeShOut(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,checkarray);
		
	}
}
