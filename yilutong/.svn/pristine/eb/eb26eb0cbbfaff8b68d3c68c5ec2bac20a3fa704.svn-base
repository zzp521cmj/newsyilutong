package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.common.UUIDUtils;
import com.jy.dao.IncomeDao;
import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.service.IncomeInfoService;


@Service("IncomeInfoService")

public class IncomeInfoServiceImpl  implements IncomeInfoService{
	@Resource
	private IncomeDao idao;
	//查询分页

	public List<Income> getIncomeInfo(int rows, int page,
			String name, String phone_number, String type,String start_date,String end_date) {
		 List<Income> list=idao.getIncomeInfo(rows, page, name,  phone_number,type,start_date,end_date);
		return list;
	}

	public int getIncome(String name, String phone_number,
			String type,String start_date,String end_date) {
		int count=idao.getIncome(name, phone_number, type,start_date,end_date);
		return count;
	}

	public int deleteIncome(String[] del) {
		int i=idao.deleteIncome(del);
		return i;
	}
	
	public int saveIncome(Income d) {
		int i=idao.saveIncome(d);
		return i;
	}

	public Income getUpdateIncome(String id) {
		Income sp=idao.getUpdateIncome(id);
		return sp;
	}

	public int updateIncome(Income d) {
		int i=idao.updateIncome(d);
		return i;
	}

	public List<Income> getIncomeAll(String name,
			String phone_number, String type,String start_date,String end_date) {
		List<Income> list=idao.getIncomeAll(name, phone_number, type,start_date,end_date);
		return list;
	}
	/**
	 * 制作协议订单的查询
	 */
	public List<ShippingOrder> getShipOrderCAM(int rows, int page, String[] pid) {
		 List<ShippingOrder>list=idao.getShipOrderCAM(rows,page,pid);
		return list;
	}
	/**
	 * 导入
	 * @param tlist
	 * @return
	 */
	public int saveIncomes(List<Income> tlist) {
		// TODO Auto-generated method stub
		
		int i=idao.saveIncomes(tlist);
		return i;
	}
	//查询总汇表车牌信息
	public  List<Income> getPlateNumber(String id) {
		List<Income>	list=idao.getPlateNumber(id);
		return list;
	}

	public int getShipOrderMake(String id) {
		int i=idao.getShipOrderMake(id);
		return i;
	}

	public List<ShippingOrder> getShipOrderInfoMake(int rows, int page,String id) {
	 List<ShippingOrder> list=idao.getShipOrderInfoMake(rows, page,id);
		return list;
	}
	public ShippingOrder getUpdateShipOrder(String id){
		ShippingOrder d=idao.getUpdateShipOrder(id);
		return d;
	}
	//修改订单值改变
	public int updateStatemake(String id) {
		int i=idao.updateStatemake(id);
		return i;
	}
	//查询总汇表车牌信息
	public List<Income> IncemCarid(String id) {
		List<Income> list=idao.IncemCarid(id);
		return list;
	}
	//删除总汇表修改订单状态
	public int updateStateship(String[] che) {
		int i =idao.updateStateship(che);
		return i;
	}
}
