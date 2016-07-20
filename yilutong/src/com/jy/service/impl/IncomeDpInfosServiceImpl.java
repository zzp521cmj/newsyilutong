package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.jy.common.UUIDUtils;
import com.jy.dao.IncomeDpDao;
import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.service.IncomeDpInfoService;
@Component
public class IncomeDpInfosServiceImpl implements IncomeDpInfoService {
	@Resource
	private IncomeDpDao  incomeDAO;
	
	
	//查询分页
	public List<Income> getIncomeInfo(int rows,int page,String  receipt,String goods_name,String start_address,String car_number) {
		List<Income>  list = incomeDAO.getIncomeInfo(rows, page, receipt, goods_name, start_address, car_number);
		return list;
	}

	public int getIncome(String  receipt,String goods_name,String start_address,String car_number) {
		int count=incomeDAO.getIncome(receipt, goods_name, start_address, car_number);
		return count;
	}

	public int deleteIncome(String[] del) {
		int i=incomeDAO.deleteIncome(del);
		return i;
	}

	public int saveIncome(Income d) {
		int i=incomeDAO.saveIncome(d);
		return i;
	}

	public Income getUpdateIncome(String id) {
		Income sp=incomeDAO.getUpdateIncome(id);
		return sp;
	}

	public int updateIncome(Income d) {
		int i=incomeDAO.updateIncome(d);
		return i;
	}

	public List<Income> getPlateNumberLength(String number) {
		List<Income> list=incomeDAO.getPlateNumberLength(number);
		return list;
	}

	public Income getNumber(String number) {
		Income der=incomeDAO.getNumber(number);
		return der;
	}

	

	public int delIncome(String[] del) {
		int i=incomeDAO.delIncome(del);
		return i;
	}

	public List<Income> getIncomeList(int rows, int page,
			String receipt, String goods_name, String start_address,
			String car_number) {
		List<Income> list=incomeDAO.getIncomeList(rows, page, receipt, goods_name, start_address, car_number);
		return list;
	}

	public int getIncomecount(String  receipt,String goods_name,String start_address,String car_number) {
				int count=incomeDAO.getIncomecount1(receipt, goods_name, start_address, car_number);
				return count;
	}

	public List<Income> getIncome1(int rows, int page,
			String receipt, String goods_name, String start_address,
			String car_number) {
		List<Income> count=incomeDAO.getIncome1(rows, page, receipt, goods_name, start_address, car_number);
		return count;
	}

	public int getIncomecount1(String  receipt,String goods_name,String start_address,String car_number) {
		int count=incomeDAO.getIncomecount(receipt, goods_name, start_address, car_number);
		return count;
	}

	public int saveIncome(Sign_order sign_order) {
		int count=0;
		try {
			String sid=UUIDUtils.getUUID();
			count=incomeDAO.saveIncome(sign_order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updatestate(String tatal_id) {
		// TODO Auto-generated method stub
		int count=0;
		try {
			count=incomeDAO.updatestate(tatal_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int getIncomeCA(String  receipt,String goods_name,String start_address,String car_number) {
		int i=incomeDAO.getIncomeCA(receipt, goods_name, start_address, car_number);
		return i;
	}

	public List<Income> getIncomeCA(int rows, int page,
			String receipt, String goods_name, String start_address,
			String car_number) {
		List<Income> list=incomeDAO.getIncomeCA(rows, page,receipt, goods_name, start_address, car_number);
		return list;
	}

	public List<Income> getIncomeCAM(int rows, int page, String[] pid) {
		 List<Income>list=incomeDAO.getIncomeCAM(rows, page, pid);
			return list;
	}	
	
	 public int saveIncome2(List<Income> tlist){
		 
		 int i=incomeDAO.saveIncome(tlist);
			return i;
	 }
	/**
	 * 图片路径上传
	 */

	public int saveIncome(String uuid, String order_id, String paths) {
		int i=incomeDAO.saveIncome(uuid, order_id, paths);
		return i;
	}
	/**
	 * 获取司机的订单
	 */
	public List<Income> getCarIncome(String car_number) {
		List<Income> der=incomeDAO.getCarIncome(car_number);
		return der;
	}



	public int updateStateship(String[] che) {
		int i =incomeDAO.updateStateship(che);
		return i;
	}

	public ShippingOrder getUpdateShipOrder(String id) {
		ShippingOrder d=incomeDAO.getUpdateShipOrder(id);
		return d;
	}

	public List<Income> getIncomeList(String rows, String page, String receipt,
			String goods_name, String start_address, String car_number) {
				
		return null;
	}

	public List<Income> IncemCarid(String id) {
		List<Income> list=incomeDAO.IncemCarid(id);
		return list;
	}

	public List<Income> getPlateNumber(String id) {
		List<Income>	list=incomeDAO.getPlateNumber(id);
		return list;
	}

	public List<Income> getIncomeAll(String name, String phone_number,
			String type, String start_date, String end_date) {
		// TODO Auto-generated method stub
		List<Income> list=incomeDAO.getIncomeAll(name, phone_number, type,start_date,end_date);
		return list;
	}

	public List<ShippingOrder> getShipOrderInfoMake(int rows, int page,
			String id) {
		 List<ShippingOrder> list=incomeDAO.getShipOrderInfoMake(rows, page,id);
			return list;
	}

	public int getShipOrderMake(String id) {
		int i=incomeDAO.getShipOrderMake(id);
		return i;
	}

	public int updateStatemake(String id) {
		int i=incomeDAO.updateStatemake(id);
		return i;
	}
	}

