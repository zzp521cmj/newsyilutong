package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.jy.dao.DetailedDAO;
import com.jy.model.Detailed;
import com.jy.model.ShippingOrder;
import com.jy.service.DetailedService;
@Component
public class DetailedServiceImpl implements DetailedService {
	@Resource
		private DetailedDAO detailedDAO;

	public List<Detailed> getDetailed(int rows, int page, String shiping_order_num,String change_fee,
			String land_total) {
		List<Detailed> list = detailedDAO.getDetailed(rows, page, shiping_order_num,change_fee, land_total);
		return list;
	}

	public int getDetailedInfo(String change_fee, String shiping_order_num,String land_total) {
	int i = detailedDAO.getDetailedInfo(change_fee,shiping_order_num, land_total);
		return i;
	}

	public int deleteDetailed(String[] del) {
		int i = detailedDAO.deleteDetailed(del);
		return i;
	}

	public int addDetailed(Detailed d) {
		int i = detailedDAO.addDetailed(d);
		return i;
	}

	public List<ShippingOrder> getShippingOrder(int rows, int page,
			String shiping_order_num) {
		List<ShippingOrder> list =detailedDAO.getShippingOrder(rows, page, shiping_order_num);
		return list;
	}

	public int getShippingOrderInfo(String shiping_order_num) {
		int i = detailedDAO.getShippingOrderInfo(shiping_order_num);
		return i;
	}

	public ShippingOrder getUpdateShipOrder(String id) {
		ShippingOrder so =detailedDAO.getUpdateShipOrder(id);
		return so;
	}

	public int updateShipOrder(String id) {
		int i = detailedDAO.updateShipOrder(id);
		return 0;
	}

	public int updateStateship(String[] che) {
		int i = detailedDAO.updateStateship(che);
		return i;
	}

	public ShippingOrder getUpdateDetailed(String id) {
		ShippingOrder dt =detailedDAO.getUpdateDetailed(id);
		return dt;
	}

	public int updateDetailed(Detailed d) {
		int i = detailedDAO.updateDetailed(d);
		return i;
	}

	public int searchOrder(String ids) {
		int i =detailedDAO.searchOrder(ids);
		return i;
	}

	


	

}
