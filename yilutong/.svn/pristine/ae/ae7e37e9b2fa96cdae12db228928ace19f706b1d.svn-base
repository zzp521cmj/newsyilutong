package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Function;
import com.jy.model.Role;
import com.jy.model.User;

public interface RoleDao {
	List<Role> getRoles(Integer page, Integer rows, String name);

	int modifyRole(Role role);

	int delRoles(int id);

	int delRole(int id);

	int addRole(Role role);

	Role getRole(int id);

	int getUserRole(String id);

	int getCount(String name);

	List<Role> getRoleList();

	int delMenu(Integer rid);

	int addMenu(Integer mid, Integer rid);

	int checkRole(String name);

	int getRoleId();

	int getUserRoleCount(int id);

	Integer[] getIdRoles(String id);

	int addUserRole(String uid, Integer rid);

	int delUserRoles(String id);

	List<Function> getFunctions(Integer mid);

	Integer[] getFids(Integer mid, Integer rid);

	int delMenuFunction(Integer rid, Integer mid);

	int addFunction(Integer fid, Integer rid);

	List<User> getRoleUsermeessage(int page, int rows, String user_name,
			String user_realName, String user_did, String roleId);

	int getRoleUserTotal(String user_name, String user_realName,
			String user_did, String roleId);

	public boolean deleteRoleUserInfo(@Param("array") String[] userId,
			String roleId);
	/**
	 * 导出角色信息
	 * @param name
	 * @param id
	 * @return
	 */
	List<Role> outputRoles(String name,@Param("array") String[] id);
	
	
}
