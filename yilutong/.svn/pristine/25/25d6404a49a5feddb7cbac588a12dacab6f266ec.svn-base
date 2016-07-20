package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.CompanyDao;
import com.jy.dao.Write_offDAO;
import com.jy.model.ChangeOrder;
import com.jy.model.ShippingOrder;
import com.jy.service.Write_offService;
@Component
public class Write_offServiceImpl implements Write_offService {

	@Resource
	private  Write_offDAO wirte_offDAO;
	
	public List<ShippingOrder> getChangeOrderInfo(int rows,int page,String shiping_order_num,String updatetime,String check_time) {
		List<ShippingOrder> list = wirte_offDAO.getChangeOrderInfo(rows, page, shiping_order_num, check_time, updatetime);
		return list;
	}

	public int getChangeOrder(String shiping_order_num,String updatetime,String check_time) {
		int i = wirte_offDAO.getChangeOrder(shiping_order_num, updatetime, check_time);
		return i;
	}

	public ShippingOrder getUpdateShippingOrder(String id) {
		ShippingOrder  so =wirte_offDAO.getUpdateShippingOrder(id);
		return so;
	}

	public int updateShippingOrder(ShippingOrder d) {
	int i = wirte_offDAO.updateShippingOrder(d);
		return i;
	}


}
