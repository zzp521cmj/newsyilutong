package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.DriverCloseDao;
import com.jy.model.ShippingOrder;
import com.jy.service.DriverCloseService;
@Controller
public class DriverCloseServiceImpl implements DriverCloseService {
@Resource 
private DriverCloseDao dcd;

public List<ShippingOrder> getDriverCloseRejectInfo(int rows, int page,String shiping_order_num,String receipt,String fee_date,String fee_datetime , String create_time,String create_date,String write_off,String send_station ,String goods_name,String goods_num,String pay_type,String driver_name) {
	// TODO Auto-generated method stub
	return dcd.getDriverCloseRejectInfo(rows, page, shiping_order_num, receipt, fee_date, fee_datetime, create_time, create_date, write_off, send_station, goods_name, goods_num, pay_type, driver_name);
}

public int getDriverCloseRejectCoun(String shiping_order_num,String receipt,String fee_date,String fee_datetime , String create_time,String create_date,String write_off,String send_station ,String goods_name,String goods_num,String pay_type,String driver_name) {
	// TODO Auto-generated method stub
	return dcd.getDriverCloseRejectCoun(shiping_order_num, receipt, fee_date, fee_datetime, create_time, create_date, write_off, send_station, goods_name, goods_num, pay_type, driver_name);
}

public int UpdeteClose(ShippingOrder sd) {
	// TODO Auto-generated method stub
	return dcd.UpdeteClose(sd);
}


public int getArraignedDriverClose(String[] pid, String trial_remarks,String did, String trial_name) {
	// TODO Auto-generated method stub
	return dcd.getArraignedDriverClose(pid, trial_remarks, did, trial_name);
}

public List<ShippingOrder> getDriverChecked(int page,int rows,String driver_name,String car_number,String kuhu_date,String kuhu_dates,String create_time,String create_date) {
	// TODO Auto-generated method stub
	return dcd.getDriverChecked(page, rows, driver_name, car_number, kuhu_date, kuhu_dates, create_time, create_date);
}

public int getDriverCheckedCount(String driver_name,String car_number,String kuhu_date,String kuhu_dates,String create_time,String create_date) {
	// TODO Auto-generated method stub
	return dcd.getDriverCheckedCount(driver_name, car_number, kuhu_date, kuhu_dates, create_time, create_date);
}

public List<ShippingOrder> getDriverShipping(int page, int rows, String did) {
	// TODO Auto-generated method stub
	return dcd.getDriverShipping(page, rows, did);
}

public int getDriverShippingCount(String did) {
	// TODO Auto-generated method stub
	return dcd.getDriverShippingCount(did);
}

public ShippingOrder getShippingDriver(String id) {
	// TODO Auto-generated method stub
	return dcd.getShippingDriver(id);
}

public List<ShippingOrder> getDriverCheckedShipp(String id) {
	// TODO Auto-generated method stub
	return dcd.getDriverCheckedShipp(id);
}

public int UpdateCheckedShipp(String name, String sid,String close_recheck_remarks) {
	// TODO Auto-generated method stub
	return dcd.UpdateCheckedShipp(name, sid, close_recheck_remarks);
}

public int UpdateCheckedReject(String name, String sid,String close_recheck_remarks) {
	// TODO Auto-generated method stub
	return dcd.UpdateCheckedReject(name, sid, close_recheck_remarks);
}

public int insertDriverClose(List<ShippingOrder> so) {
	// TODO Auto-generated method stub
	return dcd.insertDriverClose(so);
}

public int UdateDriverClose(String settlement_modes, String fee_remarks,
		String driver_close_naem, String driv_sige_name, String driv_card,
		String driv_bank, String oil_card, String oil_card_name, String[] id) {
	// TODO Auto-generated method stub
	return dcd.UdateDriverClose(settlement_modes, fee_remarks, driver_close_naem, driv_sige_name, driv_card, driv_bank, oil_card, oil_card_name, id);
}

}
