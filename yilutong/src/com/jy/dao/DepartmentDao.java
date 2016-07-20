package com.jy.dao;

import java.util.List;

import com.jy.model.Department;

/**
 * 部门dao
 * @author Administrator
 *
 */
public interface DepartmentDao {
	Department getDepartmentf();
	//获取部门
	List<Department> getDepartments(String id);
	Department getDepartment(String id);
	int modifyDepartment(Department depn);
	int delDepartment(String id);
	int delDepartments(String id);
	int addDepartment(Department depn);
	int getCount();
	int checkDepn(String name,String fid);
	Department getDepartmentDisanfang();
}
