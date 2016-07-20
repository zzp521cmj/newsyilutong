package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;

public interface Payable_feeService {
	/**
	 * 驳回修改
	 * */
	public int UpdatePayableReject(String name,String id);
	/**
	 * 中转费结算审核修改。。
	 * */
	public int UpdatePayaleCompany(@Param("array")String[] id,String practice_change_fee,String should_change_fee,String chenge_remarks);
    public int	UpdatePayableCheck(String name,String id);
	public List<ShippingOrder> getShippingOrder(@Param("array")String [] id);
	/**
	 * 中转费结算审核费用查询
	 * */
	public ShippingOrder getShippingXheck(String id);
	/**
	 * 中转费结算提审
	 * */
	int setShippingChedked(@Param("array") String[] id,String arraign_name,String arraign_department,String arraign_remarks);
	/**
	 *  中转费结算审核详细信息
	 * */
	public List<ShippingOrder> getShippingChecked(int rows,int page,String id);
	public int getShippingCheckedCount(String id);
	/**
	 * 中转费结算审核
	 * */
	public List<ShippingOrder> getPayableCheckd(int rows,int page,String shiping_order_num,String receipt ,String fee_date,String dd,String create_time,String yy,String write_off,String send_station,String goods_name,String goods_num,String pay_type,String paid,String company_name);
	public int getPayableCheckdCount(String shiping_order_num,String receipt ,String fee_date,String dd,String create_time,String yy,String write_off,String send_station,String goods_name,String goods_num,String pay_type,String paid,String company_name);
	   /**
     * 应付送货费核销勾选导出Excel
     * 
     * **/
	public List<ShippingOrder> getGouXuanOutpa(String[] id);
	/**
	 * 
	 *应付中转费
	 * @return
	 */
	
		//全部查询z
	 int addSettlement(List<Settlement> list);
	 List<User>  selectfo( User u);
	int editZhuangxie(String shiping_order_id,String writ_ff4,String zhuangxie_date,String people_zhuang);
	int editOther1(String shiping_order_id,String write_off2,String other_date,String people_other );
	 int  editZhuang(String shiping_order_id,String write_off3,String zhuangxie_date,String people_zhuang);
	 int  updateSonghuo(String shiping_order_id,String write_off1,String send_date,String people_song);
	int editSonghuo(String shiping_order_id, String write_off1);
	/**
	 *  应付送货费核销导出Excel
	 * */
	List<ShippingOrder> getDiliveryleOutpa();
	/**
	 *  应付中转费核销导出Excel
	 * */
	public List<ShippingOrder> getPayableOutpa();
	/*
	 * 勾选导出
	 */
	 public List<ShippingOrder> exportCost(@Param("array") String[] checkarray);
	
	int editZhongzhuan(String shiping_order_id, String write_off,String fee_date,String people_zhuang);
	 int delMingxi(@Param("array") String[] del);
	 int delConf(@Param("array") String[] del);
	 List<OrderCustom>  select( String[] s);
		List<ShippingOrder> getPayable_fee(int rows,int page,String shiping_order_num,String receipt ,String fee_date,String dd,String create_time,String yy,String write_off,String send_station,String goods_name,String goods_num,String pay_type,String paid,String company_name);
		public int getPayable_feeInfo(String shiping_order_num,String receipt ,String fee_date,String dd,String create_time,String yy,String write_off,String send_station,String goods_name,String goods_num,String pay_type,String paid,String company_name);//查询总数
		 int updateShippingOrder(ShippingOrder d);//用户修改
		 ShippingOrder getUpdateShippingOrder(String id);//修改查询
		 //
		 int updateShippingOrders(ShippingOrder d);//用户修改
		 ShippingOrder getUpdateShippingOrders(String id);//修改查询
		 
		 int update(ShippingOrder d);//用户修改
		 ShippingOrder getUpdate(String id);//修改查询
		 //
		 int update(String shiping_order_id,String write_off1 ,String send_remarks1,String send_date,String people_song );//用户修改
		 int update1(String shiping_order_id,String write_off ,String fee_date,String people_zhong,String Fee_remarks,String change_bank,String change_card,String change);//用户修改
		 ShippingOrder getupdate1(String id);//修改查询
		 //
		 /**
		  * 
		  * 应付送货费
		  */
		 List<ShippingOrder> getDelivery(int rows,int page,String send_station,String end_address,String send_time,String yy,String car_name, String send_date,String dd,String create_time,String ss,String write_off1,String receipt,String goods_name,String goods_num,String pay_type,String send_fee,String sp);
			public int getDeliveryInfo( String send_station,String end_address,String send_time,String yy,String car_name, String send_date,String dd,String create_time,String ss,String write_off1,String receipt,String goods_name,String goods_num,String pay_type,String send_fee,String sp);//查询总数			
			List<ShippingOrder> getOther(int rows,int page,String shiping_order_num,String receipt ,String other_date,String ss,String write_off2,String send_station,String goods_name,String goods_num,String payble_other);
			public int getOtherInfo( String shiping_order_num,String receipt,String other_date,String ss,String write_off2,String send_station,String goods_name,String goods_num,String payble_other  );//查询总数
			 int feijiazhen (String shiping_order_id,String write_off2 ,String other_date ,String people_other,String other_remarks1 );//用户
			 ShippingOrder getupdate2(String id);//修改查询
			 int updateShippingOrderz(ShippingOrder d);//用户修改
			 ShippingOrder getUpdateShippingOrderz(String id);//修改查询
			 ShippingOrder getUpdateShippingOrderps(String id);//修改查询
			 
			 int up(ShippingOrder d);//用户修改
			 int updaptez(ShippingOrder d);//用户修改
			 ShippingOrder getupdatez(String id);//修改查询
			 /**
			  * 
			  *   应付装卸费 （按票核销 ）
			  */
				List<ShippingOrder> getInstall(int rows,int page,String shiping_order_num,String receipt,String zhuangxie_date,String ss,String write_off3,String send_station,String goods_name,String goods_num,String pay_type,String payble_coolie);
				public int getInstallInfo( String shiping_order_num,String receipt,String zhuangxie_date,String ss,String write_off3,String send_station,String goods_name,String goods_num,String pay_type,String payble_coolie);//查询总数
				 int update3(String  custom_id, String write_off4, String loading_remarks,String zhuangxie_date,String people_zhuang);//用户修改
				 OrderCustom getupdate3(String id);//修改查询
				 int updateShippingOrderf(OrderCustom d);//用户修改
				 OrderCustom getUpdateShippingOrderf(String id);//修改查询
				 int updateShippingOrderps(ShippingOrder d);//用户修改
				 //
				 /**
				  * 应付装卸费（按车核销）
				  * 
				  */
				 List<OrderCustom> getLoading(int rows, int page, String custom_name,String send_station,String zhuangxie_date,String aa,String write_off4,String send_time,String bb,String receipt_time,String cc,String car_number,String driver_name);
					public int getLoadingInfo(String custom_name,String send_station,String zhuangxie_date,String aa,String write_off4,String send_time,String bb,String receipt_time,String cc,String car_number,String driver_name);//查询总数
				 ShippingOrder getUpdate4(String id);//修改查询
				 int update4(String shiping_order_id,String write_off3  ,String zhuangxie_date   ,String people_zhuang,String unloading_remarks);//用户修改
				 // 插入总汇表数据
				 List<ShippingOrder>  selectinfo( String[] s);
				 int insertinfo(List<Confluence> list);
				 int add(List<Mingxi> list);
				 
}
