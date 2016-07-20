package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.jy.model.AppMessage;
import com.jy.model.AppVersion;
import com.jy.model.Customer;
import com.jy.model.Department;
import com.jy.model.Driver;
import com.jy.model.Role;
import com.jy.model.User;

public interface UserDao {
	List<User> getUser(Integer page, Integer rows, String user_name,
			String user_realName, String user_did);

	int getCount(String user_name, String user_realName, String user_did);

	int modifyUser(User user);

	int modifyPassword(String id, String password);

	int delUser(@Param("array")String[] id);

	int addUser(User user);

	User getUser1(String id);

	User getTemUser(String id);

	User getTraUser(String id);

	String getDepartment(String did);

	List<Department> getDepartments();

	List<Role> getRoles();

	int saveRole(String user_role_uid, Integer user_role_rid);

	int saveRoles(Integer user_role_uid, Integer user_role_rid);

	int getUserId();

	int delUserRole(@Param("array")String[] uid);

	int checkUser(String name);

	List<String> getFunctions(Integer mid, @Param("array") Integer[] rids);

	int resetpassword(String id);

	String namegetDepartment(String id);

	/**
	 * 导出用户信息
	 * @param user_name
	 * @param user_realName
	 * @param department_id
	 * @return
	 */
	List<User> getAllUser(String user_name, String user_realName,
			String department_id,@Param("array") String[] ids);

	User getAppUser(String id);

	List<Department> getDepartmentName(String department_name);

	/**
	 * 获取app版本号
	 * 
	 * @return
	 */
	AppVersion getAppVersion();

	/**
	 * 获取用户意见信息
	 * 
	 * @param appmessage
	 * @return
	 */
	int saveAppMessage(AppMessage appmessage);

	/**
	 * 更新部门
	 * 
	 * @param creatingUser
	 * @param institutionId
	 * @return
	 */
	int updateDepartment(String creatingUser, String institutionId);

	public List<Driver> getDrivers(String search);

	/**
	 * app添加用户
	 * 
	 * @param user
	 * @return
	 */
	public int appAddUser(User user);

	/**
	 * app添加客户信息
	 * 
	 */
	int appSaveCustomer(Customer customer);
    /**
     * app司机注册修改用户状态
     * @param userid
     * @return
     */
	int updateUserState(String userid,String driverId);
}
