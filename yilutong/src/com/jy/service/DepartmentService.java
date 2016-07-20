package com.jy.service;

import java.util.List;

import com.jy.model.Department;

/**
 * 部门接口
 * @author Administrator
 *
 */
public interface DepartmentService {
	
	
	public Department getDepartment(String id);
	public boolean modifyDepartment(Department depn);
	public boolean delDepartment(String id);
	public boolean addDepartment(Department depn);
	public int getCount();
	public String getTree(String id);
	public String getTree2(String id);
	public boolean checkDepn(String name,String fid);
	public List<Department> getDepnkids(String id);
}
