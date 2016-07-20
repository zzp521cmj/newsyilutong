package com.jy.service;

import java.util.List;

import com.jy.model.AppMessage;
import com.jy.model.AppVersion;
import com.jy.model.Customer;
import com.jy.model.Department;
import com.jy.model.Driver;
import com.jy.model.Role;
import com.jy.model.User;

public interface UserInfoService {

	public List<User> getUserInfo(int page, int rows, String user_name,
			String user_realName, String user_did);

	public int getCount(String user_name, String user_realName, String user_did);

	public boolean modifyUser(User user);

	public boolean modifyPassword(String id, String password);

	public boolean delUser(String[] id);

	public boolean addUser(User user);

	public User getUser1(String id);

	public User getOneUser(String id);

	public String getDepartment(String did);

	public List<Department> getDepartments();

	public List<Role> getRoles();

	public boolean saveRole(String uid, Integer rid);

	public boolean saveRoles(Integer uid, Integer rid);

	public int getUserId();

	public boolean delUserRole(String[] id);

	public boolean checkUser(String name);

	public int getRole(String id);

	public List<String> getFunctions(Integer mid, Integer[] rids);

	public boolean resetpassword(String id);

	public String namegetDepartment(String id);

	public List<User> getAllUser(String user_name, String user_realName,
			String department_id, String[] ids);

	/**
	 * 获取用户个人信息
	 * 
	 * @param string
	 * @return
	 */
	public User getAppUser(String string);

	/**
	 * 获取指定部门
	 * 
	 * @param string
	 * @return
	 */
	public List<Department> getDepartmentName(String string);

	/**
	 * 获取app版本号
	 * 
	 * @return
	 */
	public AppVersion getAppVersion();

	/**
	 * 用户返回意见信息
	 * 
	 * @param appmessage
	 * @return
	 */
	public int saveAppMessage(AppMessage appmessage);

	/**
	 * 更新部门
	 * 
	 * @param creatingUser
	 * @param institutionId
	 * @return
	 */
	public int updateDepartment(String creatingUser, String institutionId);

	public List<Driver> getDrivers(String search);

	/**
	 * app添加客户信息
	 * 
	 */
	int appSaveCustomer(Customer customer);

	/**
	 * app司机注册修改用户状态
	 * 
	 * @param userid
	 * @return
	 */
	int updateUserState(String userid, String driverId);

	/**
	 * app添加用户
	 * 
	 * @param user
	 * @return
	 */
	public boolean appAddUser(User user);
}
