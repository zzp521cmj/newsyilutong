package com.jy.service;

import java.util.List;

import com.jy.model.Warehouse;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.RemarkType;

public interface WarehouseService {
	public List<RemarkType> getTypes();
	public List<RemarkRange> getRange();
	public boolean checkName(String name);
	public boolean addRemark(Warehouse remark);
	public List<Remark> getRemarkName(String name,String state);
	public Warehouse getRemark(String id);
	public List<Warehouse> getRemarks(Integer page,Integer rows,String remark_name,String remark_tel,String remark_address);
	public int getCount(String remark_name,String remark_tel,String remark_address);
	public String getModifyPeople(Integer people);
	public String getOneRange(String id);
	public boolean updateRemark(Warehouse remark);
	public boolean deleteRemark(String id);
	public boolean checkRemark(String id);
}
