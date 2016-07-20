package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.RemarkMapDao;
import com.jy.model.Customer;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.RemarkType;
import com.jy.model.User;
import com.jy.service.RemarkMapService;
@Component
public class RemarkMapServiceImpl implements RemarkMapService {
	@Resource
	private RemarkMapDao rmdao;
	public List<RemarkType> getTypes() {
		return rmdao.getTypes();
	}
	public List<RemarkRange> getRange() {
		return rmdao.getRange();
	}
	public boolean checkName(String name) {
		int i = rmdao.checkName(name);
		if(i>0)
			return true;
			else
			return false;
	}
	public boolean addRemark(Customer remark) {
		int i = rmdao.addRemark(remark);
		if(i>0)
			return true;
			else
			return false;
	}
	public List<Remark> getRemarkName(String name,String state) {
		
		return rmdao.getRemarkName(name,state);
	}
	public List<Customer> getRemarks(Integer page, Integer rows,String remark_name,String remark_tel,String remark_address,String customer_grade,String costomersid) {
		/*System.out.println(page);
		System.out.println(rows);
		System.out.println(remark_name);
		System.out.println(remark_tel);
		System.out.println(remark_address);
		System.out.println(remark_department);*/
		return rmdao.getRemarks(page,rows,remark_name,remark_tel,remark_address,customer_grade,costomersid);
	}
	public int getCount(String remark_name,String remark_tel,String remark_address,String customer_grade,String costomersid) {
		
		return rmdao.getCount(remark_name,remark_tel,remark_address,customer_grade,costomersid);
	}
	public String getModifyPeople(Integer people) {
		return rmdao.getModifyPeople(people);
	}
	public Customer getRemark(String id) {
		return rmdao.getRemark(id);
	}
	public String getOneRange(String id) {
		return rmdao.getOneRange(id);
	}
	public boolean updateRemark(Customer remark) {
		int i = rmdao.updateRemark(remark);
		if(i>0)
			return true;
			else
			return false;
	}
	public boolean deleteRemark(String id) {
		int i = rmdao.deleteRemark(id);
		if(i>0)
			return true;
			else
			return false;
	}
	public boolean checkRemark(String id) {
		int i = rmdao.checkRemark(id);
		if(i>0)
			return true;
			else
			return false;
	}
	public int getcustomer_num(String id,String name) {
		return rmdao.getcustomer_num(id,name);
	}
	public int saveCustomer(Customer customer) {
		customer.setCustomer_id(UUIDUtils.getUUID());
		return rmdao.saveCustomer(customer);
	}
	public Customer getCustomerbyid(String cid) {
		return rmdao.getCustomerbyid(cid);
	}
	public int updateCustomer(Customer customer) {
		return rmdao.updateCustomer(customer);
	}
	public int updateCustomerUser(String id, String customid) {	
		return rmdao.updateCustomerUser(id, customid);
	}
	public int deleCustomerUser(String id, String customid) {		
		return rmdao.deleCustomerUser(id, customid);
	}
	public int getcustomer_name(String name) {
		// TODO Auto-generated method stub
		return rmdao.getcustomer_name(name);
	}

}
