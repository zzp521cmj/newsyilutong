package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.DestinationFeeCloseMordel;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;
import com.jy.model.ShippingOrder;
import com.jy.model.jiLuLiShi;

public interface HandlingChargeDao {
	/**
	 * 应收代收运费客户导出
	 * */
	public List<DestinationFeeCloseMordel> getDestinationFeeIO(String customer_num,String customer_name,String js_time,String js_times,@Param("array")String[] cuid);
 
	/**
	 * 提审添加记录
	 * */
	 int saveSettlyfSh( List<SettlyfSh> list);
    /**
     * 编辑费用
     * */
    public int UpdateShippFee(@Param("array")String [] sid,String fee);
  
	/**
	 * 应收代收运费客户查询
	 * */
	public List<DestinationFeeCloseMordel> getHandlingCuctome(int rows, int page,String customer_num,String customer_name,String js_time,String js_times,String sort,String order);

	/**
	 * 应收代收运费客户查询总共行数
	 * */
    public int	getHandlingFeeCount(String customer_num,String customer_name,String js_time,String js_times);
	/**
	 * 应收代收运费客户结算查询
	 * */
    public List<DestinationFeeCloseMordel> getShippingClose(int rows, int page,String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
	/**
	 * 应收代收运费客户结算总行数查询
	 * */
    public int getShippingCloseCount(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
    /**
     * 应收代收运费客户结算田间记录表
     * */
    public int insertJiSuan(List<DestinationFeeCloseMordel> list);
    /**
     * 应收代收运费客户结算
     * */
    public int updateJieSuan(@Param("array")String [] sid,String des_sige_name,String  des_bank,String des_card, String des_time,String des_name,String des_market ,String destination_stata);
    /**
     * 应收代收运费客户提审
     * */
    public int updateTiShen(@Param("array")String [] sid,String des_ts_bm,String des_ts_market);   
    /**
     * 应收代收手续费客户结算田间记录表
     * */
    public int inserJyShenHeJiLu(List<DestinationFeeCloseMordel> list);
	/**
	 * 应收代收运审核
	 * */
	int UpdateCheckedShipp(@Param("array")String[] stata,String id);
	/**
	 * 应收代收运审核
	 * */
	int UpdateCheckedBohui(@Param("array")String[] stata,String id);
	/**
	 * 修改审核记录表
	 * */
	int updateJyShenJiLU(String shenhe_name,String shenhe_stime,String shenhe_market,String handling_shihou,String handling_charge);
    /**
     * 查询审核记录
     * */
	public List<Settle_history> getJyShenHeJiLu(int rows, int page,String id);

	/**
	 * 查询审核记录行数
	 * */
    public int	getJyShenHeJiLuCount(String id);
    /**
     * 查询运单调整记录
     * */
    public List<jiLuLiShi> getXiugaijilu(int rows, int page,String num,String xiugaitime,String xiugaitimes);
    /**
     * 查询运单调整记录总行数
     * */
	public int getXiugaijiluCount(String num,String xiugaitime,String xiugaitimes);
	/**
	 * 订单修改导出
	 * */
    public List<jiLuLiShi> getXiuGaiJuInput(String num,String xiugaitime,String xiugaitimes,@Param("array")String[] jilu_id);
    /**
     * 订单导出
     * */
    public List<DestinationFeeCloseMordel> getCustomerInput(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi,@Param("array")String[] shioid,String sid);
    /**
     * 订单审核导出
     * */
    public List<DestinationFeeCloseMordel> getCustomerOup(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi,@Param("array")String[] shioid );

    /**
     * 结算记录保存
     * */
    int	saveSettlchecks(List <Settle_history> list);
	/**
	 * 结算修改保存实收和差额
	 * */
	int saveSettl_fu(List<DestinationFeeCloseMordel>llst);
	/**
	 * 应收手续费审核查询
	 * */
    public List<DestinationFeeCloseMordel> getShippingCloseAuditing(int rows, int page,String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
	/**
	 * 应收手续费审核查询总行数
	 * */
    public int getShippingAuditingCount(String pid,String send_time,String send_times,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times,String shipindi);
	/**
	 *  应收手续费审核记录查询
	 * */ 
    public List<SettlyfSh>  getSettleShRc(int rows,int page,String start_date,String end_date, String ddids);
	/**
	 *  应收手续费审核记录查询总行数
	 * */ 
	 public int  getSettleShRcs(String start_date,String end_date, String ddids);
	 /**
	    * 审核界面查询
	    * */
	 public DestinationFeeCloseMordel getShippingDriver(String id);
}
