/*package com.jy.action;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.dao.Json;
import com.jy.excel.bean.PostLineExcel;
import com.jy.model.Equipment_info;
import com.jy.model.TravelCard;
import com.jy.service.EquipmentManService;
import com.jy.service.TravelCardService;
import com.jy.service.UserInfoService;

*//**
 * 2015-5-4 15:35:24
 * 
 * @author zkj
 *//*
@Controller
@RequestMapping(value = "/equipment.do")
public class EquipmentController {

	@Resource
	private EquipmentManService equipmentManService;
	@Resource
	private TravelCardService tc;
	@Resource
	private UserInfoService uis;
	Logger log=Logger.getLogger(EquipmentController.class);
	*//**
	 * 去设备管理页面
	 *//*
	@RequestMapping(params = "method=getequipmentMan")
	public String PersonInfo(String menu_id,HttpSession session) {
		Integer[] rid =(Integer[])session.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id,rid,(String)session.getAttribute(SessionInfo.SessionDB));
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
		return "equipment/equipmentMan";
	}
	
	*//**
	 * 添加设备页面跳转
	 * @return
	 *//*
	@RequestMapping(params = "method=addEquipment")
	public String addEquipment() {
		return "equipment/addEquipment";
	}
	
	*//**
	 * 修改设备页面跳转
	 * @return
	 *//*
	@RequestMapping(params = "method=editEquipment")
	public String editEquipment(String pid,HttpServletRequest reuqest) {
		reuqest.setAttribute("flg", pid);
		return "equipment/editEquipment";
	}
	
	
	*//**
	 * 分页查询
	 *//*
	@RequestMapping(params = "method=getEquipmentManlist")
	public @ResponseBody
	Map<String, Object> EquipmentManList(Integer draw,Integer start,Integer length,
			String equipment_number,String carnum,String department_id,String is_binding,HttpSession session) {
		String dids=(String) session.getAttribute(SessionInfo.SessionDepartment);
		String dbName=(String) session.getAttribute(SessionInfo.SessionDB);
		List<Equipment_info> list = equipmentManService.getEquipmentManInfo(
				start,length, equipment_number,carnum,department_id,dids,dbName,is_binding);
		int count = equipmentManService.getCount(equipment_number,carnum,department_id,dids,dbName,is_binding);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("draw", draw);
		map.put("recordsTotal", count);
		map.put("recordsFiltered", count);		
		map.put("data", list);
		return map;
	}
	
	*//**
	 * 添加设备
	 * @param equipment_info
	 * @return
	 *//*
	@RequestMapping(params = "method=saveEquipment")
	public @ResponseBody Json saveEquipment(Equipment_info equipment_info,HttpSession session) {
		Json json = new Json();
		int flag=equipmentManService.checkEquipment(equipment_info.getEquipment_number(),"");
		if(flag>0){
			json.setAns("设备号已存在");
		}else{
			equipment_info.setIs_binding("0");
			int truck = equipmentManService.InfoManAdd(equipment_info,(String)session.getAttribute(SessionInfo.SessionDB));
			if (truck > 0) 
				json.setFlag(true);
			else
			json.setFlag(false);
		}
		return json;
	}
	*//**
	 * 查询要修改的信息
	 *//*
	
	@RequestMapping(params = "method=getUpdateEquipment")
	public @ResponseBody Equipment_info getUpdateEquipment(String pid,HttpSession session) {
		Json json = new Json();
		Equipment_info equipment_info = equipmentManService.getUpdateEquipment(pid,(String)session.getAttribute(SessionInfo.SessionDB));
		return equipment_info;
	}
	
	*//**
	 * 修改设备信息
	 * @param equipment_info
	 * @return
	 *//*
	@RequestMapping(params = "method=updateEquipment")
	public @ResponseBody Json updateEquipment(Equipment_info equipment_info,HttpSession session) {
		Json json = new Json();
		boolean b = isNumeric0(equipment_info.getInstitutions_id());
		if(!b){
			equipment_info.setInstitutions_id(equipment_info.getInstitutions_id()));
		}	
		String dbName=(String)session.getAttribute(SessionInfo.SessionDB);
		System.out.println("------------"+equipment_info.getPlate_number());
		int singerflag=equipmentManService.checkEquipmentSinger(equipment_info.getEquipment_number(),equipment_info.getPlate_number());
		if(singerflag==0){
			int flag=equipmentManService.checkEquipment(equipment_info.getEquipment_number(),equipment_info.getEquipment_id());
			if(flag>0){
				json.setAns("设备号已存在");
			}else{
				int truck = equipmentManService.updateEquipment(equipment_info);
				if (truck > 0)
					json.setFlag(true);
				else
				json.setFlag(false);
			}
		}else{
			int truck = equipmentManService.updateEquipment(equipment_info);
			if (truck > 0) 
				json.setFlag(true);
			else
			json.setFlag(false);
		}
	
		return json;

	}
	*//**
	 * 删除设备
	 * @param del
	 * @return
	 *//*
	@RequestMapping(params = "method=deleteEquipment")
	public @ResponseBody Json delTruck(String[] del) {
		Json json = new Json();
		int truck = equipmentManService.deleteEquipment(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	
	//获取设备号检索列表
	@RequestMapping(params="method=getInfoManlength")
	public @ResponseBody String getCar_length(String search){
		List<Equipment_info> list=equipmentManService.getEquipment_number(search);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Equipment_info t: list) {
			jb=new JSONObject();
			jb.put("id", t.getEquipment_id());
			jb.put("name",t.getEquipment_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	//获取车牌号
	@RequestMapping(params="method=getCarIdlength")
	public @ResponseBody String getCarid_length(String carid){
		List<Equipment_info> list=equipmentManService.getCar_id(carid);
		System.out.println(list.size());
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Equipment_info t: list) {
			jb=new JSONObject();
			jb.put("id", t.getTravel_card_id());
			jb.put("name",t.getPlate_number1());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	//获取车牌号
	@RequestMapping(params="method=getCarIdlengthAdd")
	public @ResponseBody String getCarid_lengthAdd(String carid){
		List<Equipment_info> list=equipmentManService.getCar_idAdd(carid);
		System.out.println(list.size()+"====");
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (Equipment_info t: list) {
			jb=new JSONObject();
			jb.put("id", t.getTravel_card_id());
			jb.put("name",t.getPlate_number1());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	private static boolean isNumeric0(String str){
		  for(int i=str.length();--i>=0;){
		   int chr=str.charAt(i);
		   if(chr<48 || chr>57)
		    return false;
		  }
		  return true;
		 }
	@RequestMapping(params="method=fenpeiDepart")
	public @ResponseBody Json fenpeiDepart(Equipment_info eqi) {
		 int i=equipmentManService.updateDepart(eqi);
		 Json json=new Json();
		 if(i>0){
			 json.setFlag(true);
			 return json;
		 }
		 json.setFlag(false);
		 return json;
	}
	@RequestMapping(params="method=jieBang")
	public @ResponseBody Json jieBang(String pid,HttpSession session) {
		 Equipment_info equipment_info = equipmentManService.getUpdateEquipment(pid,(String)session.getAttribute(SessionInfo.SessionDB));
		 String equipment_number=equipment_info.getEquipment_number();
		 String plate_number=equipment_info.getPlate_number();
		 //设置成未绑定
		 int i=0;
		 int fg3=equipmentManService.jieBang(pid,"0");
		 if(fg3>0){
			 i=1;
		 }
		 Json json=new Json();
		 if(i>0){
			 json.setFlag(true);
			 return json;
		 }
		 json.setFlag(false);
		 return json;
	}
	@RequestMapping(params="method=bangding")
	public @ResponseBody Json bangding(String pid,HttpSession session){
		String dbName=(String)session.getAttribute(SessionInfo.SessionDB);
		Equipment_info equipment_info = equipmentManService.getUpdateEquipment(pid,dbName);
		String travel=equipmentManService.getCarInfo(equipment_info.getPlate_number(),dbName);
		System.out.println(travel+"\t"+equipment_info.getPlate_number());
		int bg=equipmentManService.jieBang(pid,"1");
		int bg2=equipmentManService.bangCar(travel,pid);
		Json json=new Json();
		if(bg>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	@RequestMapping(params="method=panduan")
	public @ResponseBody Json panduan(String pid,HttpSession session){
		Json json=new Json();
		String dbName=(String)session.getAttribute(SessionInfo.SessionDB);
		Equipment_info equipment_info = equipmentManService.getUpdateEquipment(pid,dbName);
		String carnumber=equipment_info.getPlate_number();
		//int truck = tc.checkTemCarName(carnumber);
		int truck2 = tc.checkTraCarName(carnumber,dbName);
		if(truck2>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	@RequestMapping(params="method=getTrave")
	public @ResponseBody Json getTrave(String carno){
		Json json=new Json();
		int truck2 = equipmentManService.getTrave(carno);
		if(truck2>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	@RequestMapping(params="method=outputEqui")
	public @ResponseBody String outputEqui(String[] headtitle,String[] fieldName,String [] eqid,String equipment_number,String carnum,String department_id,String is_binding,HttpSession session,HttpServletResponse response){
		String filename = "设备导出";
		
		String dids=(String) session.getAttribute(SessionInfo.SessionDepartment);
		String dbName=(String) session.getAttribute(SessionInfo.SessionDB);
		List<Equipment_info> list = equipmentManService.getOutPutEquipment(eqid,equipment_number,carnum,department_id,dids,dbName,is_binding);
		
		try {
			// 声明一个工作薄
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			ExportUtils.outputHeaders(headtitle,workbook,"设备列表");
			ExportUtils.outputColums(fieldName, list,workbook,1,"设备列表");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
    */