package com.jy.action;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportExcel;
import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.excel.bean.RoleExcel;
import com.jy.model.Function;
import com.jy.model.Role;
import com.jy.model.User;
import com.jy.model.UserPage;
import com.jy.service.RoleService;
import com.jy.service.UserInfoService;

@Controller
@RequestMapping(value = "/role.do")
public class RoleController {
	@Resource
	private RoleService roleService;
	@Resource
	private UserInfoService uis;

	/**
	 * 去角色管理页面
	 */
	@RequestMapping(params = "method=setRole")
	public String getSetRole(String menu_id, HttpSession session) {
		Integer[] rid = (Integer[]) session
				.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id, rid);
		StringBuffer bf = new StringBuffer();
		if (list.size() > 0) {
			for (String ss : list) {
				bf.append(ss);
				bf.append(",");

			}
			bf.deleteCharAt(bf.length() - 1);
			session.setAttribute("function", bf.toString());
		} else {
			session.setAttribute("function", "");

		}
		return "menu/setRole";
	}

	/**
	 * 去设置权限页面
	 */
	@RequestMapping(params = "method=role")
	public String getRole(String menu_id, HttpSession session) {
		Integer[] rid = (Integer[]) session
				.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id, rid);
		StringBuffer bf = new StringBuffer();
		if (list.size() > 0) {
			for (String ss : list) {
				bf.append(ss);
				bf.append(",");

			}
			bf.deleteCharAt(bf.length() - 1);
			session.setAttribute("function", bf.toString());
		} else {
			session.setAttribute("function", "");

		}
		return "menu/roles";
	}

	/**
	 * 获取所有角色
	 */
	@RequestMapping(params = "method=getRoles")
	public @ResponseBody
	Map<String, Object> getRoles(String page, String rows, String role_name) {
		// 当前第几页
		Integer page2 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page != null && !"".equals(page)) {
			page2 = Integer.parseInt(page);
		}
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		List<Role> list = roleService.getRoles((page2 - 1) * rows1, rows1,
				role_name);
		int total = roleService.getCount(role_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	/**
	 * 获取功能
	 */
	@RequestMapping(params = "method=getFunctions")
	public @ResponseBody
	Map<String, Object> getFunctions(Integer mid) {
		List<Function> list = roleService.getFunctions(mid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", list);
		return map;
	}

	/**
	 * 获取指定角色
	 */
	@RequestMapping(params = "method=getRole1")
	public @ResponseBody
	Role getRole1(int id) {
		Role role = roleService.getRole(id);
		return role;
	}

	/**
	 * 获取指定角色
	 */
	@RequestMapping(params = "method=userRoleCount")
	public @ResponseBody
	Integer getUserRoleCount(Integer id) {
		Integer i = 0;
		if (id == null) {
		} else {
			i = roleService.getUserRoleCount(id);
		}
		return i;
	}

	/**
	 * 修改角色
	 */
	@RequestMapping(params = "method=modifyRole")
	public String modifyRole(Integer id, String name, String remarks) {
		Role role = new Role();
		role.setId(id);
		role.setName(name);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		role.setLtime(df.format(new Date()));
		role.setRemarks(remarks);
		roleService.modifyRole(role);
		return "menu/roles";
	}

	/**
	 * 删除一个角色
	 */
	@RequestMapping(params = "method=deleteRole")
	public @ResponseBody
	boolean deleteRole(int id) {
		boolean b = roleService.delRole(id);
		return b;
	}

	/**
	 * 检查角色名是否重复
	 */
	@RequestMapping(params = "method=checkRole")
	public @ResponseBody
	boolean checkRole(String name) {
		boolean b = roleService.checkRole(name);
		return b;
	}

	/**
	 * 添加一个角色
	 */
	@RequestMapping(params = "method=saveRole")
	public String saveRole(String name, String remarks) {
		Role role = new Role();
		role.setName(name);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		role.setRemarks(remarks);
		role.setCtime(df.format(new Date()));
		roleService.addRole(role);
		return "menu/roles";
	}

	/**
	 * 获取权限树
	 */
	@RequestMapping(params = "method=getTree")
	public @ResponseBody
	String getTree(Integer id) {
		return roleService.getTree(id);

	}

	/**
	 * 获取已拥有菜单功能
	 */
	@RequestMapping(params = "method=getFids")
	public @ResponseBody
	Integer[] getFids(Integer mid, Integer rid) {
		Integer[] i = roleService.getFids(mid, rid);
		return i;

	}

	/**
	 * 获取角色树
	 */
	@RequestMapping(params = "method=getRoleTree")
	public @ResponseBody
	String getRoleTree(String id) {
		return roleService.getRoleTree(id);

	}

	/**
	 * 保存权限菜单
	 */
	@RequestMapping(params = "method=saveMenu")
	public String saveMenu(String[] nodes, Integer id) {
		if (id != null) {
			roleService.delMenu(id);

		}

		if (id == null) {
			id = roleService.getId();

		}

		for (int i = 0; i < nodes.length; i++) {
			Integer mid = Integer.parseInt(nodes[i]);
			roleService.addMenu(mid, id);
		}
		return "menu/roles";
	}

	/**
	 * 保存菜单功能
	 */
	@RequestMapping(params = "method=saveMenuFunctions")
	public @ResponseBody
	Boolean saveMenuFunctions(String[] fids, Integer rid, Integer menuid) {

		roleService.delMenuFunction(rid, menuid);
		for (int i = 0; i < fids.length; i++) {
			Integer fid = Integer.parseInt(fids[i]);
			roleService.addFunction(fid, rid);
		}

		return true;
	}

	/**
	 * 保存用户角色菜单
	 */
	@RequestMapping(params = "method=saveUserRole")
	public String saveUserRole(String[] nodes, String id) {
		roleService.delUserRoles(id);
		for (int i = 0; i < nodes.length; i++) {
			Integer rid = Integer.parseInt(nodes[i]);

			roleService.addUserRole(id, rid);
		}
		return "menu/setRole";
	}

	/**
	 * 导出角色信息
	 */
	@RequestMapping(params = "method=outputRole")
	public @ResponseBody
	String outputRole(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response, String role_name, String[] aid) {
		// String address = getadd(add, name);
		String filename = "角色信息";
		// ExportExcel<RoleExcel> ex = new ExportExcel<RoleExcel>();

		// JSONArray jsonarray = JSONArray.fromObject(datas);
		/*
		 * List<RoleExcel> lists = (List<RoleExcel>) JSONArray.toCollection(
		 * jsonarray, RoleExcel.class);
		 */

		List<Role> list = roleService.outputRoles(role_name, aid);
		try {
			// 声明一个工作薄
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "用户列表");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "用户列表");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查看角色中的用户
	 * 
	 * @param request
	 * @param roleId
	 * @return
	 */
	@RequestMapping(params = "method=getRoleUserInfo")
	public String getRoleUserInfo(HttpServletRequest request, String roleId) {
		request.setAttribute("roleId", roleId);
		return "menu/RoleUserInfo";
	}

	/**
	 * 查看角色下面的用户详细信息
	 * 
	 * @param page
	 * @param roleId
	 * @return
	 */
	@RequestMapping(params = "method=getRoleUsermeessage")
	public @ResponseBody
	Map<String, Object> getRoleUsermeessage(UserPage page, String roleId) {
		Integer page2 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page.getPage() != null && !"".equals(page.getPage())) {
			page2 = Integer.parseInt(page.getPage());
		}
		if (page.getRows() != null && !"".equals(page.getRows())) {
			rows1 = Integer.parseInt(page.getRows());
		}
		if ("".equals(page.getDepartment_id())) {
			page.setDepartment_id(null);
		}
		// 返回总记录数
		List<User> list = roleService.getRoleUsermeessage((page2 - 1) * rows1,
				rows1, page.getUser_name(), page.getUser_realName(),
				page.getDepartment_id(), roleId);
		// 返回总条数
		int total = roleService.getRoleUserTotal(page.getUser_name(),
				page.getUser_realName(), page.getDepartment_id(), roleId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	@RequestMapping(params = "method=deleteRoleUserInfo")
	public @ResponseBody
	boolean deleteRoleUserInfo(String[] userId, String roleId) {
		boolean b = roleService.deleteRoleUserInfo(userId, roleId);
		return b;
	}
}