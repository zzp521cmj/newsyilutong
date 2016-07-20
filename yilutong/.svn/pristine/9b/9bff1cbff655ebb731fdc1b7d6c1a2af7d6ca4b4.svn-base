package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.RoleDao;
import com.jy.dao.UserDao;
import com.jy.model.AppMessage;
import com.jy.model.AppVersion;
import com.jy.model.Customer;
import com.jy.model.Department;
import com.jy.model.Driver;
import com.jy.model.Role;
import com.jy.model.User;
import com.jy.service.UserInfoService;

@Component
public class UserInfoServiceImpl implements UserInfoService {
	@Resource
	private UserDao userdao;
	@Resource
	private RoleDao roledao;

	public int getCount(String user_name, String user_realName, String user_did) {
		int count = userdao.getCount(user_name, user_realName, user_did);
		return count;
	}

	// 根据条件分页显示用户
	public List<User> getUserInfo(int page, int rows, String user_name,
			String user_realName, String user_did) {
		return userdao.getUser(page, rows, user_name, user_realName, user_did);
	}

	// 修改用户
	public boolean modifyUser(User user) {
		int b = userdao.modifyUser(user);
		if (b > 0)
			return true;
		else
			return false;
	}

	// 删除用户
	public boolean delUser(String[] id) {
		int i = userdao.delUser(id);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 新增用户
	public boolean addUser(User user) {
		int i = userdao.addUser(user);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 根据id拿用户
	public User getUser1(String id) {
		User user = userdao.getUser1(id);
		return user;
	}

	// 根据部门编号 拿部门名称
	public String getDepartment(String did) {

		return userdao.getDepartment(did);
	}

	// 获取部门列表
	public List<Department> getDepartments() {
		return userdao.getDepartments();
	}

	// 获取角色列表
	public List<Role> getRoles() {

		return userdao.getRoles();
	}

	// 保存角色与用户的关系
	public boolean saveRole(String id, Integer rid) {
		int i = userdao.saveRole(id, rid);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 修改角色与用户的关联表
	public boolean saveRoles(Integer id, Integer rid) {
		int i = userdao.saveRoles(id, rid);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 取出最大用户id
	public int getUserId() {

		return userdao.getUserId();
	}

	// 根据用户id删除关联表记录
	public boolean delUserRole(String[] id) {
		int i = userdao.delUserRole(id);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 检查用户名是否重复
	public boolean checkUser(String name) {
		int i = userdao.checkUser(name);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 根据用户id拿角色id
	public int getRole(String id) {
		int role = roledao.getUserRole(id);

		return role;
	}

	public List<String> getFunctions(Integer mid, Integer[] rids) {
		List<String> list = userdao.getFunctions(mid, rids);
		return list;
	}

	public boolean resetpassword(String id) {
		int i = userdao.resetpassword(id);
		if (i > 0)
			return true;
		else
			return false;
	}

	public boolean modifyPassword(String id, String password) {
		int b = userdao.modifyPassword(id, password);
		if (b > 0)
			return true;
		else
			return false;
	}

	public String namegetDepartment(String id) {
		return userdao.namegetDepartment(id);
	}

	public User getOneUser(String id) {
		User user = userdao.getUser1(id);
		/*
		 * if(user.getFlag().equals("1")){ User user1 = userdao.getTraUser(id);
		 * if(user1==null){ user.setState("0"); user.setFlag("0"); return user;
		 * 
		 * } user1.setState("1"); return user1; }else{ user.setState("0");
		 */
		return user;

		/* } */

	}

	public List<User> getAllUser(String user_name, String user_realName,
			String department_id, String[] ids) {
		return userdao.getAllUser(user_name, user_realName, department_id,ids);
	}

	public User getAppUser(String id) {

		User user = userdao.getAppUser(id);
		return user;
	}

	/**
	 * 获取指定部门
	 */
	public List<Department> getDepartmentName(String department_name) {

		List<Department> list = userdao.getDepartmentName(department_name);
		return list;
	}

	/**
	 * 获取app版本号
	 */
	public AppVersion getAppVersion() {

		AppVersion app = userdao.getAppVersion();
		return app;
	}

	/**
	 * 用户意见信息
	 */
	public int saveAppMessage(AppMessage appmessage) {

		int flag = userdao.saveAppMessage(appmessage);
		return flag;
	}

	/**
	 * 更新部门
	 */
	public int updateDepartment(String creatingUser, String institutionId) {

		int flag = userdao.updateDepartment(creatingUser, institutionId);
		return flag;
	}

	public List<Driver> getDrivers(String search) {
		return userdao.getDrivers(search);
	}

	public int appSaveCustomer(Customer customer) {
		return userdao.appSaveCustomer(customer);
	}

	public int updateUserState(String userid, String driverId) {

		return userdao.updateUserState(userid, driverId);
	}

	public boolean appAddUser(User user) {
		boolean b = false;
		int i = userdao.appAddUser(user);
		if (i > 0) {
			b = true;
		}

		return b;
	}

}
