package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.HandlingChargeDao;
import com.jy.model.DestinationFeeCloseMordel;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;
import com.jy.model.ShippingOrder;
import com.jy.model.jiLuLiShi;
import com.jy.service.HandlingChargeService;
@Component
public class HandlingChargeServiceImp implements HandlingChargeService {
	@Resource
    private HandlingChargeDao hcd;

	public List<DestinationFeeCloseMordel> getHandlingCuctome(int rows,
			int page, String customer_num, String customer_name,
			String js_time, String js_times,String sort,String order) {
		// TODO Auto-generated method stub
		return hcd.getHandlingCuctome(rows, page, customer_num, customer_name, js_time, js_times, sort, order);
	}

	public int getHandlingFeeCount(String customer_num, String customer_name,
			String js_time, String js_times) {
		// TODO Auto-generated method stub
		return hcd.getHandlingFeeCount(customer_num, customer_name, js_time, js_times);
	}

	public List<DestinationFeeCloseMordel> getShippingClose(int rows, int page,
			String pid, String send_time, String send_times, String jiesuStata,
			String shenhe, String jiesuantime, String jiesuantimes,
			String order_time, String order_times, String shipindi) {
		// TODO Auto-generated method stub
		return hcd.getShippingClose(rows, page, pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi);
	}

	public int getShippingCloseCount(String pid, String send_time,
			String send_times, String jiesuStata, String shenhe,
			String jiesuantime, String jiesuantimes, String order_time,
			String order_times, String shipindi) {
		// TODO Auto-generated method stub
		return hcd.getShippingCloseCount(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi);
	}

	public int UpdateShippFee(String[] sid, String fee) {
		// TODO Auto-generated method stub
		return hcd.UpdateShippFee(sid, fee);
	}

	public int insertJiSuan(List<DestinationFeeCloseMordel> list) {
		// TODO Auto-generated method stub
		return hcd.insertJiSuan(list);
	}

	public int updateJieSuan(String[] sid, String des_sige_name,
			String des_bank, String des_card, String des_time, String des_name,
			String des_market, String destination_stata) {
		// TODO Auto-generated method stub
		return hcd.updateJieSuan(sid, des_sige_name, des_bank, des_card, des_time, des_name, des_market, destination_stata);
	}

	public int updateTiShen(String[] sid, String des_ts_bm, String des_ts_market) {
		// TODO Auto-generated method stub
		return hcd.updateTiShen(sid, des_ts_bm, des_ts_market);
	}

	public int inserJyShenHeJiLu(List<DestinationFeeCloseMordel> list) {
		// TODO Auto-generated method stub
		return hcd.inserJyShenHeJiLu(list);
	}

	public int UpdateCheckedShipp(String stata[], String id) {
		// TODO Auto-generated method stub
		return hcd.UpdateCheckedShipp(stata, id);
	}

	public int UpdateCheckedBohui(String[] stata, String id) {
		// TODO Auto-generated method stub
		return hcd.UpdateCheckedBohui(stata, id);
	}

	public int updateJyShenJiLU(String shenhe_name, String shenhe_stime,
			String shenhe_market, String handling_shihou, String handling_charge) {
		// TODO Auto-generated method stub
		return hcd.updateJyShenJiLU(shenhe_name, shenhe_stime, shenhe_market, handling_shihou, handling_charge);
	}

	public List<Settle_history> getJyShenHeJiLu(int rows, int page,
			String id) {
		// TODO Auto-generated method stub
		return hcd.getJyShenHeJiLu(rows, page, id);
	}

	public int getJyShenHeJiLuCount(String id) {
		// TODO Auto-generated method stub
		return hcd.getJyShenHeJiLuCount(id);
	}

	public List<jiLuLiShi> getXiugaijilu(int rows, int page, String num,
			String xiugaitime, String xiugaitimes) {
		// TODO Auto-generated method stub
		return hcd.getXiugaijilu(rows, page, num, xiugaitime, xiugaitimes);
	}

	public int getXiugaijiluCount(String num, String xiugaitime,
			String xiugaitimes) {
		// TODO Auto-generated method stub
		return hcd.getXiugaijiluCount(num, xiugaitime, xiugaitimes);
	}

	public List<DestinationFeeCloseMordel> getCustomerInput(String pid,
			String send_time, String send_times, String jiesuStata,
			String shenhe, String jiesuantime, String jiesuantimes,
			String order_time, String order_times, String shipindi,
			String[] shioid,String sid) {
		// TODO Auto-generated method stub
		return hcd.getCustomerInput(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, shioid,sid);
	}

	public int saveSettlchecks(List<Settle_history> list) {
		// TODO Auto-generated method stub
		return hcd.saveSettlchecks(list);
	}

	public int saveSettl_fu(List<DestinationFeeCloseMordel> llst) {
		// TODO Auto-generated method stub
		return hcd.saveSettl_fu(llst);
	}

	public int saveSettlyfSh(List<SettlyfSh> list) {
		// TODO Auto-generated method stub
		return hcd.saveSettlyfSh(list);
	}

	public List<DestinationFeeCloseMordel> getShippingCloseAuditing(int rows,
			int page, String pid, String send_time, String send_times,
			String jiesuStata, String shenhe, String jiesuantime,
			String jiesuantimes, String order_time, String order_times,
			String shipindi) {
		// TODO Auto-generated method stub
		return hcd.getShippingCloseAuditing(rows, page, pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi);
	}

	public int getShippingAuditingCount(String pid, String send_time,
			String send_times, String jiesuStata, String shenhe,
			String jiesuantime, String jiesuantimes, String order_time,
			String order_times, String shipindi) {
		// TODO Auto-generated method stub
		return hcd.getShippingAuditingCount(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi);
	}

	public List<SettlyfSh> getSettleShRc(int rows, int page, String start_date,
			String end_date, String ddids) {
		// TODO Auto-generated method stub
		return hcd.getSettleShRc(rows, page, start_date, end_date, ddids);
	}

	public int getSettleShRcs(String start_date, String end_date, String ddids) {
		// TODO Auto-generated method stub
		return hcd.getSettleShRcs(start_date, end_date, ddids);
	}

	public List<jiLuLiShi> getXiuGaiJuInput(String num,
			String xiugaitime, String xiugaitimes, String[] jilu_id) {
		// TODO Auto-generated method stub
		return hcd.getXiuGaiJuInput(num, xiugaitime, xiugaitimes, jilu_id);
	}

	public List<DestinationFeeCloseMordel> getDestinationFeeIO(
			String customer_num, String customer_name, String js_time,
			String js_times, String[] cuid) {
		// TODO Auto-generated method stub
		return hcd.getDestinationFeeIO(customer_num, customer_name, js_time, js_times, cuid);
	}

	public List<DestinationFeeCloseMordel> getCustomerOup(String pid,
			String send_time, String send_times, String jiesuStata,
			String shenhe, String jiesuantime, String jiesuantimes,
			String order_time, String order_times, String shipindi,
			String[] shioid) {
		// TODO Auto-generated method stub
		return hcd.getCustomerOup(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, shioid);
	}

	public DestinationFeeCloseMordel getShippingDriver(String id) {
		// TODO Auto-generated method stub
		return hcd.getShippingDriver(id);
	}


}
