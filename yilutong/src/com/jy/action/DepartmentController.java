package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.model.Department;
import com.jy.service.DepartmentService;
import com.jy.service.UserInfoService;
/**
 * 部门管理类 
 */
@Controller
@RequestMapping(value="/depn.do")
public class DepartmentController {
	@Resource
	private DepartmentService depnService;
	@Resource
	private UserInfoService uis;
	/**
	 * 去部门管理页面 
	 */
	@RequestMapping(params="method=depn")
	public String getDepartment(String menu_id,HttpSession session){
		Integer[] rid =(Integer[])session.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id,rid);
		if(list.size()>0){
		StringBuffer bf = new StringBuffer();
		for(String ss:list){
			bf.append(ss);
			bf.append(",");
			
		}
		bf.deleteCharAt(bf.length()-1);
		session.setAttribute("function", bf.toString());
		}else{
			session.setAttribute("function", "");
			
		}
		return "menu/departments";
	}
	/**
	 * 获取部门树
	 */
	@RequestMapping(params="method=getTree")
	public @ResponseBody String getTree(String id){
		String [] s = id.split(",");
		return depnService.getTree(s[0]);
	}
	/**
	 * 获取部门树
	 */
	@RequestMapping(params="method=getTree2")
	public @ResponseBody String getTree2(String id){
		String [] s = id.split(",");
		return depnService.getTree2(s[0]);
	}
	/**
	 * 获取指定部门
	 */
	@RequestMapping(params="method=getDepn")
	public @ResponseBody Department getDepartment(String department_id){
		Department depn = depnService.getDepartment(department_id);
		return depn;
	}
	/**
	 * 获取子部门
	 */
	@RequestMapping(params="method=getDepnkids")
	public @ResponseBody boolean getDepns(String id){
		List<Department> list = depnService.getDepnkids(id);
		if(list.size()>0){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 获取指定父部门
	 */
	@RequestMapping(params="method=getDepnfname")
	public @ResponseBody Map<String,Department> getDepartmentfname(String department_id){
		Department depn = depnService.getDepartment(department_id);
		Department depn1 = depnService.getDepartment(depn.getFather_id());
		Map<String,Department> depnmap = new HashMap<String,Department>();
		depnmap.put("depnc", depn);
		depnmap.put("depnf", depn1);
		return depnmap;
	}
	/**
	 * 删除部门 
	 */
	@RequestMapping(params="method=deleteDepn")
	public String deleteDepartment(String father_id){
		boolean b = depnService.delDepartment(father_id);
		return "menu/departments";
	}
	/**
	 * 修改部门 
	 */
	@RequestMapping(params="method=modifyDepartment")
	public String modifyDepartment(Department depn){
			
			String leva = depn.getLeva();
			if(leva!=""&&leva!=null){
				int l = Integer.parseInt(leva);
				int levaint = l+1;
				depn.setLeva(Integer.toString(levaint));
			}
			depnService.modifyDepartment(depn);
			return "menu/departments";
	}
	/**
	 * 检查部门名是否重复 
	 */
	@RequestMapping(params="method=checkDepn")
	public @ResponseBody boolean checkDepn(String name,String fid){
		boolean b = depnService.checkDepn(name,fid);
		return b;
	}
	/**
	 * 添加部门 
	 */
	@RequestMapping(params="method=saveDepartment")
	public String saveDepartment(Department depn){
		depn.setDepartment_id(UUIDUtils.getUUID());
		String leva = depn.getLeva();
		if(leva!=""&&leva!=null){
			int l = Integer.parseInt(leva);
			int levaint = l+1;
			depn.setLeva(Integer.toString(levaint));
		}
		depnService.addDepartment(depn);
		return "menu/departments";
	}
}