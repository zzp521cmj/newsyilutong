package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.MenuDao;
import com.jy.dao.RoleDao;
import com.jy.model.Function;
import com.jy.model.Menu;
import com.jy.model.Role;
import com.jy.model.User;
import com.jy.service.RoleService;

@Component
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roledao;
	@Resource
	private MenuDao menudao;

	// 根据条件分页展示角色列表
	public List<Role> getRoles(Integer page, Integer rows, String name) {
		
		List<Role> role = roledao.getRoles(page, rows, name);
		return role;
	}

	// 修改角色
	public boolean modifyRole(Role role) {
		int b = roledao.modifyRole(role);

		if (b > 0)
			return true;
		else
			return false;
	}

	// 删除角色
	public boolean delRole(int id) {
		int i = roledao.delRole(id);
		roledao.delRoles(id);
		roledao.delMenu(id);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 新增角色
	public boolean addRole(Role role) {
		int i = roledao.addRole(role);
		if (i > 0)
			return true;
		else
			return false;
	}

	// 根据角色id拿角色
	public Role getRole(int id) {
		Role role = roledao.getRole(id);
		return role;
	}

	// 获取角色总数
	public int getCount(String name) {
		return roledao.getCount(name);

	}

	// 获取菜单列表树
	public String getTree(Integer id) {
		boolean ii = false;
		Integer[] ids = null;
		if (id != null) {
			ids = menudao.getIdMenu(id);
		}
		List<Menu> menulist = menudao.getnoteAll();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if (menulist.size() > 0) {
			for (Menu menu : menulist) {
				sb.append("{\"id\":\"" + menu.getId() + "\",\"text\":\""
						+ menu.getText() + "\",\"iconCls\":\""
						+ menu.getIconCls()
						+ "\",\"state\":\"closed\",\"children\":[");
				List<Menu> menulist1 = menudao.getMenuAll(menu.getId());
				if (menulist1.size() > 0) {
					for (Menu menu1 : menulist1) {
						if (ids != null) {
							for (int i = 0; i < ids.length; i++) {
								if (menu1.getId() == ids[i]) {
									ii = true;
									break;
								} else {
									ii = false;

								}
							}
						}
						sb.append("{\"id\":\"" + menu1.getId()
								+ "\",\"text\":\"" + menu1.getText()
								+ "\",\"checked\":" + ii + ",\"iconCls\":\""
								+ menu1.getIconCls()
								+ "\",\"state\":\"closed\"");
						List<Menu> menulist2 = menudao
								.getMenuAll(menu1.getId());
						if (menulist2.size() > 0) {
							sb.append(",\"children\":[");
							for (Menu menu2 : menulist2) {
								if (ids != null) {
									for (int i = 0; i < ids.length; i++) {
										if (menu2.getId() == ids[i]) {
											ii = true;
											break;
										} else {
											ii = false;

										}
									}
								}
								sb.append("{\"id\":\"" + menu2.getId()
										+ "\",\"text\":\"" + menu2.getText()
										+ "\",\"checked\":" + ii
										+ ",\"iconCls\":\""
										+ menu2.getIconCls() + "\"},");
							}
							sb.deleteCharAt(sb.length() - 1);
							sb.append("]},");
						} else {
							sb.append("},");
						}
					}
					sb.deleteCharAt(sb.length() - 1);
					sb.append("]},");
				} else {
					sb.append("]},");
				}

			}
			sb.deleteCharAt(sb.length() - 1);
			sb.append("]");
		} else {
			sb.append("{[]}");
		}
		return sb.toString();

	}

	// 删除角色对应菜单
	public int delMenu(Integer id) {
		int mr = roledao.delMenu(id);
		return mr;
	}

	// 添加角色对应菜单
	public boolean addMenu(Integer mid, Integer rid) {
		int i = roledao.addMenu(mid, rid);
		if (i > 0)
			return true;
		else
			return false;
	}

	public boolean checkRole(String name) {
		int i = roledao.checkRole(name);
		if (i > 0)
			return true;
		else
			return false;
	}

	public int getId() {
		int id = roledao.getRoleId();
		return id;
	}

	public Integer getUserRoleCount(Integer id) {
		Integer i = roledao.getUserRoleCount(id);
		return i;
	}

	public String getRoleTree(String id) {
		boolean ii = false;
		Integer[] ids = null;
		if (id != null) {
			ids = roledao.getIdRoles(id);
		}
		List<Role> rolelist = roledao.getRoleList();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if (rolelist.size() > 0) {
			for (Role role : rolelist) {
				for (int i = 0; i < ids.length; i++) {
					if (role.getId() == ids[i]) {
						ii = true;
						break;
					} else {
						ii = false;

					}
				}
				sb.append("{\"id\":\"" + role.getId() + "\",\"text\":\""
						+ role.getName() + "\",\"checked\":" + ii + "},");

			}

			sb.deleteCharAt(sb.length() - 1);
			sb.append("]");
		} else {
			sb.append("{[]}");
		}

		return sb.toString();

	}

	public boolean delUserRoles(String id) {
		int i = roledao.delUserRoles(id);
		if (i > 0)
			return true;
		else
			return false;
	}

	public boolean addUserRole(String uid, Integer rid) {
		int i = roledao.addUserRole(uid, rid);
		if (i > 0)
			return true;
		else
			return false;
	}

	public List<Function> getFunctions(Integer mid) {
		List<Function> list = roledao.getFunctions(mid);
		return list;
	}

	public Integer[] getFids(Integer mid, Integer rid) {
		Integer[] i = roledao.getFids(mid, rid);
		return i;
	}

	public boolean delMenuFunction(Integer rid, Integer mid) {
		int i = roledao.delMenuFunction(rid, mid);
		if (i > 0)
			return true;
		else
			return false;
	}

	public boolean addFunction(Integer fid, Integer rid) {
		int i = roledao.addFunction(fid, rid);

		if (i > 0)
			return true;
		else
			return false;
	}

	public List<User> getRoleUsermeessage(int page, int rows, String user_name,
			String user_realName, String user_did, String roleId) {
		
		return roledao.getRoleUsermeessage(page, rows, user_name,
				user_realName, user_did, roleId);
	}

	public int getRoleUserTotal(String user_name, String user_realName,
			String user_did, String roleId) {
		
		return roledao.getRoleUserTotal(user_name, user_realName, user_did,
				roleId);
	}

	public boolean deleteRoleUserInfo(String[] userId, String roleId) {
		return roledao.deleteRoleUserInfo(userId, roleId);
	}

	public List<Role> outputRoles(String name, String[] id) {
		
		return roledao.outputRoles(name, id);
	}

}
