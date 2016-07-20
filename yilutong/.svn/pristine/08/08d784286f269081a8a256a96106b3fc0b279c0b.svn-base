package com.jy.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.model.CityAgreement;
import com.jy.model.Department;
import com.jy.model.User;
import com.jy.service.CityAgreementService;
import com.jy.service.DepartmentService;
import com.jy.service.UserInfoService;

@Controller
@RequestMapping(value = "/tms.do")
public class TMSController {
	@Resource
	private DepartmentService depnService;
	@Resource
	private CityAgreementService as;
	@Resource
	private UserInfoService uis;
	@RequestMapping(params = "method=Department")
	public @ResponseBody List<String> Department(String department) {
		
		try{
			department = new String(department.getBytes("iso-8859-1"), "utf-8");
			}catch(Exception e){
				e.printStackTrace();
			}
		List<String> id = new ArrayList<String>();
		Boolean b = new Boolean(null);
		if(!"".equals(department)&&department!=null){
			JSONArray jsonArray = JSONArray.fromObject(department);
			for(int i=0;i<jsonArray.size();i++){
			JSONObject jo = jsonArray.getJSONObject(i);		
			String department_id = jo.getString("department_id");
			String department_name = jo.getString("department_name");
			String father_id = jo.getString("father_Id");
			String state = jo.getString("jgzt");
			Department depn = new Department();
			depn.setDepartment_id(department_id);
			depn.setDepartment_name(department_name);
			depn.setFather_id(father_id);
			Department depn2= depnService.getDepartment(department_id);
			if(depn2!=null&&"1".equals(state)){
			 b = depnService.modifyDepartment(depn);	
			}else if("0".equals(state)){
				b  = depnService.delDepartment(department_id);
				
			}else if(depn2==null){
				b = depnService.addDepartment(depn);	
			}
			
			if(b==true){
				id.add(department_id);
			}
			}
		}
		return id;
	}
	@RequestMapping(params = "method=User")
	public  @ResponseBody List<String> User(String user) {
		try{
		user = new String(user.getBytes("iso-8859-1"), "utf-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		List<String> id = new ArrayList<String>();
		Boolean b = new Boolean(null);
		if(!"".equals(user)&&user!=null){
			JSONArray jsonArray = JSONArray.fromObject(user);
			for(int i=0;i<jsonArray.size();i++){
			JSONObject jo = jsonArray.getJSONObject(i);
			String uid = jo.getString("user_id");
			String username = jo.getString("user_name");
			String realname = jo.getString("user_realname");
			String did = jo.getString("department_id");
			System.out.println(did);
			String state = jo.getString("user_del");
			User u  = new User();
			u.setId(uid);
			u.setDid(did);
			u.setUsername(username);
			u.setRealName(realname);
			u.setPassword("F379EAF3C831B04DE153469D1BEC345E");
			u.setFlag("0");
			u.setState("1");
			User us = uis.getUser1(uid);
			if(us!=null){
				b = uis.modifyUser(u);
				
			}else if("0".equals(state)){
				//b = uis.delUser(uid);
			}else if(us==null){
				 b = uis.addUser(u);	
			}
			if(b==true){
				id.add(uid);
			}
			}
		}
		return id;
	
	}
	@RequestMapping(params = "method=Agreement")
	public  @ResponseBody List<String> Agreement(String Agreement) {
		//System.out.println("第一步");
		try{
			Agreement = new String(Agreement.getBytes("iso-8859-1"), "utf-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		//System.out.println("第二步");
		List<String> cgid = new ArrayList<String>();
		Boolean b = new Boolean(null);
		//System.out.println("第三步");
		if(!"".equals(Agreement)&&Agreement!=null){
			JSONArray jsonArray = JSONArray.fromObject(Agreement);
			for(int i=0;i<jsonArray.size();i++){
			JSONObject jo = jsonArray.getJSONObject(i);
			String id = jo.getString("xyid");
			String code = jo.getString("bh");
			String state = jo.getString("lx");
			String pcd_code = jo.getString("pcdh");
			String car_id = jo.getString("cph");
			String flag  = jo.getString("xyzt");
			String createtime = jo.getString("zzsj");
			String did = jo.getString("jgid");
			String lastdid = jo.getString("tojigid");
			String isCar = jo.getString("bz");
			//System.out.println("第四步");
			CityAgreement a  = new CityAgreement();
			a.setId(id);
			a.setCode(code);
			a.setState(state);
			a.setPcd_code(pcd_code);
			a.setCar_id(car_id);
			a.setFlag(flag);
			a.setDid(did);
			a.setCreatetime(createtime);
			a.setLastdid(lastdid);
			a.setIsArrive("0");
			a.setIsCar(isCar);
			//System.out.println("第五步");
			if("0".equals(flag)){
				//System.out.println("第六步");
				b = as.delAgreement(id);
				
			}else{
				//System.out.println("第七步");
				b = as.addAgreement(a);
				
			}
			if(b==true){
				//System.out.println("第八步");
				cgid.add(id);
			}
			}
		}
		return cgid;
	
	}
	@RequestMapping(params = "method=delUser")
	public boolean delUser(String id) {
		//uis.delUser(id);
		return true;
	}
	@RequestMapping(params = "method=updateDepartment")
	public @ResponseBody List<String> updateDepartment(String department) {
		List<String> id = new ArrayList<String>();
		if(!"".equals(department)&&department!=null){
			JSONArray jsonArray = JSONArray.fromObject(department);
			for(int i=0;i<jsonArray.size();i++){
			JSONObject jo = jsonArray.getJSONObject(i);		
			String department_id = jo.getString("department_id");
			String department_name = jo.getString("department_name");
			String father_id = jo.getString("father_Id");
			Department depn = new Department();
			depn.setDepartment_id(department_id);
			depn.setDepartment_name(department_name);
			depn.setFather_id(father_id);
			boolean b = depnService.modifyDepartment(depn);
			if(b==false){
				id.add(department_id);
			}
			}
		}
		return id;
	}
	@RequestMapping(params = "method=updateUser")
	public boolean updateUser(String user) {
		JSONObject jsonobject = JSONObject.fromObject(user);
		String username = jsonobject.getString("user_name");
		String password = jsonobject.getString("user_password");
		User u  = new User();
		u.setUsername(username);
		u.setPassword(password);
		uis.modifyUser(u);
		return true;
	}
	@RequestMapping(params = "method=ceshi")
	public @ResponseBody List<String> ceshi() {
		String department = "[{'department_id':'100000','department_name':'ASDBAMBD','father_Id':'1395','jgzt':'0'},{'department_id':'100001','department_name':'ABCDE','father_Id':'1395','jgzt':'0'}]";

		List<String> id = new ArrayList<String>();
		Boolean b = new Boolean(null);
		if(!"".equals(department)&&department!=null){
			JSONArray jsonArray = JSONArray.fromObject(department);
			for(int i=0;i<jsonArray.size();i++){
			JSONObject jo = jsonArray.getJSONObject(i);		
			String department_id = jo.getString("department_id");
			String department_name = jo.getString("department_name");
			String father_id = jo.getString("father_Id");
			String state = jo.getString("jgzt");
			Department depn = new Department();
			depn.setDepartment_id(department_id);
			depn.setDepartment_name(department_name);
			depn.setFather_id(father_id);
			Department depn2= depnService.getDepartment(department_id);
			if(depn2!=null&&"1".equals(state)){
			 b = depnService.modifyDepartment(depn);	
			}else if("0".equals(state)){
				b  = depnService.delDepartment(department_id);
				
			}else if(depn2==null){
				b = depnService.addDepartment(depn);	
			}
			
			if(b==true){
				id.add(department_id);
			}
			}
		}
		return id;
	}@RequestMapping(params = "method=ceshi2")
	public void ceshi2(String car) {
	}
}
