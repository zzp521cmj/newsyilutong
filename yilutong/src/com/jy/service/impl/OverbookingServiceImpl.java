package com.jy.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.OverbookingDao;
import com.jy.dao.ShippingOrderDao;
import com.jy.model.Claim_settlement;
import com.jy.model.Customer;
import com.jy.model.Overbooking;
import com.jy.model.User;
import com.jy.service.OverbookingService;

@Service("OverbookingService")
public class OverbookingServiceImpl implements OverbookingService {

	@Resource
	private OverbookingDao odo;

	public int getShipCheckInfoConun(String shiping_order_num,
			String shiping_accept_static, String custom_name, String receipt,
			User user) {
		int count = 0;
		if (user.getFlag().equals("0")) {// 其他
			count = odo.adminGetShipCheckInfoConun(shiping_order_num,
					shiping_accept_static, custom_name, receipt);
		} else if (user.getFlag().equals("1")) {// 司机

		} else if (user.getFlag().equals("2")) {// 客户
			count = odo.getShipCheckInfoConun(shiping_order_num,
					shiping_accept_static, custom_name, receipt, user.getCostomersid());
     
		}

		return count;
	}

	public List<Overbooking> getShipCheckInfo(int rows, int page,
			String shiping_order_num, String shiping_accept_static,
			String custom_name, String receipt, User user) {
		List<Overbooking> list = new ArrayList<Overbooking>();
		if (user.getFlag().equals("0")) {// 其他
			list = odo.adminGetShipCheckInfo(rows, page, shiping_order_num,
					shiping_accept_static, custom_name, receipt);

		} else if (user.getFlag().equals("1")) {// 司机

		} else if (user.getFlag().equals("2")) {// 客户
			list = odo.getShipCheckInfo(rows, page, shiping_order_num,
					shiping_accept_static, custom_name, receipt, user.getCostomersid());

		}

		return list;
	}

	public int insertInfo(Overbooking overbooking) {
		int count = odo.insertInfo(overbooking);
		return count;
	}

	public Overbooking updateId(String id) {
		Overbooking og = odo.updateId(id);
		return og;
	}

	public int getupdate(Overbooking shiping_orders_id) {
		int count = odo.getupdate(shiping_orders_id);
		return count;
	}

	public int deleteTravel(String[] del) {
		int count = odo.deleteTravel(del);
		return count;
	}

	public int updateunqualified(String[] shiping_orders_id) {
		int count = odo.updateunqualified(shiping_orders_id);
		return count;
	}

	public List<Customer> inquireName(String custom_name) {
		List<Customer> list = odo.inquireName(custom_name);
		return list;
	}

	public int countersign(String[] shiping_orders_id) {
		int count = odo.countersign(shiping_orders_id);
		return count;
	}

	public List<Overbooking> inquireName1(String custom_name) {
		List<Overbooking> list = odo.inquireName1(custom_name);
		return list;
	}

	public int getNumber(String shiping_order_num) {
		int ok = odo.getNumber(shiping_order_num);
		return ok;
	}

	public String xdselect() {
		String sg = odo.xdselect();
		return sg;
	}

	public List<Overbooking> appGetOverBooking(int row, int length,
			String custom_id) {
		return odo.appGetOverBooking(row, length, custom_id);
	}

}
