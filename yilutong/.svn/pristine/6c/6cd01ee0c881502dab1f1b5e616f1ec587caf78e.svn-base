package com.jy.dao;

import java.util.List;

import com.jy.model.Warehouse;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.RemarkType;


public interface WarehouseDao {
	List<RemarkType> getTypes();
	List<RemarkRange> getRange();
	int checkName(String name);
	int addRemark(Warehouse remark);
	Warehouse getRemark(String id);
	List<Remark> getRemarkName(String name,String state);
	List<Warehouse> getRemarks(Integer page,Integer rows,String remark_name,String remark_tel,String remark_address);
	int getCount(String remark_name,String remark_tel,String remark_address);
	String getModifyPeople(Integer people);
	String getOneRange(String id);
	int updateRemark(Warehouse remark);
	int deleteRemark(String id);
	int checkRemark(String id);
}
