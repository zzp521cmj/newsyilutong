package com.jy.dao;

import java.util.List;

import com.jy.model.Customer;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.RemarkType;


public interface RemarkMapDao {
	List<RemarkType> getTypes();
	List<RemarkRange> getRange();
	int checkName(String name);
	int addRemark(Customer remark);
	Customer getRemark(String id);
	List<Remark> getRemarkName(String name,String state);
	List<Customer> getRemarks(Integer page,Integer rows,String remark_name,String remark_tel,String remark_address,String customer_grade,String costomersid);
	int getCount(String remark_name,String remark_tel,String remark_address,String customer_grade,String costomersid);
	String getModifyPeople(Integer people);
	String getOneRange(String id);
	int updateRemark(Customer remark);
	int deleteRemark(String id);
	int checkRemark(String id);
	int getcustomer_num(String id,String name);
	int getcustomer_name(String name);
	int saveCustomer(Customer customer);
	int updateCustomer(Customer customer);
	Customer getCustomerbyid(String cid);
	int updateCustomerUser(String id,String customid);
	int deleCustomerUser(String id,String customid);
}
