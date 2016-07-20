package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.Payable_feeDAO;
import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.Payable_feeService;
@Component
public class Payable_feeServiceImpl implements Payable_feeService {
		
	@Resource
	private Payable_feeDAO payable_feeDAO;
	
	public List<ShippingOrder> getPayable_fee(int rows, int page,
			String shiping_order_num, String receipt  ,String fee_date,String dd,String create_time,String yy,String write_off,String send_station,String goods_name,String goods_num,String pay_type,String paid,String company_name) {
			List<ShippingOrder> list = payable_feeDAO.getPayable_fee(rows, page, shiping_order_num, receipt ,fee_date,dd,create_time,yy, write_off, send_station, goods_name, goods_num, pay_type, paid, company_name);
		return list;
	}

	public int getPayable_feeInfo(String shiping_order_num, String receipt, 
			 String fee_date,String dd,String create_time,String yy,String write_off,String send_station,String goods_name,String goods_num,String pay_type,String paid,String company_name) {
		int i = payable_feeDAO.getPayable_feeInfo(shiping_order_num, receipt,fee_date,dd,create_time,yy, write_off, send_station, goods_name, goods_num, pay_type, paid, company_name);
		return i;
	}

	public int updateShippingOrder(ShippingOrder d) {
	int i = payable_feeDAO.updateShippingOrder(d);
		return i;
	}

	public ShippingOrder getUpdateShippingOrder(String id) {
		ShippingOrder so = payable_feeDAO.getUpdateShippingOrder(id);
		return so;
	}

	

	

	public int updateShippingOrders(ShippingOrder d) {
		int i = payable_feeDAO.updateShippingOrders(d);
		return i;
	}

	public ShippingOrder getUpdateShippingOrders(String id) {
		ShippingOrder si = payable_feeDAO.getUpdateShippingOrders(id);
		return si;
	}

	

	public ShippingOrder getUpdate(String id) {
		ShippingOrder si = payable_feeDAO.getUpdate(id);
		return si;
	}

	

	public ShippingOrder getupdate1(String id) {
		ShippingOrder so = payable_feeDAO.getupdate1(id);
		return so;
	}

	public List<ShippingOrder> getOther(int rows, int page,
			String shiping_order_num, String receipt, String other_date,String ss,String write_off2,String send_station,String goods_name,String goods_num,String payble_other ) {
		List<ShippingOrder> list =payable_feeDAO.getOther(rows, page, shiping_order_num, receipt, other_date,ss, write_off2, send_station, goods_name, goods_num, payble_other );
		return list;
	}

	public int getOtherInfo(String shiping_order_num, String receipt,
			String other_date,String ss,String write_off2,String send_station,String goods_name,String goods_num,String payble_other ) {
		int i =payable_feeDAO.getOtherInfo(shiping_order_num, receipt, other_date,ss, write_off2, send_station, goods_name, goods_num, payble_other);
		return i;
	}

	

	public ShippingOrder getupdate2(String id) {
		ShippingOrder so = payable_feeDAO.getupdate2(id);
		return so;
	}

	public int updateShippingOrderz(ShippingOrder d) {
		int i = payable_feeDAO.updateShippingOrderz(d);
		return i;
	}

	public ShippingOrder getUpdateShippingOrderz(String id) {
		ShippingOrder so = payable_feeDAO.getUpdateShippingOrderz(id);
		return so;
	}

	public List<ShippingOrder> getInstall(int rows, int page,
			String shiping_order_num, String receipt,String zhuangxie_date,String ss,String write_off3,String send_station,String goods_name,String goods_num,String pay_type,String payble_coolie) {
		List<ShippingOrder> list =payable_feeDAO.getInstall(rows, page, shiping_order_num, receipt, zhuangxie_date,ss, write_off3, send_station, goods_name, goods_num, pay_type, payble_coolie);
		return list;
	}

	public int getInstallInfo(String shiping_order_num, String receipt,String zhuangxie_date,String ss,String write_off3,String send_station,String goods_name,String goods_num,String pay_type,String payble_coolie) {
		int i = payable_feeDAO.getInstallInfo(shiping_order_num, receipt,zhuangxie_date, ss,write_off3, send_station, goods_name, goods_num, pay_type, payble_coolie);
		return i;
	}

	
	
	public OrderCustom getupdate3(String id) {
		OrderCustom os =payable_feeDAO.getupdate3(id);
		return os;
	}

	

	public ShippingOrder getUpdate4(String id) {
		ShippingOrder so = payable_feeDAO.getUpdate4(id);
		return so;
	}

	public int updateShippingOrderf(OrderCustom d) {
		int i = payable_feeDAO.updateShippingOrderf(d);
		return i;
	}

	public OrderCustom getUpdateShippingOrderf(String id) {
		OrderCustom oc = payable_feeDAO.getUpdateShippingOrderf(id);
		return oc;
	}
	public int update3(String custom_id, String write_off4,
			String loading_remarks,String zhuangxie_date,String people_zhuang) {
		int i = payable_feeDAO.update3(custom_id, write_off4, loading_remarks,zhuangxie_date, people_zhuang);
		return i;
	}

	public int updateShippingOrderps(ShippingOrder d) {
		int  i = payable_feeDAO.updateShippingOrderps(d);
		return i;
	}

	public ShippingOrder getUpdateShippingOrderps(String id) {
		ShippingOrder sp = payable_feeDAO.getUpdateShippingOrderps(id);
		return sp;
	}

	public int updateShippingOrderp(ShippingOrder d) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updaptez(ShippingOrder d) {
		int i = payable_feeDAO.updaptez(d);
		return i;
	}

	public ShippingOrder getupdatez(String id) {
		ShippingOrder so = payable_feeDAO.getUpdateShippingOrderz(id);
		return so;
	}

	public int up(ShippingOrder d) {
		int i = payable_feeDAO.up(d);
		return i;
	}

	

	

	public int update(String shiping_order_id, String write_off1,String send_remarks1
			 
			  ,String send_date,String people_song) {
		int i = payable_feeDAO.update(shiping_order_id, write_off1, send_remarks1,send_date, people_song);
		return i ;
	}

	



	public int update(ShippingOrder d) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ShippingOrder> selectinfo( String[] id) {
		List<ShippingOrder> list = payable_feeDAO.selectinfo(id);
		return list;
	}

	

	public int insertinfo(List<Confluence> list) {
		int  i = payable_feeDAO.insertinfo(list);
		return i;
	}

	public List<OrderCustom> select(String[] s) {
	List<OrderCustom> list = payable_feeDAO.select(s);
		return list;
	}

	public int add(List<Mingxi> list) {
		int i = payable_feeDAO.add(list);
		return i;
	}

	

	public int delMingxi(String[] del) {
		int i = payable_feeDAO.delMingxi(del);
		return i;
	}

	public int delConf(String[] del) {
		int i = payable_feeDAO.delConf(del);
		return i;
	}

	public int editZhongzhuan(String shiping_order_id, String write_off,String fee_date,String people_zhuang) {
		int i = payable_feeDAO.editZhongzhuan(shiping_order_id, write_off, fee_date, people_zhuang);
		return i;
	}

	public int editSonghuo(String shiping_order_id, String write_off1) {
		int i = payable_feeDAO.editSonghuo(shiping_order_id, write_off1);
		return i;
	}

	public int updateSonghuo(String shiping_order_id, String write_off1,String send_date,String people_song) {
		int i = payable_feeDAO.updateSonghuo(shiping_order_id, write_off1, send_date,people_song);
		return i;
	}

	public int editZhuang(String shiping_order_id, String write_off3,String zhuangxie_date,String people_zhuang) {
		int i = payable_feeDAO.editZhuang(shiping_order_id, write_off3, zhuangxie_date, people_zhuang);
		return i;
	}

	public int editOther1(String shiping_order_id, String write_off2,String other_date,String people_other ) {
		int i = payable_feeDAO.editOther1(shiping_order_id, write_off2, other_date, people_other );
		return i;
	}

	public int editZhuangxie(String shiping_order_id, String writ_ff4,String zhuangxie_date,String people_zhuang) {
		int i = payable_feeDAO.editZhuangxie(shiping_order_id, writ_ff4, zhuangxie_date, people_zhuang);
		return i;
	}

	public List<User> selectfo(User u) {
	List<User> list = payable_feeDAO.selectfo(u);
		return list;
	}

	public int update4(String shiping_order_id, String write_off3,
			String zhuangxie_date, String people_zhuang,String unloading_remarks) {
		int i = payable_feeDAO.update4(shiping_order_id, write_off3, zhuangxie_date, people_zhuang,unloading_remarks);
		return i;
	}


	

	public int addSettlement(List<Settlement> list) {
		int i = payable_feeDAO.addSettlement(list);
		return i;
	}

	public List<ShippingOrder> getDelivery(int rows, int page,
			String send_station, String end_address, String send_time,
			String yy, String car_name, String send_date, String dd,
			String create_time, String ss, String write_off1, String receipt,
			String goods_name, String goods_num, String pay_type,
			String send_fee,String sp) {
		List<ShippingOrder> list = payable_feeDAO.getDelivery(rows, page, send_station, end_address, send_time, yy, car_name, send_date, dd, create_time, ss, write_off1, receipt, goods_name, goods_num, pay_type, send_fee,sp);
		return list;
	}

	public int getDeliveryInfo(String send_station, String end_address,
			String send_time, String yy, String car_name, String send_date,
			String dd, String create_time, String ss, String write_off1,
			String receipt, String goods_name, String goods_num,
			String pay_type, String send_fee,String sp) {
		int i = payable_feeDAO.getDeliveryInfo(send_station, end_address, send_time, yy, car_name, send_date, dd, create_time, ss, write_off1, receipt, goods_name, goods_num, pay_type, send_fee,sp);
		return i;
	}

	public List<OrderCustom> getLoading(int rows, int page, String custom_name,
			String send_station, String zhuangxie_date, String aa,
			String write_off4, String send_time, String bb,
			String receipt_time, String cc, String car_number,
			String driver_name) {
		List<OrderCustom> list =payable_feeDAO.getLoading(rows, page, custom_name, send_station, zhuangxie_date, aa, write_off4, send_time, bb, receipt_time, cc, car_number, driver_name);
		return list;
	}

	public int getLoadingInfo(String custom_name, String send_station,
			String zhuangxie_date, String aa, String write_off4,
			String send_time, String bb, String receipt_time, String cc,
			String car_number, String driver_name) {
		int i = payable_feeDAO.getLoadingInfo(custom_name, send_station, zhuangxie_date, aa, write_off4, send_time, bb, receipt_time, cc, car_number, driver_name);
		return i;
	}

	public int feijiazhen(String shiping_order_id, String write_off2,
			String other_date, String people_other, String other_remarks1) {
		int i = payable_feeDAO.feijiazhen(shiping_order_id, write_off2, other_date, people_other,other_remarks1);
		return i;
	}

	public List<ShippingOrder> getPayableOutpa() {
		
		return payable_feeDAO.getPayableOutpa();
	}

	public List<ShippingOrder> getDiliveryleOutpa() {
		// TODO Auto-generated method stub
		return payable_feeDAO.getDiliveryleOutpa();
	}
   //勾选导出
	public List<ShippingOrder> exportCost(String[] checkarray) {
		// TODO Auto-generated method stub
		return payable_feeDAO.exportCost(checkarray);
	}

	public List<ShippingOrder> getGouXuanOutpa(String[] id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getGouXuanOutpa(id);
	}

	public List<ShippingOrder> getPayableCheckd(int rows, int page,
			String shiping_order_num, String receipt, String fee_date,
			String dd, String create_time, String yy, String write_off,
			String send_station, String goods_name, String goods_num,
			String pay_type, String paid, String company_name) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getPayableCheckd(rows, page, shiping_order_num, receipt, fee_date, dd, create_time, yy, write_off, send_station, goods_name, goods_num, pay_type, paid, company_name);
	}

	public int getPayableCheckdCount(String shiping_order_num, String receipt,
			String fee_date, String dd, String create_time, String yy,
			String write_off, String send_station, String goods_name,
			String goods_num, String pay_type, String paid, String company_name) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getPayableCheckdCount(shiping_order_num, receipt, fee_date, dd, create_time, yy, write_off, send_station, goods_name, goods_num, pay_type, paid, company_name);
	}

	public List<ShippingOrder> getShippingChecked(int rows, int page, String id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getShippingChecked(rows, page, id);
	}

	public int getShippingCheckedCount(String id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getShippingCheckedCount(id);
	}

	public int setShippingChedked(String[] id, String arraign_name,
			String arraign_department, String arraign_remarks) {
		// TODO Auto-generated method stub
		return payable_feeDAO.setShippingChedked(id, arraign_name, arraign_department, arraign_remarks);
	}

	public ShippingOrder getShippingXheck(String id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getShippingXheck(id);
	}

	public List<ShippingOrder> getShippingOrder(String[] id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.getShippingOrder(id);
	}

	public int UpdatePayableCheck(String name,String id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.UpdatePayableCheck(name,id);
	}

	public int UpdatePayaleCompany(String[] id, String practice_change_fee,
			String should_change_fee, String chenge_remarks) {
		// TODO Auto-generated method stub
		return payable_feeDAO.UpdatePayaleCompany(id, practice_change_fee, should_change_fee, chenge_remarks);
	}

	public int UpdatePayableReject(String name,String id) {
		// TODO Auto-generated method stub
		return payable_feeDAO.UpdatePayableReject(name,id);
	}

	public int update1(String shiping_order_id, String write_off,
			String fee_date, String people_zhong, String Fee_remarks,
			String change_bank, String change_card, String change) {
		// TODO Auto-generated method stub
		return payable_feeDAO.update1(shiping_order_id, write_off, fee_date, people_zhong, Fee_remarks, change_bank, change_card, change);
	}



}
