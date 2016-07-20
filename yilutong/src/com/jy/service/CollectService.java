package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;

public interface CollectService {
	/**
	 * 审核确认
	 * */
	public int UpdateShipingorder(String id);
	/**
	 * 驳回修改S
	 * */
	public int rejectShipingorder(String  id);
	 int updateCori(String custom_id,String write_off,String remarks_fee1,String kuhu_date,String People_kehu,String close_recheck_state );
	/**
	 * 修改
	 * */
	public int updateShippiOrCo(ShippingOrder id);
	/**
	 * 查询
	 * */
	public ShippingOrder getshipinCollect(String id);
	/**
	 * 删除重复
	 * */
	public int delectCollShi(ShippingOrder shiid,@Param("array")String [] id);
	/**
	 * 详细信息查询
	 * */
	public int getShippingCount(String name ,String  phone_number,String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address);//查询总数
	public List<ShippingOrder> getShippingCollect(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address );
	/**
	 * 添加记录表
	 * */
	public int insertCostShiping(List<ShippingOrder> order);
	/**
	 * 客户结算查询费用
	 * */
	public List<ShippingOrder> getCustomShiping(@Param("array")String [] id);
	/**
	 * 客户结算审核select2查询
	 * */
	public List<User> getuser(String username);
	/**
	 * 客户结算审核
	 * */
	public int updateCheckCollect(@Param("array")String [] id,String close_recheck_name,String close_recheck_remarks,String paid_fee,String transport_pay,String trade_agency);
	 /**
	  * 专线公司结算审核
	  * */
	List<ShippingOrder> getCheckCollect(int rows,int page,String custom_name,String car_time,String kuhu_date,String kuhu_dates,String write_off3,String send_time,String divlabel,String receipt_time,String receipt_times,String car_number,String driver_name);
	 /**
	  * 专线公司结算审核
	  * */
	public int getCheckCollectCount( String custom_name,String car_time,String kuhu_date,String kuhu_dates,String write_off3,String send_time,String divlabel,String receipt_time,String receipt_times,String car_number,String driver_name);
	
	/**
	 *  应收客户账款核销 （按车核销）
	 */
	
	// 全部查询
	int sp(@Param("array") String[] del);
	List<Settlement> selectSettement(String shiping_order_num );
	public int selectSettementInfo( String shiping_order_num  );
	
	int addSettlement(List<Settlement> list);
	 List<User>  selectfo( User u);
	List<ShippingOrder> selectIn(String[] c);
	int editOther(String shiping_order_id, String write_off5,String others_date,String people_others);
	/**
	 * 客户结算取消
	 * */
	int editKuhu(String custom_id, String write_off3,String kuhu_date,String people_kehu);
	 int delMingxi(@Param("array") String[] del);
	 int delConf(@Param("array") String[] del);
	 /**
	  * 专线公司结算
	  * */
		List<ShippingOrder> getCollect(int rows,int page,String custom_name,String car_time,String kuhu_date,String kuhu_dates,String write_off3,String send_time,String send_times,String receipt_time,String receipt_times,String car_number,String driver_name);
		 /**
		  * 专线公司结算
		  * */
		public int getCollectInfo( String custom_name,String car_time,String kuhu_date,String kuhu_dates,String write_off3,String send_time,String send_times,String receipt_time,String receipt_times,String car_number,String driver_name);//鏌ヨ鎬绘暟
	int updateShippingOrder(OrderCustom d);//用户修改
	OrderCustom getUpdateShippingOrder(String id);//修改查询
	 int update3(String[] custom_id,String write_off,String remarks_fee1,String kuhu_date,String People_kehu,String close_recheck_state,String customs_sige_name,String customs_card,String customs_bank);//鐢ㄦ埛淇敼
	 int updateCollWori(String custom_id,String write_off,String remarks_fee1,String kuhu_date,String People_kehu,String close_recheck_state );//鐢ㄦ埛淇敼
	   /**
	    * 提审
	    * */
	public int getEreArraignedCustoms(@Param("array")String[] pid,String trial_remarks,String did,String trial_name);

	 OrderCustom getupdate3(String id);//修改查询
	 int otherUpdate(ShippingOrder d);//用户修改
	 int Del(@Param("array") String[] del);
	 /**
	  * 
	  *   应收其他费备注核销
	  */
		List<ShippingOrder> getAdorn_fee(int rows,int page,String shiping_order_num,String send_station,String others_date,String aa,String write_off5,String custom_name,String receipt,String goods_name,String goods_num,String pay_type,String paid);
		public int getAdorn_feeInfo( String shiping_order_num,String send_station,String others_date,String aa,String write_off5,String custom_name,String receipt,String goods_name,String goods_num,String pay_type,String paid);//查询总数
		 int update2(@Param("array") String  pid );//用户修改
		 ShippingOrder getUpdate2(String  id);//修改查询
		 int sss(String [] del);
		 List<ShippingOrder>  selectinfo( String[] s);
		 List<ShippingOrder>  select( String[] s);
		 /**
		  * 添加到汇总表
		  * */
		 int insertinfo(List<Confluence> list);
		 /**
		  * 添加到明细表
		  * */
		 int add(List<Mingxi> list);
		 int update9(String shiping_order_id,String write_off5,String others_date ,String people_others,String Write_remarks );//用户修改
		 int editWrite(String shiping_order_id, String write_id);
}
