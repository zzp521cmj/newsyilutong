package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Department;
import com.jy.model.User;

public interface ToolsDao {
	List<String>getChildren(String deptid);
	List<User> getUser(String name,String departid);
	List<Department> getdept(String name,@Param("array")String [] did);
}
