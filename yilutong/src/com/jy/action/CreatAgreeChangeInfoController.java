package com.jy.action;

import java.io.File;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.jy.common.ExportUtils;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;

import com.jy.model.CreateAgreement;
import com.jy.model.GuanlianCA;
import com.jy.service.CreatAgreeChangeService;

/*
 * 货运订单管理
 * */
@Controller
@RequestMapping(value = "/changeA.do")
public class CreatAgreeChangeInfoController{
	@Resource
	private CreatAgreeChangeService csi;

	@RequestMapping(params = "method=getCreateAgreeInfo")
	public String getCreateAgreementInfoMan() {
		return "creatAgreeChange/createAgreeChangeInfo";
	}
	//跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditCreateAgreePage")
	public String getEditCreateAgreementPage(String[] pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "create_agreement/EditCreateAgreement";
	}
	//制作跳转页面
	@RequestMapping(params = "method=getChangeAPage")
	public String getCreateAgreementPage() {
		return "create_agreement/searchCreateAgreement";
	}
	// 跳转到详细页面
		@RequestMapping(params = "method=xiangxiEditChangeA")
		public String XxCreateAgreement(String pid,HttpServletRequest request) {
			request.setAttribute("pid", pid);
			return "create_agreement/xiangxiECAgreement";
		}
	
		/**
		 * 删除单个文件
		 * 
		 * @param sPath
		 *            被删除文件的文件名
		 * @return 单个文件删除成功返回true，否则返回false
		 */
		public boolean deleteFile(String sPath) {
			boolean flag;
			flag = false;
			File file = new File(sPath);
			// 路径为文件且不为空则进行删除
			if (file.isFile() && file.exists()) {
				file.delete();
				flag = true;
			}
			return flag;
		}
	
	// 全部查询
	@RequestMapping(params = "method=getChangeA")
	public @ResponseBody
	Map getCreateAgreementInfo(String rows, String page, String id,String start_date,String end_date,String departid) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<CreateAgreement> list = csi.getCreateAgreementInfo((page1 - 1) * rows1, rows1,id,start_date,end_date,departid);
		int count = csi.getCreateAgreement(id,start_date,end_date,departid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	/*
	 * 批量转接协议
	 */
	@RequestMapping(params = "method=delchangeA")
	public @ResponseBody
	Json delchangeA(String[] del) {
		List<GuanlianCA> list=csi.orderNumber(del);
		int order=csi.delState(list);
		Json json = new Json();
		int truck = csi.delCreateAgreement(del);
		if (order>0&&truck>0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	
	// 保存
	@RequestMapping(params = "method=saveChangeA")
	public @ResponseBody Json saveCreateAgreement(CreateAgreement d,String[] pid) {
		List <GuanlianCA>list = new ArrayList<GuanlianCA>();
		Json json = new Json();
		d.setAgreement_id(UUIDUtils.getUUID());
		for(int i=0;i<pid.length;i++){
			GuanlianCA ca=new GuanlianCA();
			ca.setOrder_id(pid[i]);
			ca.setAgreement_id(d.getAgreement_id());
			ca.setId(UUIDUtils.getUUID());
			list.add(ca);
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String number=dateFormat.format(new Date());
		d.setAgreement_number(number.substring(0,4)+number.substring(5, 7)+number.substring(8,10)+number.substring(11, 13)+number.substring(14, 16)+number.substring(17,19));
		d.setCreate_time(number);
		d.setNumber(pid.length);
		System.out.println(d.getNumber());
		int truck = csi.saveCreateAgreement(d);
		int create=csi.saveAgreementToorder(list);
		int state=csi.updateState(pid);
		if (truck > 0&&create>0&&state>0) {
			json.setFlag(true);
			return json;
		}else{
			json.setFlag(false);
			return json;	
		}
		
	}
	// 修改查询
	@RequestMapping(params = "method=getUpdateChangeA")
	public @ResponseBody
	CreateAgreement getUpdateCreateAgreement(String id) {
		CreateAgreement der = csi.getUpdateCreateAgreement(id);
		return der;
	}
	
	// 修改查询
		@RequestMapping(params = "method=getXXChangeA")
		public @ResponseBody
		List<GuanlianCA> getXXCreateAgreement(String id) {
			List<GuanlianCA> der = csi.getXXCreateAgreement(id);
			return der;
		}
	// 导入页面
	@RequestMapping(params = "method=inputChangeA")
	public String inputCreateAgreement() {
		return "driver/InputDriver";
	}

	// 修改
	@RequestMapping(params = "method=updateChangeA")
	public @ResponseBody Json  updateCreateAgreement(CreateAgreement d) {
			d.setCreate_time(DateFormat.getDateTimeInstance().format(new Date()));
			Json json = new Json();
			int i = csi.updateCreateAgreement(d);
			if(i>0){
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
	}

	/*
	 * 重复查询
	 */
	@RequestMapping(params = "method=getNumber")
	public @ResponseBody
	CreateAgreement getCreateAgreementLength(String number) {
		CreateAgreement der = csi.getNumber(number);
		return	der;
	}

	//车牌检索
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumberLength(String number) {
		List<CreateAgreement> list = csi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (CreateAgreement d : list) {
			jb = new JSONObject();
			jb.put("id", d.getCar_id());
			jb.put("name", d.getCar_number1());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 导出信息
		@RequestMapping(params = "method=outChangeA")
		public @ResponseBody
		String outCreateAgreement(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String id,String start_date,String end_date) {
			String filename = "协议信息导出";
			List<CreateAgreement> list=csi.getCreateAgreementAll( id,start_date,end_date);
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
				ExportUtils.outputHeaders(headtitle,workbook,"协议信息导出");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"协议信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
}
