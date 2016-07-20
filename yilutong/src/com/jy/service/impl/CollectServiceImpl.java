package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.jy.dao.CollectDAO;
import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.OrderCustom;
import com.jy.model.Settlement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.CollectService;
@Component
public class CollectServiceImpl implements CollectService {
	@Resource
	private CollectDAO collectDAO;
	
	
	public List<ShippingOrder> getCollect(int rows, int page,
			String custom_name, String car_time,String kuhu_date,String kuhu_dates,String write_off3,String send_time,String send_times,String receipt_time,String receipt_times,String car_number,String driver_name) {
	List<ShippingOrder> list =collectDAO.getCollect(rows, page, custom_name, car_time, kuhu_date,kuhu_dates, write_off3, send_time,send_times, receipt_time,receipt_times, car_number, driver_name);
		return list;
	}

	public int getCollectInfo(String custom_name, String car_time,String kuhu_date,String kuhu_dates,String write_off3,String send_time, String send_times,String receipt_time,String receipt_times,String car_number,String driver_name) {
		int i = collectDAO.getCollectInfo(custom_name, car_time, kuhu_date,kuhu_dates, write_off3, send_time,send_times, receipt_time,receipt_times, car_number, driver_name);
		return i;
	}

	public int updateShippingOrder(OrderCustom d) {
		int i =collectDAO.updateShippingOrder(d);
		return i;
	}

	public OrderCustom getUpdateShippingOrder(String id) {
		OrderCustom os = collectDAO.getUpdateShippingOrder(id);
		return os;
	}



	public OrderCustom getupdate3(String id) {
		OrderCustom oc = collectDAO.getupdate3(id);
		return oc;
	}

	public List<ShippingOrder> getAdorn_fee(int rows, int page,
			String shiping_order_num, String send_station,String others_date,String aa,String write_off5,String custom_name,String receipt,String goods_name,String goods_num,String pay_type,String paid) {
		List<ShippingOrder> list =collectDAO.getAdorn_fee(rows, page, shiping_order_num, send_station,others_date, aa, write_off5, custom_name, receipt, goods_name, goods_num, pay_type, paid);
		return list;
	}

	public int getAdorn_feeInfo(String shiping_order_num, String send_station,String others_date,String aa,String write_off5,String custom_name,String receipt,String goods_name,String goods_num,String pay_type,String paid) {
		 int i = collectDAO.getAdorn_feeInfo(shiping_order_num, send_station,others_date, aa, write_off5, custom_name, receipt, goods_name, goods_num, pay_type, paid);
		return i;
	}

	public int update2(@Param("array") String   d ) {
		 int i = collectDAO.update2(d);
		return i;
	}

	public ShippingOrder getUpdate2(String id) {
		ShippingOrder so = collectDAO.getUpdate2(id);
		return so;
	}


	


	public int update9(String shiping_order_id, String write_off5
			,String others_date,
			String people_others,String Write_remarks) {
		int i = collectDAO.update9(shiping_order_id, write_off5,others_date,people_others,Write_remarks);
		return i;
	}

	public List<ShippingOrder> selectinfo(String[] s) {
	    List<ShippingOrder>  list = collectDAO.selectinfo(s);
		return list;
	}

	public int insertinfo(List<Confluence> list) {
		int i = collectDAO.insertinfo(list);
		return i;
	}

	public List<ShippingOrder> select(String[] s) {
		List<ShippingOrder> list = collectDAO.select(s);
		return list;
	}

	public int add(List<Mingxi> list) {
		int i = collectDAO.add(list);
		return i;
	}

	public int otherUpdate(ShippingOrder d) {
		int i = collectDAO.otherUpdate(d);
		return i;
	}

	
	

	



	public List<ShippingOrder> selectIn(String id) {
		
		return null;
	}

	public int editOther(String shiping_order_id, String write_off5,String others_date,String people_others) {
		int i = collectDAO.editOther(shiping_order_id, write_off5, others_date, people_others);
		return i;
	}

	public int delMingxi(String[] del) {
		int i = collectDAO.delMingxi(del);
		return i;
	}

	public int delConf(String[] del) {
		int i = collectDAO.delConf(del);
		return i;
	}


	public int editKuhu(String custom_id, String write_off3,String kuhu_date,String people_kehu) {
		int i = collectDAO.editKuhu(custom_id, write_off3, kuhu_date, people_kehu);
		return i;
	}

	public List<User> selectfo(User u) {
		List<User> list = collectDAO.selectfo(u);
		return list;
	}

	public int addSettlement(List<Settlement> list) {
		int i = collectDAO.addSettlement(list);
		return i;
	}

	public List<Settlement> selectSettement(
			String shiping_order_num) {
		List<Settlement> list = collectDAO.selectSettement( shiping_order_num);
		return list;
	}

	public int selectSettementInfo(String shiping_order_num) {
		int i = collectDAO.selectSettementInfo(shiping_order_num);
		return i;
	}

	public List<ShippingOrder> selectIn(String[] c) {
		// TODO Auto-generated method stub
		return null;
	}

	public int sss(String[] del) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	public int editWrite(String shiping_order_id,String write_id) {
		int i = collectDAO.editWrite(shiping_order_id,write_id);
		return i;
	}

	public int Del(String[] del) {
		int i = collectDAO.Del(del);
		return i;
	}

	public int sp(String[] del) {
		int i = collectDAO.sp(del);
		return i;
	}

	public List<ShippingOrder> getCheckCollect(int rows, int page,
			String custom_name, String car_time, String kuhu_date,
			String kuhu_dates, String write_off3, String send_time,
			String divlabel, String receipt_time, String receipt_times,
			String car_number, String driver_name) {
		// TODO Auto-generated method stub
		return collectDAO.getCheckCollect(rows, page, custom_name, car_time, kuhu_date, kuhu_dates, write_off3, send_time, divlabel, receipt_time, receipt_times, car_number, driver_name);
	}

	public int getCheckCollectCount(String custom_name, String car_time,
			String kuhu_date, String kuhu_dates, String write_off3,
			String send_time, String divlabel, String receipt_time,
			String receipt_times, String car_number, String driver_name) {
		// TODO Auto-generated method stub
		return collectDAO.getCheckCollectCount(custom_name, car_time, kuhu_date, kuhu_dates, write_off3, send_time, divlabel, receipt_time, receipt_times, car_number, driver_name);
	}

	public List<User> getuser(String username) {
		// TODO Auto-generated method stub
		return collectDAO.getuser(username);
	}

	public int updateCheckCollect(String[] id, String close_recheck_name,
			String close_recheck_remarks,String paid_fee,String transport_pay,String trade_agency) {
		// TODO Auto-generated method stub
		return collectDAO.updateCheckCollect(id, close_recheck_name, close_recheck_remarks, paid_fee, transport_pay, trade_agency);
	}

	public List<ShippingOrder> getCustomShiping(String[] id) {
		// TODO Auto-generated method stub
		return collectDAO.getCustomShiping(id);
	}

	public int insertCostShiping(List<ShippingOrder> order) {
		// TODO Auto-generated method stub
		return collectDAO.insertCostShiping(order);
	}

	public int getShippingCount(String name, String phone_number, String type,
			String start_date, String end_date, String pid, String phone,
			String order_state, String pay_type, String send_address) {
		// TODO Auto-generated method stub
		return collectDAO.getShippingCount(name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address);
	}

	public List<ShippingOrder> getShippingCollect(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date, String pid, String phone, String order_state,
			String pay_type, String send_address) {
		// TODO Auto-generated method stub
		return collectDAO.getShippingCollect(rows, page, name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address);
	}

	public int delectCollShi(ShippingOrder shiid, String[] id) {
		return collectDAO.delectCollShi(shiid, id);
	}

	public int updateCollWori(String custom_id, String write_off,
			String remarks_fee1, String kuhu_date, String People_kehu,
			String close_recheck_state) {
		// TODO Auto-generated method stub
		return collectDAO.updateCollWori(custom_id, write_off, remarks_fee1, kuhu_date, People_kehu, close_recheck_state);
	}

	public ShippingOrder getshipinCollect(String id) {
		// TODO Auto-generated method stub
		return collectDAO.getshipinCollect(id);
	}

	public int updateShippiOrCo(ShippingOrder id) {
		// TODO Auto-generated method stub
		return collectDAO.updateShippiOrCo(id);
	}

	public int rejectShipingorder(String id) {
		// TODO Auto-generated method stub
		return collectDAO.rejectShipingorder(id);
	}

	public int updateCori(String custom_id, String write_off,
			String remarks_fee1, String kuhu_date, String People_kehu,
			String close_recheck_state) {
		// TODO Auto-generated method stub
		return collectDAO.updateCollWori(custom_id, write_off, remarks_fee1, kuhu_date, People_kehu, close_recheck_state);
	}

	public int getEreArraignedCustoms(String[] pid, String trial_remarks,
			String did, String trial_name) {
		// TODO Auto-generated method stub
		return collectDAO.getEreArraignedCustoms(pid, trial_remarks, did, trial_name);
	}

	public int UpdateShipingorder(String id) {
		// TODO Auto-generated method stub
		return collectDAO.UpdateShipingorder(id);
	}

	public int update3(String[] custom_id, String write_off, String remarks_fee1,
			String kuhu_date, String People_kehu, String close_recheck_state,
			String customs_sige_name, String customs_card, String customs_bank) {
		// TODO Auto-generated method stub
		return collectDAO.update3(custom_id, write_off, remarks_fee1, kuhu_date, People_kehu, close_recheck_state, customs_sige_name, customs_card, customs_bank);
	}



	
	
	

	

	

}
