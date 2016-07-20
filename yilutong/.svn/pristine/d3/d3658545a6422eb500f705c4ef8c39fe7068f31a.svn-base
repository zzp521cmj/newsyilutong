package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.CoustomBaobDao;
import com.jy.model.ShippingOrder;
import com.jy.service.CoustomBaobInfoService;


@Service("CoustomBaobInfoService")

public class CoustomBaobInfoServiceImpl  implements  CoustomBaobInfoService{
	@Resource
	private CoustomBaobDao so_dao;
	//查询分页

	public int getCoustomBaob(String ddId, String city1,
			String start_date, String end_date,
			String start_date1, String end_date1, String pay_type, String fhname) {

		return so_dao.getCoustomBaob(ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname);
	}

	public List<ShippingOrder> getCoustomBaobInfo(int rows, int page,
			String ddId, String city1,
			String start_date, String end_date,
			String start_date1, String end_date1, String pay_type, String fhname) {
		return so_dao.getCoustomBaobInfo(rows, page, ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname);
	}

	public List<ShippingOrder> getOrderInfoD(String statrt ,String end,String name) {		
		return so_dao.getOrderInfoD(statrt, end, name);
	}
	public  List<ShippingOrder> getOrderInfoM(String statrt ,String end,String name) {
		return so_dao.getOrderInfoM(statrt, end, name);
		}

	public List<ShippingOrder> outCoustomBaob(String ddId, String city1,String start_date, String end_date,
			String start_date1, String end_date1, String pay_type, String fhname,String []checkarray) {
		return so_dao.outCoustomBaob(ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname,checkarray);
	}

	public int  outShi(String checkarray) {
		return so_dao.outShi(checkarray);
	}

	public List<ShippingOrder> getOrderInfoY(String statrt ,String end,String name) {
		return so_dao.getOrderInfoY(statrt, end, name);
	}

	public int addDelivery(String censusid, String nums, String censustimes	 ) {
		return so_dao.addDelivery(censusid, nums, censustimes);
	}

	public List<ShippingOrder> getOrderInfoT(String statrt, String end,
			String name) {
		return so_dao.getOrderInfoT(statrt, end, name);
	}
}
