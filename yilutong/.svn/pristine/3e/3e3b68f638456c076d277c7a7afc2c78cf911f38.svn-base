package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.WarehouseDao;
import com.jy.model.Warehouse;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.RemarkType;
import com.jy.service.WarehouseService;
@Component
public class WarehouseServiceImpl implements WarehouseService {
	@Resource
	private WarehouseDao rmdao;
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
	public boolean addRemark(Warehouse remark) {
		int i = rmdao.addRemark(remark);
		if(i>0)
			return true;
			else
			return false;
	}
	public List<Remark> getRemarkName(String name,String state) {
		
		return rmdao.getRemarkName(name,state);
	}
	public List<Warehouse> getRemarks(Integer page, Integer rows,String remark_name,String remark_tel,String remark_address) {
		/*System.out.println(page);
		System.out.println(rows);
		System.out.println(remark_name);
		System.out.println(remark_tel);
		System.out.println(remark_address);
		System.out.println(remark_department);*/
		return rmdao.getRemarks(page,rows,remark_name,remark_tel,remark_address);
	}
	public int getCount(String remark_name,String remark_tel,String remark_address) {
		
		return rmdao.getCount(remark_name,remark_tel,remark_address);
	}
	public String getModifyPeople(Integer people) {
		return rmdao.getModifyPeople(people);
	}
	public Warehouse getRemark(String id) {
		return rmdao.getRemark(id);
	}
	public String getOneRange(String id) {
		return rmdao.getOneRange(id);
	}
	public boolean updateRemark(Warehouse remark) {
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

}
