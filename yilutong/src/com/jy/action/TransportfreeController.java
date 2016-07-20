package com.jy.action;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ShippingOrder;
import com.jy.model.TranspfreeCheckeds;
import com.jy.model.Transportfree;
import com.jy.model.User;
import com.jy.service.TransportfreeService;

/*
 * 运费调整
 * */
@Controller
@RequestMapping(value = "transpfree.do")
public class TransportfreeController {
	
	@Resource
	private TransportfreeService bid;
	
	//运费调整记录主页面
	@RequestMapping(params="method=TransportfreeRC")
	public String TransportfreeRC(HttpServletRequest request,String pid){
		request.setAttribute("pid", pid);
		return "transportfree/transportfrecordInfo";
	}
	//运费调整审核历史记录主页面
		@RequestMapping(params="method=TranspfreeShRC")
		public String TranspfreeShRC(HttpServletRequest request,String pid){
			request.setAttribute("pid", pid);
			return "transportfreeSh/shrcordInfo";
		}
	//运费调整审核主页面
	@RequestMapping(params="method=TransportfreeShPage")
	public String TransportfreeShPage(){
		return "transportfreeSh/transportfreeShInfo";
	}
	//运费调整主页面
	@RequestMapping(params="method=TransportfreePage")
	public String getTransportfreeSearchPage(){
		return "transportfree/transportfreeInfo";
	}
	//跳转到提审页面
	@RequestMapping(params="method=thTraspfree")
	public String ThTraspfree(HttpServletRequest request,String []pid){
		request.setAttribute("pid", pid);
		return "transportfree/thTraspfree";
	}
	//跳转到单个审核页面
		@RequestMapping(params="method=shTraspfree")
		public String shTraspfree(HttpServletRequest request,String []pid){
			
			request.setAttribute("pid", pid[0]);
			return "transportfreeSh/shtraspfree";
		}
	//跳转到调整运费页面
	@RequestMapping(params="method=edittraspfree")
	public String Edittraspfree(HttpServletRequest request,String []pid){
		request.setAttribute("pid", pid[0]+","+pid[1]+","+pid[2]);
		return "transportfree/edittraspfree";
	}
	//运费调整查询
	@RequestMapping(params = "method=getTransportfree")
	public @ResponseBody
	Map<String,Object> getTransportfreeInfo(String rows, String page,String ddId, String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname) {
		//当前第几页
				Integer page1 = 1;
				//当前页一共几条
				Integer rows1 = 0;
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = bid.getTransportfreeInfo((page1 - 1) * rows1,rows1 , ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
		int count = bid.getTransportfree(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
//		JSONObject json=new JSONObject();
//		json.put("rows", list);
//		System.out.println(json.toString());
		return map;
	}
	//审核信息保存
	public List<TranspfreeCheckeds> saveTranspchecks(String [] orderid,String checks_type,String checks_notes,String checks_state,String checks_user) {
		List<TranspfreeCheckeds> list=new ArrayList<TranspfreeCheckeds>();
		for(String id:orderid){
			TranspfreeCheckeds s=new TranspfreeCheckeds();
			s.setChecks_id(UUIDUtils.getUUID());
			s.setOrderid(id);
			s.setChecks_type(checks_type);
			s.setChecks_notes(checks_notes);
			s.setChecks_state(checks_state);
			s.setChecks_user(checks_user);
			list.add(s);
		}
		return list;
	}
	//运费调整
	public List<Transportfree> saveTransportFree(String [] orderid,String formerfree,String formerchange,String newfree,
			String downfree,String newchange,String changeuser,String changeremark) {	
		List<Transportfree> list=new ArrayList<Transportfree>();
		for(String id:orderid){
			Transportfree s=new Transportfree();
			s.setChangefreeid(UUIDUtils.getUUID());
			s.setOrderid(id);
			s.setFormerfree(formerfree);
			s.setFormerchange(formerchange);
			s.setNewfree(newfree);
			s.setDownfree(downfree);
			s.setNewchange(newchange);
			s.setChangeuser(changeuser);
			s.setChangeremark(changeremark);
			list.add(s);
		}
		return list;
	}
	/*
	 * 调整运费
	 */
	@RequestMapping(params = "method=changePrice")
	public @ResponseBody
	Json addTransportfree(String dds,String price,String price1, String remarks,HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
		String[] re=dds.split(",");
		Transportfree s=new Transportfree();
		s.setChangefreeid(UUIDUtils.getUUID());
		s.setOrderid(re[0]);
		s.setFormerfree(price);
		if(re.length==3){
			s.setFormerchange(re[2]);
		}else{
			s.setFormerchange("0,"+price);
		}
		s.setNewfree(price1+".00");
		s.setDownfree("-"+price);
		s.setNewchange("-"+price+","+price1+".00");
		s.setChangeuser(user.getId());
		s.setChangeremark(remarks);
		Json json = new Json();
		bid.saveTransportFree(s);
		int truck=bid.addTransportfree(re[0], price,s.getChangeuser(), s.getChangeremark(), price1+".00");		
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	/*
	 * 调整运费提审
	 */
	@RequestMapping(params = "method=delTransportfree")
	public @ResponseBody
	Json delTransportfree(String[] dds,String did,String notes,HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
		Json json = new Json();
		bid.saveTranspchecks(saveTranspchecks(dds, "0", notes,"2", user.getId()));
		int truck=bid.delTransportfree(dds, did, user.getId(), notes);	
		if (truck > 0) {		
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	
	//运费调整审核查询
		@RequestMapping(params = "method=getTransportfreeSHInfo")
		public @ResponseBody
		Map<String,Object> getTransportfreeSHInfo(String rows, String page,String ddId, String types, String isdelivery, String start_date,
				String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname) {
			//当前第几页
					Integer page1 = 1;
					//当前页一共几条
					Integer rows1 = 0;
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = bid.getTransportfreeSHInfo((page1 - 1) * rows1,rows1 , ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
			int count = bid.getTransportfreeSH(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
//			JSONObject json=new JSONObject();
//			json.put("rows", list);
//			System.out.println(json.toString());
			return map;
		}
	/*
	 * 调整运费审核通过
	 */
	@RequestMapping(params = "method=transportfreeTG")
	public @ResponseBody
	Json shTransportfreeTG(String[] ids,String notes,HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
		Json json = new Json();
		bid.saveTranspchecks(saveTranspchecks(ids, "1", notes,"1", user.getId()));
		int truck=bid.shTransportfree(ids, "2", user.getId(), notes);		
		if (truck > 0) {			
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	/*
	 * 调整运费审核驳回
	 */
	@RequestMapping(params = "method=transportfreeBH")
	public @ResponseBody
	Json shTransportfreeBH(String[] ids,String notes,HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
		Json json = new Json();
		bid.saveTranspchecks(saveTranspchecks(ids, "1", notes,"0", user.getId()));
		int truck=bid.shTransportfree(ids, "3", user.getId(), notes);		
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
/*//车牌检索
	@RequestMapping(params = "method=getCar_idLength")
	public @ResponseBody
	String getCar_idLength(String plate_number) {
		List<CityAgreement> list = bid.getCar_idLength(plate_number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (CityAgreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getId());
			jb.put("name", d.getCar_id());
			jsons.add(jb);
		}
		return jsons.toString();
	}*/
	
	//运费调整记录查询
			@RequestMapping(params = "method=getTransportfreeRc")
			public @ResponseBody
			Map<String,Object> getTransportfreeRc(String rows, String page,String start_date, String end_date,
					String ddids) {
				//当前第几页
						Integer page1 = 1;
						//当前页一共几条
						Integer rows1 = 0;
				if (rows != null && !"".equals(rows)) {
					rows1 = Integer.parseInt(rows);
				}
				if (page != null && !"".equals(page)) {
					page1 = Integer.parseInt(page);
				}
				List<Transportfree> list = bid.getTransportfreeRc((page1 - 1) * rows1,rows1 , start_date, end_date, ddids);
				int count = bid.getTransportfreeRcs(start_date, end_date, ddids);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total", count);
				map.put("rows", list);
//				JSONObject json=new JSONObject();
//				json.put("rows", list);
//				System.out.println(json.toString());
				return map;
			}
			
			//运费调整审核记录查询
			@RequestMapping(params = "method=getTranfreeShRc")
			public @ResponseBody
			Map<String,Object> getTranfreeShRc(String rows, String page,String start_date, String end_date,
					String ddids) {
				//当前第几页
						Integer page1 = 1;
						//当前页一共几条
						Integer rows1 = 0;
				if (rows != null && !"".equals(rows)) {
					rows1 = Integer.parseInt(rows);
				}
				if (page != null && !"".equals(page)) {
					page1 = Integer.parseInt(page);
				}
				List<TranspfreeCheckeds> list = bid.getTranfreeShRc((page1 - 1) * rows1,rows1 , start_date, end_date, ddids);
				int count = bid.getTranfreeShRcs(start_date, end_date, ddids);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total", count);
				map.put("rows", list);
//				JSONObject json=new JSONObject();
//				json.put("rows", list);
//				System.out.println(json.toString());
				return map;
			}
			
			@RequestMapping(params = "method=getTransportfreeOut")
			public @ResponseBody List<ShippingOrder> getTransportfreeOut(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String types, String isdelivery, String start_date,
					String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname,String [] checkarray){
				String filename = "运费调整信息导出";	
				List<ShippingOrder> list;
				if(checkarray!=null&&checkarray.length>0){
					list= bid.getTransportfreeOut(null, null, null, null, null, null, null, null, null, null,checkarray);					
				}else{
					list= bid.getTransportfreeOut(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,null);
					
				}
					/*	for (ShippingOrder so : list) {
					if (so!=null) {				
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("0")) {
						so.setSend_type("自提");
					} if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("1")) {
						so.setSend_type("送货");
					} if (so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("0")) {
						so.setShipping_order_state("受理");
					}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("1")){
						so.setShipping_order_state("在途");
					}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("2")){
						so.setShipping_order_state("到达");
					}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("4")){
						so.setShipping_order_state("签收");
					} 		 if (so.getIs_receive().equals("0")) {
						so.setIs_receive("未接收");
					}  if (so.getIs_receive().equals("1")) {
						so.setIs_receive("已接收");
					}
				   if (so.getIs_send().equals("0")) {
						so.setIs_send("未寄出");
					} 
				   if (so.getIs_send().equals("1")) {
						so.setIs_send("已寄出");
				}
			    }	
				}*/
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
					ExportUtils.outputHeaders(headtitle, workbook, "运费调整信息导出");
					// 调用工具类生成内容
					ExportUtils.outputColums(fieldName, list, workbook, 1, "运费调整信息导出");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();
				
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;	
			}
			//运费调整审核信息导出
			@RequestMapping(params = "method=getTransportfreeShOut")
			public @ResponseBody List<ShippingOrder> getTransportfreeShOut(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String types, String isdelivery, String start_date,
					String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname,String [] checkarray){
				String filename = "运费调整审核信息导出";	
				List<ShippingOrder> list;
				if(checkarray!=null&&checkarray.length>0){
					list= bid.getTransportfreeShOut(null, null, null, null, null, null, null, null, null, null,checkarray);					
				}else{
					list= bid.getTransportfreeShOut(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,null);
					
				}
					/*	for (ShippingOrder so : list) {
					if (so!=null) {				
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("0")) {
						so.setSend_type("自提");
					} if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("1")) {
						so.setSend_type("送货");
					} if (so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("0")) {
						so.setShipping_order_state("受理");
					}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("1")){
						so.setShipping_order_state("在途");
					}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("2")){
						so.setShipping_order_state("到达");
					}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("4")){
						so.setShipping_order_state("签收");
					} 		 if (so.getIs_receive().equals("0")) {
						so.setIs_receive("未接收");
					}  if (so.getIs_receive().equals("1")) {
						so.setIs_receive("已接收");
					}
				   if (so.getIs_send().equals("0")) {
						so.setIs_send("未寄出");
					} 
				   if (so.getIs_send().equals("1")) {
						so.setIs_send("已寄出");
				}
			    }	
				}*/
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
					ExportUtils.outputHeaders(headtitle, workbook, "运费调整审核信息导出");
					// 调用工具类生成内容
					ExportUtils.outputColums(fieldName, list, workbook, 1, "运费调整审核信息导出");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();
				
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;	
			}
}
