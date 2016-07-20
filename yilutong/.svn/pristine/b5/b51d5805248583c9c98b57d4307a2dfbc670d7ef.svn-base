package com.jy.service;

import java.util.List;

import com.jy.model.Customer;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.RemarkType;

public interface RemarkMapService {
	
	public List<RemarkType> getTypes();
	public List<RemarkRange> getRange();
	public boolean checkName(String name);
	public boolean addRemark(Customer remark);
	public List<Remark> getRemarkName(String name,String state);
	public Customer getRemark(String id);
	public List<Customer> getRemarks(Integer page,Integer rows,String remark_name,String remark_tel,String remark_address,String customer_grade,String costomersid);
	public int getCount(String remark_name,String remark_tel,String remark_address,String customer_grade,String costomersid);
	public String getModifyPeople(Integer people);
	public String getOneRange(String id);
	public boolean updateRemark(Customer remark);
	public boolean deleteRemark(String id);
	public boolean checkRemark(String id);
	public int getcustomer_num(String id,String name);
	int getcustomer_name(String name);
	public int saveCustomer(Customer customer);
	public int updateCustomer(Customer customer);
	public Customer getCustomerbyid(String cid);
	public int updateCustomerUser(String id,String customid);
	public int deleCustomerUser(String id,String customid);
}
