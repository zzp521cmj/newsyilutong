package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.ToolsDao;
import com.jy.model.Department;
import com.jy.model.User;
import com.jy.service.ToolsService;

@Service("ToolsService")
public class ToolsServiceImpl implements ToolsService {
	@Resource
	private ToolsDao toolsDao;

	public List<String> getChildren(String deptid) {
		return toolsDao.getChildren(deptid);
	}

	public List<User> getUser(String name,String departid) {
		return toolsDao.getUser(name,departid);
	}

	

	public List<Department> getdept(String name,String [] did) {
		return toolsDao.getdept(name,did);
	}
}
