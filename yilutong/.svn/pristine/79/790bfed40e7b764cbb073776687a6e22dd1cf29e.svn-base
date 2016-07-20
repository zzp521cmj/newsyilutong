package com.jy.action;

import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportExcel;
import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.excel.bean.DriverExcel;
import com.jy.model.Agreement;
import com.jy.model.Car_owner;
import com.jy.service.AgreementService;
import com.jy.service.UserInfoService;
	/*
	 * 合同管理
	 * */
@Controller
@RequestMapping(value="/agreement.do")
public class AgreementController {
	@Resource
	private AgreementService asi;
	@Resource
	private UserInfoService uis;
	@RequestMapping(params = "method=getAgreementInfo")
	public String getAgreementInfo(String menu_id,HttpSession session) {
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
		return "agreement/AgreementInfo";
	}
	//跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditAgreementPage")
	public String getEditAgreementPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "agreement/EditAgreement";
	}

	// 全部查询
	@RequestMapping(params = "method=getAgreement")
	public @ResponseBody
	Map getAgreementInfo(String rows, String page, String agreement_name,String plate_number, String address,String start_date,String end_date) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		if(plate_number==null){
			plate_number="";
		}
		List<Agreement> list = asi.getAgreementInfo((page1 - 1) * rows1, rows1,
				agreement_name, plate_number, address,start_date,end_date);
		int count = asi.getAgreement(agreement_name, plate_number, address,start_date,end_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteAgreement")
	public @ResponseBody
	Json delTruck(String[] del) {
		Json json = new Json();
		int truck = asi.deleteAgreement(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addAgreement")
	public String addAgreement() {
		return "agreement/AddAgreement";
	}
	// 保存
	@RequestMapping(params = "method=saveAgreement")
	public @ResponseBody Json saveAgreement(Agreement d) {
		Json json = new Json();
		d.setAgreementId(UUIDUtils.getUUID());
		d.setUpdateDate(DateFormat.getDateTimeInstance().format(new Date()));
		int truck = asi.saveAgreement(d);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateAgreement")
	public @ResponseBody
	Agreement getUpdateAgreement(String agreement_id) {
		Agreement der = asi.getUpdateAgreement(agreement_id);
		return der;
	}

	// 用户修改
	@RequestMapping(params = "method=updateAgreement")
	public @ResponseBody Json  updateAgreement(Agreement d) {
		d.setUpdateDate(DateFormat.getDateTimeInstance().format(new Date()));
		Json json = new Json();
		int i = asi.updateAgreement(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * select姓名 查询
	 */
	@RequestMapping(params = "method=getAgreementLength")
	public @ResponseBody
	String getAgreementLength(String agreementName) {
		List<Agreement> list = asi.getAgreementLength(agreementName);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Agreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getAgreementId());
			jb.put("name", d.getAgreementName());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/*
	 * 车牌号检索
	 */
	@RequestMapping(params = "method=getCar_idLength")
	public @ResponseBody
	String getCar_idLength(String plate_number) {
		List<Agreement> list = asi.getCar_idLength(plate_number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Agreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	//下拉框检索
	@RequestMapping(params = "method=getAddressLength")
	public @ResponseBody
	String getAddressLength(String address) {
		List<Agreement> list = asi.getAddressLength(address);
//		for (Agreement driver : list) {
//			System.out.println(driver.getAgreementId());
//		}

		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Agreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getAgreementId());
			jb.put("name", d.getAddress());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	// 导出信息
	@RequestMapping(params = "method=outAgreement")
	public @ResponseBody
	String outputbug(String datas, String[] headtitle,String[] fieldName,
			HttpServletResponse response,String agreement_name,String plate_number, String address,String start_date,String end_date) {
		String filename = "合同导出";
		List<Agreement> list=asi.getAgreementAll(agreement_name,plate_number,address,start_date,end_date);
		//ExportExcel<Agreement> esx= new ExportExcel<Agreement>();
		try {
			// 声明一个工作薄
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
		//调用工具类创建表头
			ExportUtils.outputHeaders(headtitle,workbook,"合同信息");
		//调用工具类生成内容
			ExportUtils.outputColums(fieldName, list,workbook,1,"合同信息");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//合同信息查询
	public List<Agreement> getAgreementAll(String greement_name,String plate_number, String address,String start_date,String end_date){
		List<Agreement> list=asi.getAgreementAll(greement_name, plate_number, address, start_date, end_date);
		return list;
	}
	//即将到期合同
	@RequestMapping(params = "method=getAgreementOverdue")
	public @ResponseBody
	 List<Agreement> getAgreementOverdue(){
			//date=DateFormat.getDateInstance().format(new Date()).toString();
			List <Agreement>list=asi.getAgreementOverdue();
				return list;
		}
	//点击到期合同跳转
	@RequestMapping(params="method=getAgreementOverdueData")
	public String getAgreementOverdueData(String number,HttpServletRequest request){
		request.setAttribute("number", number);
		return "agreement/AgreementInfo";
		
	}
	//修改、新增车牌检索
	@RequestMapping(params = "method=searchAgreementNumber")
	public @ResponseBody
	String searchAgreement(String number) {
		List<Agreement> list = asi.searchAgreement(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Agreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	//线路编码查询
	@RequestMapping(params = "method=searchAgreementLinId")
	public @ResponseBody
	String searchAgreementLinId(String linbm) {
		List<Agreement> list = asi.searchAgreementLinId(linbm);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Agreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getLinid());
			jb.put("name", d.getLinbh());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	//合同号重复查询
	@RequestMapping(params = "method=searchAgreementNum")
		public  @ResponseBody Json  searchAgreementNum(String id){
			int i=asi.searchAgreementNum(id);
			Json json=new Json();
			if (i >0) {
				json.setFlag(true);
				return json;
			}else{
			json.setFlag(false);
			return json;}
		}
}
