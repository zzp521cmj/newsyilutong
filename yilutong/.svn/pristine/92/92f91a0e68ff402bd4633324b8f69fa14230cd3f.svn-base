package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.ShippingOrder;

public interface DriverCloseDao {
	/**
	 * 司机结算查询
	 * */
    public List<ShippingOrder> getDriverCloseRejectInfo(int rows, int page,String shiping_order_num,String receipt,String fee_date,String fee_datetime , String create_time,String create_date,String write_off,String send_station ,String goods_name,String goods_num,String pay_type,String driver_name);
	/**
	 * 司机结算查询总行数
	 * */
    public int getDriverCloseRejectCoun(String shiping_order_num,String receipt,String fee_date,String fee_datetime , String create_time,String create_date,String write_off,String send_station ,String goods_name,String goods_num,String pay_type,String driver_name);
    /**
     * 双击修改费用
     * */
   public int UpdeteClose(ShippingOrder sd);
   /**
    * 结算
    * */
   public int UdateDriverClose(String settlement_modes,String fee_remarks,String driver_close_naem,String driv_sige_name,String driv_card,String driv_bank,String oil_card,String oil_card_name,@Param("array")String[] id);
   /**
    * 提审
    * */
  public int getArraignedDriverClose(@Param("array")String[] pid,String trial_remarks,String did,String trial_name);
  /**
   * 司机结算审核
   * */
  public List<ShippingOrder> getDriverChecked(int page,int rows,String driver_name,String car_number,String kuhu_date,String kuhu_dates,String create_time,String create_date);
  /**
   * 司机结算审核总行数
   * */
  public int getDriverCheckedCount(String driver_name,String car_number,String kuhu_date,String kuhu_dates,String create_time,String create_date);
  /**
   *司机结算审核详细信息
   * */
  public List<ShippingOrder> getDriverShipping(int page,int rows,String did);
  public int getDriverShippingCount(String did);
  /**
   * 费用查询
   * */
  public ShippingOrder getShippingDriver(String id);
  /**
   * 查询
   * */
  public List<ShippingOrder> getDriverCheckedShipp(String id);
  /**
   * 审核操作
   * */
  public int UpdateCheckedShipp(String name,String sid,String close_recheck_remarks);
  /**
   * 驳回操作
   * */
  public int UpdateCheckedReject(String name,String sid,String close_recheck_remarks);
  /**
   * 保存到费用表
   * */
  public int insertDriverClose(List<ShippingOrder> so);
}
