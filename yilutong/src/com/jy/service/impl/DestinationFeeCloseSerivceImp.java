package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DestinationFeeCloseDao;
import com.jy.model.DestinationFeeCloseMordel;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;
import com.jy.service.DestinationFeeCloseSerivce;
@Component
public class DestinationFeeCloseSerivceImp implements DestinationFeeCloseSerivce {
    @Resource
    private DestinationFeeCloseDao dfcd;
	public List<DestinationFeeCloseMordel> getDestinationFeeCuctome(int rows,
			int page, String customer_num, String customer_name,
			String js_time, String js_times,String chayi,String order) {
		// TODO Auto-generated method stub
		return dfcd.getDestinationFeeCuctome(rows, page, customer_num, customer_name, js_time, js_times, chayi, order);
	}

	public int getDestinationFeeCount(String customer_num,
			String customer_name, String js_time, String js_times,String chayi) {
		// TODO Auto-generated method stub
		return dfcd.getDestinationFeeCount(customer_num, customer_name, js_time, js_times, chayi);
	}

	public List<DestinationFeeCloseMordel> getShippingClose(int rows, int page,String pid,
			String send_time, String send_times, String jiesuStata,
			String shenhe, String jiesuantime, String jiesuantimes,
			String order_time, String order_times,String shipindi) {
		// TODO Auto-generated method stub
		return dfcd.getShippingClose(rows, page,pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
	}

	public int getShippingCloseCount(String pid,String send_time, String send_times,
			String jiesuStata, String shenhe, String jiesuantime,
			String jiesuantimes, String order_time, String order_times,String shipindi) {
		// TODO Auto-generated method stub
		return dfcd.getShippingCloseCount(pid,send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
	}

	public int UpdateShippFee(String[] sid, String fee) {
		// TODO Auto-generated method stub
		return dfcd.UpdateShippFee(sid, fee);
	}

	public int updateJieSuan(String[] sid, String des_sige_name,
			String des_bank, String des_card, String des_time, String des_name,
			String des_market, String destination_stata) {
		// TODO Auto-generated method stub
		return dfcd.updateJieSuan(sid, des_sige_name, des_bank, des_card, des_time, des_name, des_market, destination_stata);
	}

	public int updateTiShen(String[] sid, String des_ts_bm, String des_ts_market) {
		// TODO Auto-generated method stub
		return dfcd.updateTiShen(sid, des_ts_bm, des_ts_market);
	}

	public int insertJiSuan(List<DestinationFeeCloseMordel> list) {
		// TODO Auto-generated method stub
		return dfcd.insertJiSuan(list);
	}

	public List<DestinationFeeCloseMordel> getShippingJiLu(String[] sid) {
		// TODO Auto-generated method stub
		return dfcd.getShippingJiLu(sid);
	}

	public List<Settle_history> getXiangQingShipp(int rows,
			int page, String pid,String jiesuantime,String jiesuantimes) {
		// TODO Auto-generated method stub
		return dfcd.getXiangQingShipp(rows, page, pid);
	}

	public int getXiangQingShippCount(String pid,String jiesuantime,String jiesuantimes) {
		// TODO Auto-generated method stub
		return dfcd.getXiangQingShippCount(pid, jiesuantime, jiesuantimes);
	}

	public List<DestinationFeeCloseMordel> getDestinationFeeIO(String customer_num, String customer_name,
			String js_time, String js_times, String[] cuid) {
		// TODO Auto-generated method stub
		return dfcd.getDestinationFeeIO(customer_num, customer_name, js_time, js_times, cuid);
	}

	public List<DestinationFeeCloseMordel> getCustomerInput(String pid,
			String send_time, String send_times, String jiesuStata,
			String shenhe, String jiesuantime, String jiesuantimes,
			String order_time, String order_times, String shipindi,
			String[] shioid,String idss) {
		// TODO Auto-generated method stub
		return dfcd.getCustomerInput(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, shioid,idss);
	}

	public List<DestinationFeeCloseMordel> getShippingCloseAuditing(int rows,
			int page, String pid, String send_time, String send_times,
			String jiesuStata, String shenhe, String jiesuantime,
			String jiesuantimes, String order_time, String order_times,
			String shipindi) {
		// TODO Auto-generated method stub
		return dfcd.getShippingCloseAuditing(rows, page, pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi);
	}

	public int getShippingAuditingCount(String pid, String send_time,
			String send_times, String jiesuStata, String shenhe,
			String jiesuantime, String jiesuantimes, String order_time,
			String order_times, String shipindi) {
		// TODO Auto-generated method stub
		return dfcd.getShippingAuditingCount(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi);
	}

	public int UpdateCheckedShipp(String stata, String[] id) {
		// TODO Auto-generated method stub
		return dfcd.UpdateCheckedShipp(stata, id);
	}

	public int InsershenheJIlu(List<DestinationFeeCloseMordel> list) {
		// TODO Auto-generated method stub
		return dfcd.InsershenheJIlu(list);
	}

	public int saveSettlchecks(List<Settle_history> list) {
		// TODO Auto-generated method stub
		return dfcd.saveSettlchecks(list);
	}

	public int saveSettl_fu(List<DestinationFeeCloseMordel> llst) {
		// TODO Auto-generated method stub
		return dfcd.saveSettl_fu(llst);
	}

	public int saveSettlyfSh(List<SettlyfSh> list) {
		// TODO Auto-generated method stub
		return dfcd.saveSettlyfSh(list);
	}

	public int UpdateCheckedBohui(String stata, String[] id) {
		// TODO Auto-generated method stub
		return dfcd.UpdateCheckedBohui(stata, id);
	}

	public List<SettlyfSh> getSettleShRc(int rows, int page, String start_date,
			String end_date, String ddids) {
		// TODO Auto-generated method stub
		return dfcd.getSettleShRc(rows, page, start_date, end_date, ddids);
	}

	public int getSettleShRcs(String start_date, String end_date, String ddids) {
		// TODO Auto-generated method stub
		return dfcd.getSettleShRcs(start_date, end_date, ddids);
	}

	public List<DestinationFeeCloseMordel> getCustomerInputOut(String pid,
			String send_time, String send_times, String jiesuStata,
			String shenhe, String jiesuantime, String jiesuantimes,
			String order_time, String order_times, String shipindi,
			String[] shioid,String idss) {
		// TODO Auto-generated method stub
		return dfcd.getCustomerInputOut(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, shioid,idss);
	}

	public DestinationFeeCloseMordel getShippingDriver(String id) {
		// TODO Auto-generated method stub
		return dfcd.getShippingDriver(id);
	}

}
