package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DepartmentDao;
import com.jy.model.Department;
import com.jy.model.Menu;
import com.jy.service.DepartmentService;
@Component
public class DepartmentServiceImpl implements DepartmentService {
	@Resource
	private DepartmentDao departmentDao;
	//根据查询条件分页展示部门列表
	
	//根据部门id拿取部门对象
	public Department getDepartment(String id) {
		Department depn = departmentDao.getDepartment(id);
		return depn;
	}
	//修改部门
	public boolean modifyDepartment(Department depn) {
		int i = departmentDao.modifyDepartment(depn);
		if(i>0)
		return true;
		else
		return false;
	}
	//删除部门
	
	public boolean delDepartment(String id) {
		int i = departmentDao.delDepartment(id);
		if(i>0)
		return true;
		else
		return false;
	}
	//新增部门
	public boolean addDepartment(Department depn) {
		int i  = departmentDao.addDepartment(depn);
		if(i>0)
		return true;
		else
		return false;
	}
	//获取部门总数
	public int getCount() {
		// TODO Auto-generated method stub
		return departmentDao.getCount();
	}//
	/*public StringBuffer getChildren(StringBuffer sb,Integer id){
		List<Department> depnlist = departmentDao.getDepartments(id);
		if(depnlist.size()>0){
			sb.append(",\"children\":[");
			for(Department depn:depnlist){
				sb.append("{\"id\":\""+depn.getDepartment_id()+"\",\"text\":\""+depn.getDepartment_name()+"\"");	
				sb = this.getChildren(sb, depn.getDepartment_id());
			}
		
		}else{
			sb.append("}]");
		}
		
		return sb;
	}*/
	public String getTree(String id) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if(id==null||"".equals(id)){
			Department depn = departmentDao.getDepartmentf();
			sb.append("{\"id\":\""+depn.getDepartment_id()+"\",\"text\":\""+depn.getDepartment_name()+"\",\"father\":\""+depn.getFather_id()+"\",\"attributes\":\""+depn.getLeva()+"\",\"state\":\"closed\"}]");	
		}else{
			List<Department> depnlist = departmentDao.getDepartments(id);
			if(depnlist.size()>0){
				for (Department depn : depnlist) {
					sb.append("{\"id\":\""+depn.getDepartment_id()+"\",\"text\":\""+depn.getDepartment_name()+"\",\"father\":\""+depn.getFather_id()+"\",\"attributes\":\""+depn.getLeva()+"\",\"state\":\"closed\"},");
					
						}
					sb.deleteCharAt(sb.length()-1);
					sb.append("]");
			}else{
						sb.append("]");
			}
		}
		return sb.toString();
				
	}
public String getTree2(String id) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if(id==null||"".equals(id)){
			Department depn = departmentDao.getDepartmentDisanfang();
			sb.append("{\"id\":\""+depn.getDepartment_id()+"\",\"text\":\""+depn.getDepartment_name()+"\",\"father\":\""+depn.getFather_id()+"\",\"state\":\"closed\"}]");	
		}else{
			List<Department> depnlist = departmentDao.getDepartments(id);
			if(depnlist.size()>0){
				for (Department depn : depnlist) {
					sb.append("{\"id\":\""+depn.getDepartment_id()+"\",\"text\":\""+depn.getDepartment_name()+"\",\"father\":\""+depn.getFather_id()+"\",\"state\":\"closed\"},");
					
						}
					sb.deleteCharAt(sb.length()-1);
					sb.append("]");
			}else{
						sb.append("]");
			}
		}
		return sb.toString();
				
	}
	public boolean checkDepn(String name, String fid) {
		int i = departmentDao.checkDepn(name,fid);
		if(i>0)
			return true;
			else
			return false;
		
	}
	public List<Department> getDepnkids(String id) {
		return departmentDao.getDepartments(id);
	}		
	
}
