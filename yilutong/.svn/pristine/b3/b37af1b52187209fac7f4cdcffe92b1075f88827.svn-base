package com.jy.action;
/**
 * 保险信息
 *@author lx
 */
import java.io.OutputStream;
import java.util.Calendar;
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
import com.jy.dao.Json;
import com.jy.model.Insurance;
import com.jy.model.TravelCard;
import com.jy.service.InsuranceService;
@Controller
@RequestMapping("/insurance.do")
public class InsuranceController {
		@Resource
		private InsuranceService is;
		/**
		 * 车辆信息查询
		 * @return
		 */
		@RequestMapping(params = "method=insurance")
		public String getInsurance(){
			
			return "insurance/insurance";
		}
		/**
		 * 跳转到添加界面
		 * @return
		 */
		@RequestMapping(params = "method=getAddInsurance")
		public String getAddInsurance(){
			
			return "insurance/addInsurance";
		}
		/**
		 * 添加车辆
		 * @param tem
		 * @return
		 */
		@RequestMapping(params = "method=addInsurance")
		public @ResponseBody Json addInsurance(Insurance in) {
			
			Json json = new Json();
			int add = is.addInsurance(in);
			if (add > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/**
		 * 批量删除
		 * @param del
		 * @return
		 */
		@RequestMapping(params = "method=deleteInsurance")
		public @ResponseBody Json delTem(String[] del){
			Json json = new Json();
			int tem = is.deleteInsurance(del);
			if(tem>0){
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		
		/**
		 * 获取修改信息
		 * @param temporaryCarId
		 * @return
		 */
		@RequestMapping(params = "method=getEditInsurance")
		public @ResponseBody Insurance getEditInsurance(String insuranceId){
			System.out.println(insuranceId);
			Insurance truck = is.getEditInsurance(insuranceId);
			return truck;
			
		}
		/**
		 * 去修改页面
		 * @return
		 */
		@RequestMapping(params = "method=editInsurance")
		public String editInsurance(String insuranceId,HttpServletRequest req){
			req.setAttribute("flg", insuranceId);
			return "insurance/editInsurance";
		}
		/**
		 * 修改车辆信息
		 * @param tem
		 * @return
		 */
		@RequestMapping(params = "method=updateInsurance")
		public  @ResponseBody Json editInsurance(Insurance in) {
			Json json = new Json();
			int i = is.editInsurance(in);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/**
		 * 根据车牌号查询
		 * @param search
		 * @return
		 */
		@RequestMapping(params = "method=getCarNum")
		public @ResponseBody String getCar_Num(String search){
			List<Insurance> list=is.getCar_Num(search);
			JSONObject jb=null;
			JSONArray jsons=new JSONArray();
			for (Insurance t: list) {
				jb=new JSONObject();
				jb.put("id", t.getTravelCardId());
				jb.put("name",t.getPlateNumber());
				jsons.add(jb);
			}
				return jsons.toString();
		}
		/**
		 * 分页
		 * @param page
		 * @param rows
		 * @param plateNumber
		 * @return
		 */
		@RequestMapping(params = "method=getInsurance")
		public @ResponseBody Map<String, Object> getInsurance(String page,String rows,String plateNumber){
			//当前第几页
			Integer page1 = 1;
			//当前页一共几条
			Integer rows1 = 0;
			if(page!=null && !"".equals(page)){
				page1 = Integer.parseInt(page);
			}
			if(rows!=null && !"".equals(rows)){
				rows1 = Integer.parseInt(rows);
			}
			List<Insurance> tr = is.getInsurance((page1 - 1) * rows1, rows1, plateNumber);
			int count = is.getCount(plateNumber);
			System.out.println(tr.size());
			System.out.println(count);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", tr);
			return map;
			
		}
		/**
		 * 导出保险信息
		 */
			@RequestMapping(params = "method=outputFile")
			public @ResponseBody String  outputFile(String datas, String[] headtitle,String[] fieldName,
					HttpServletResponse response,String plateNumber) {
				String filename = "保险导出";
				List<Insurance> list = is.getAllInsurance(plateNumber);
				
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
					ExportUtils.outputHeaders(headtitle,workbook,"保险列表");
				//调用工具类生成内容
					ExportUtils.outputColums(fieldName, list,workbook,1,"保险列表");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
			}
			//当月到期的
			@RequestMapping(params = "method=dangyueInsurance")
			public @ResponseBody
			List<Insurance> dangyueInsurance(){
				Calendar cal = Calendar.getInstance();
				String  year=cal.get(Calendar.YEAR)+"";
				String month=(cal.get(Calendar.MONTH)+1)+"";
				if(month.length()==1){
					month="0"+month;
				}
				List<Insurance>list=is.dangyueInsurance(year, month);
				return list;
			}
}
