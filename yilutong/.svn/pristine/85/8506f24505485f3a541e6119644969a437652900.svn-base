package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Function;
import com.jy.model.Role;
import com.jy.model.User;

public interface RoleService {
	public List<Role> getRoles(Integer page, Integer rows, String name);

	public boolean modifyRole(Role role);

	public boolean delRole(int id);

	public boolean addRole(Role role);

	public Role getRole(int id);

	public int getCount(String name);

	public String getTree(Integer id);

	public int delMenu(Integer id);

	public boolean addMenu(Integer mid, Integer rid);

	public boolean checkRole(String name);

	public int getId();

	public Integer getUserRoleCount(Integer id);

	public String getRoleTree(String id);

	public boolean delUserRoles(String id);

	public boolean addUserRole(String uid, Integer rid);

	public List<Function> getFunctions(Integer mid);

	public Integer[] getFids(Integer mid, Integer rid);

	public boolean delMenuFunction(Integer rid, Integer mid);

	public boolean addFunction(Integer fid, Integer rid);

	public List<User> getRoleUsermeessage(int page, int rows, String user_name,
			String user_realName, String user_did, String roleId);

	public int getRoleUserTotal(String user_name, String user_realName,
			String user_did, String roleId);

	boolean deleteRoleUserInfo(String[] userId, String roleId);
	
	/**
	 * 导出角色信息
	 * @param name
	 * @param id
	 * @return
	 */
	List<Role> outputRoles(String name,@Param("array") String[] id);
}
