package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.DestinationFeeCloseMordel;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;

public interface DestinationFeeCloseSerivce {
	/**
	 * 应收代收运费客户查询总共行数
	 * */
	public List<DestinationFeeCloseMordel> getDestinationFeeCuctome(int rows, int page,String customer_num,String customer_name,String js_time,String js_times,String chayi,String order);
	/**
	 * 应收代收运费客户查询总共行数
	 * */
    public int	getDestinationFeeCount(String customer_num,String customer_name,String js_time,String js_times,String chayi);
	/**
	 * 应收代收运费客户结算查询
	 * */
    public List<DestinationFeeCloseMordel> getShippingClose(int rows, int page,String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
	/**
	 * 应收代收运费客户结算总行数查询
	 * */
    public int getShippingCloseCount(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
    /**
     * 编辑费用
     * */
    public int UpdateShippFee(String [] sid,String fee);
    /**
     * 应收代收运费客户结算
     * */
    public int updateJieSuan(String [] sid,String des_sige_name,String  des_bank,String des_card, String des_time,String des_name,String des_market ,String destination_stata);
    /**
     * 应收代收运费客户提审
     * */
    public int updateTiShen(String [] sid,String des_ts_bm,String des_ts_market);   
    /**
     * 应收代收运费客户结算田间记录表
     * */
    public int insertJiSuan(List<DestinationFeeCloseMordel> list);
    /**
     * 查询
     * */
    public List<DestinationFeeCloseMordel> getShippingJiLu(String [] sid);   
    /**
     * 查看详情
     * */
    public List<Settle_history> getXiangQingShipp(int rows, int page,String pid,String jiesuantime,String jiesuantimes);
    public int getXiangQingShippCount(String pid,String jiesuantime,String jiesuantimes);
	/**
	 * 应收代收运费客户导出
	 * */
	public List<DestinationFeeCloseMordel> getDestinationFeeIO(String customer_num,String customer_name,String js_time,String js_times,@Param("array")String[] cuid);
    /**
     * 订单导出
     * */
    public List<DestinationFeeCloseMordel> getCustomerInput(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi,String[] shioid,String idss );
	/**
	 *  应收代收运费客户审核运单查询
	 * */
    public List<DestinationFeeCloseMordel> getShippingCloseAuditing(int rows, int page,String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
	/**
	 *  应收代收运费客户审核运单查询总行数
	 * */
    public int getShippingAuditingCount(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
	/**
	 * 应收代收运审核
	 * */
	int UpdateCheckedShipp(String stata,String[] id);
	/**
	 * 应收代收运审核驳回
	 * */
	int UpdateCheckedBohui(String stata,@Param("array")String[] id);
	/**
	 * 添加审核
	 * **/
	int InsershenheJIlu(List<DestinationFeeCloseMordel> list);
    /**
     * 结算记录保存
     * */
    int	saveSettlchecks(List <Settle_history> list);
	/**
	 * 结算修改保存实收和差额
	 * */
	int saveSettl_fu(List<DestinationFeeCloseMordel>llst);
	/**
	 * 提审添加记录
	 * */
	 int saveSettlyfSh( List<SettlyfSh> list);
	    /**
		 *  应收手续费审核记录查询
		 * */ 
	 public List<SettlyfSh>  getSettleShRc(int rows,int page,String start_date,String end_date, String ddids);
		/**
		 *  应收手续费审核记录查询总行数
		 * */ 
	 public int getSettleShRcs(String start_date,String end_date, String ddids);
	 /**
	  * 审核运单导出
	  * */
	 public List<DestinationFeeCloseMordel> getCustomerInputOut(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi,@Param("array")String[] shioid ,String idss);
	 /**
	    * 审核界面查询
	    * */
	 public DestinationFeeCloseMordel getShippingDriver(String id);
}
