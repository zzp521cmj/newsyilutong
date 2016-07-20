package com.jy.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.model.Remark;
import com.jy.model.RemarkRange;
import com.jy.model.Warehouse;
import com.jy.service.UserInfoService;
import com.jy.service.WarehouseService;

@Controller
@RequestMapping(value = "/warehouse.do")
public class WarehouseController {
	@Resource
	private WarehouseService rms;
	@Resource
	private UserInfoService uis;
	@RequestMapping(params = "method=getaddRemarkMap")
	public String remarkMap(String menu_id,HttpSession session) {
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
		return "warehouse/remarkMap";
	}
		@RequestMapping(params = "method=getRemarkMap")
		public String addremarkMap() {
			return "warehouse/addremarkMap";
		}
		@RequestMapping(params = "method=remarkMapmodify")
		public String remarkMapmodify(String id,HttpServletRequest request) {
			request.setAttribute("id", id);
			return "warehouse/addremarkMap";
		}
		/**
		 * 获取指定标注 
		 */
		@RequestMapping(params="method=getRemark")
		public @ResponseBody Warehouse getRemark(String id){
			return rms.getRemark(id);
		}
		/**
		 * 删除指定标注 
		 */
		@RequestMapping(params="method=deleteRemark")
		public @ResponseBody boolean deleteRemark(String id){
			return rms.deleteRemark(id);
		}
		/**
		 * 标注分页
		 */
		@RequestMapping(params="method=getRemarks")
		public @ResponseBody Map<String,Object> getRemarks(String page,String rows,String warehouse_name,String warehouse_tel,String warehouse_address){
			//当前第几页
			Integer page2=1;
			//当前页一共几条
			Integer rows1=0;
			if(page!=null&&!"".equals(page)){
				page2= Integer.parseInt(page);
			}
			if(rows!=null&&!"".equals(rows)){
				rows1= Integer.parseInt(rows);
			}
			int total = rms.getCount(warehouse_name,warehouse_tel,warehouse_address);
			List<Warehouse> list=rms.getRemarks((page2-1)*rows1,rows1,warehouse_name,warehouse_tel,warehouse_address);
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("total", total);
			map.put("rows", list);
			return map;
		}
		/*// 获取标注类型信息
		@RequestMapping(params = "method=getTypes")
		public @ResponseBody
		List<Map<String, Object>> getTypes() {
			List<RemarkType> type = rms.getTypes();
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for (RemarkType rt : type) {
				map = new HashMap<String, Object>();
				map.put("id",rt.getRemark_type_id());
				map.put("text", rt.getRemark_type_name());
				if(rt.getRemark_type_name().equals("无")){
					map.put("selected", true);
					
				}
				list.add(map);
			}
			return list;
		}*/
		// 获取标注范围信息
				@RequestMapping(params = "method=getRange")
				public @ResponseBody
				List<Map<String, Object>> getRange() {
					List<RemarkRange> range = rms.getRange();
					List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
					Map<String, Object> map = null;
					for (RemarkRange rr : range) {
						map = new HashMap<String, Object>();
						map.put("id",rr.getRemark_range_id());
						map.put("text", rr.getRemark_range_name());
						/*if(rr.getRemark_range_name().equals("100米")){
							map.put("selected", true);
						}*/
						list.add(map);
					}
					return list;
				}
				@RequestMapping(params="method=getOneRange")
				public @ResponseBody int getOneRange(String id){
					String name =  rms.getOneRange(id);
					return Integer.parseInt(name.substring(0,name.length()-1));
				}
				@RequestMapping(params="method=checkName")
				public @ResponseBody boolean checkName(String name){
					boolean b = rms.checkName(name);
					return b;
				}
				@RequestMapping(params="method=checkRemark")
				public @ResponseBody boolean checkRemark(String id){
					boolean b = rms.checkRemark(id);
					return b;
				}
				@RequestMapping(params="method=getModifyPeople")
				public @ResponseBody String getModifyPeople(Integer people){
					return rms.getModifyPeople(people);
				}
				/**
				 * 查询标记名称
				 */
				@RequestMapping(params="method=getRemarkName")
				public @ResponseBody String getRemarkName(String name,String state){
					List<Remark> list=rms.getRemarkName(name,state);
					JSONObject jb=null;
					JSONArray jsons=new JSONArray();
					for (Remark r: list) {
						jb=new JSONObject();
						jb.put("id", r.getRemark_id());
						jb.put("name",r.getRemark_name());
						jsons.add(jb);
					}
						return jsons.toString();
				}
				/**
				 * 查询标记联系方式
				 */
				@RequestMapping(params="method=getRemarktel")
				public @ResponseBody String getRemarktel(String name,String state){
					List<Remark> list=rms.getRemarkName(name,state);
					JSONObject jb=null;
					JSONArray jsons=new JSONArray();
					for (Remark r: list) {
						jb=new JSONObject();
						jb.put("id", r.getRemark_id());
						jb.put("name",r.getRemark_tel());
						jsons.add(jb);
					}
						return jsons.toString();
				}
				/**
				 * 查询标记名称
				 */
				@RequestMapping(params="method=getRemarkaddress")
				public @ResponseBody String getRemarkaddress(String name,String state){
					List<Remark> list=rms.getRemarkName(name,state);
					
					JSONObject jb=null;
					JSONArray jsons=new JSONArray();
					for (Remark r: list) {
						jb=new JSONObject();
						jb.put("id", r.getRemark_id());
						jb.put("name",r.getRemark_address());
						jsons.add(jb);
					}
						return jsons.toString();
				}
				/**
				 * 添加一个标注 
				 */
				@RequestMapping(params="method=saveRemark")
				public String saveremark(Warehouse warehouse,String kkk){
					UUIDUtils uuid = new UUIDUtils();
					warehouse.setWarehouse_id(uuid.getUUID());
					rms.addRemark(warehouse);
					if(kkk.equals("save")){
					return "warehouse/remarkMap";
					}else{
						return "warehouse/addremarkMap";
						
					}
					
				}
				/**
				 * 更新一个标注 
				 */
				@RequestMapping(params="method=updateRemark")
				public String updateremark(Warehouse warehouse,String kkk){
					/*System.out.println("warehouse.getWarehouse_id()"+warehouse.getWarehouse_id());
					System.out.println("warehouse.getWarehouse_num()"+warehouse.getWarehouse_num());
					System.out.println("warehouse.getWarehouse_name()"+warehouse.getWarehouse_name());
					System.out.println("warehouse.getWarehouse_point()"+warehouse.getWarehouse_point());
					System.out.println("warehouse.getWarehouse_address()"+warehouse.getWarehouse_address());*/
					rms.updateRemark(warehouse);
					if(kkk.equals("save")){
					return "warehouse/remarkMap";
					}else{
						return "warehouse/addremarkMap";
						
					}
					
				}
				private static boolean isNumeric0(String str){
					  for(int i=str.length();--i>=0;){
					   int chr=str.charAt(i);
					   if(chr<48 || chr>57)
					    return false;
					  }
					  return true;
					 }
}
