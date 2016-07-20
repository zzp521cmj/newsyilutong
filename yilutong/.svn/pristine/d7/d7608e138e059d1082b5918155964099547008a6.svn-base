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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ChangeOrder;
import com.jy.model.CreateAgreement;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.ChangeOrderInfoService;
import com.jy.service.ReceiptBaobInfoService;
import com.jy.service.ShippingOrderInfoService;

/*
 * 货运订单管理
 * */
@Controller
@RequestMapping(value = "/receiptB.do")
public class ReceiptBaobInfoController {
	@Resource
	private ReceiptBaobInfoService csi;
	@Resource
	private ShippingOrderInfoService soi;
	@RequestMapping(params = "method=receiptBaob")
	public String receiptBaob() {
		return "receiptBaob/receiptOrderInfo";
	}
	
	@RequestMapping(params = "method=ddrcordInfo")
	public String ddrcordInfo() {
		return "receiptBaob/ddrcordInfo";
	}
	@RequestMapping(params = "method=dayrcordInfo")
	public String dayrcordInfo() {
		return "receiptBaob/dayrcordInfo";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=yuercordInfo")
	public String yuercordInfo() {
		return "receiptBaob/yuercordInfo";
	}
	@RequestMapping(params = "method=nianrcordInfo")
	public String nianrcordInfo() {
		return "receiptBaob/nianrcordInfo";
	}
	
	// 全部查询
	@RequestMapping(params = "method=getReceiptBaob")
	public @ResponseBody
	Map getReceiptBaobInfo(String rows, String page, String ddId, String city1,String start_date, String end_date,
			String start_date1, String end_date1, String pay_type, String fhname) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = csi.getReceiptBaobInfo((page1 - 1) * rows1,
				rows1, ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname);
		int count = csi.getReceiptBaob(ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
		/*
		 * 批量接收处理
		 *  int dealBackOrderUpdate(@Param("array") String[] deal);//处理成接收取消
	 int dealOrderUpdate(@Param("array") String[] deal);
		 */
		/**
		*年
		*/
		@RequestMapping(params = "method=getOrderInfoY")
		public @ResponseBody
		Json getOrderInfoY(String statrt ,String end,String name) {
			 String s="0";
				Json json = new Json();		
				String[] nums=new String[5];
				 List<ShippingOrder> list=csi.getOrderInfoY(statrt, end, name);
				 for(ShippingOrder sd:list){				
					if(sd.getCensustimess().equals("第一季度")){
						nums[0]=sd.getCensusnum()+"";
					}else if(sd.getCensustimess().equals("第二季度")){
						nums[1]=","+sd.getCensusnum();
					}else if(sd.getCensustimess().equals("第三季度")){
						nums[2]=","+sd.getCensusnum();		
					}else{
						nums[3]=","+sd.getCensusnum();
					}
					
				 }
				 for(int i=0;i<nums.length;i++){								
					 if(nums[i]==null&&i>0){
						 nums[i]=",0";
					 }else if(nums[i]==null&&i==0){
						 nums[i]="0";
					 }
				 }		
				 String[] ss=(nums[0]+nums[1]+nums[2]+nums[3]).split(",");
				 for(int i=0;i<ss.length;i++){								
					 if(Integer.parseInt(ss[i])>Integer.parseInt(s)){					
							s=(Integer.parseInt(ss[i])+150)+"";
						}
				 }		
				 nums[4]=";"+s;
				int truck =list.size();
				 if (truck > 0) {				 
					json.setAns(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]);
					return json;
				}
				json.setAns("err");
				return json;
		}
		/**	
		*天
		**/
		@RequestMapping(params = "method=getOrderInfoT")
		public @ResponseBody
		Json getOrderInfoT(String statrt ,String end,String name) {
			 String s="0";
			Json json = new Json();		
			String[] nums=new String[7];
			 List<ShippingOrder> list=csi.getOrderInfoT(statrt, end, name);
			 for(ShippingOrder sd:list){							
				 if(sd!=null){
						if(sd.getCensustimess().equals("4")){
							nums[0]=sd.getCensusnum()+"";
						}else if(sd.getCensustimess().equals("8")){
							nums[1]=","+sd.getCensusnum();
						}else if(sd.getCensustimess().equals("12")){
							nums[2]=","+sd.getCensusnum();
						}else if(sd.getCensustimess().equals("16")){
							nums[3]=","+sd.getCensusnum();
						}else if(sd.getCensustimess().equals("20")){
							nums[4]=","+sd.getCensusnum();
						}else{
							nums[6]=","+sd.getCensusnum();
						}			 
				 }							
			 }
			 System.out.println("+++++");
			 for(int i=0;i<nums.length;i++){								
				 if(nums[i]==null&&i>0){
					 nums[i]=",0";
				 }else if(nums[i]==null&&i==0){
					 nums[i]="0";
				 }
			 }		
			 String[] ss=(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]+nums[5]).split(",");
			 for(int i=0;i<ss.length;i++){								
				 if(Integer.parseInt(ss[i])>Integer.parseInt(s)){					
						s=(Integer.parseInt(ss[i])+50)+"";
					}
			 }		
			 nums[6]=";"+s;
			int truck =list.size();
			 if (truck > 0) {				 
				json.setAns(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]+nums[5]+nums[6]);
				return json;
			}
			json.setAns("err");
			return json;
		}
		/**	
		*天
		**/
		@RequestMapping(params = "method=getOrderInfoD")
		public @ResponseBody
		Json getOrderInfoD(String statrt ,String end,String name) {
			 String s="0";
			Json json = new Json();		
			String[] nums=new String[8];
			 List<ShippingOrder> list=csi.getOrderInfoD(statrt, end, name);
			 for(ShippingOrder sd:list){				
				if(sd.getCensustimess().equals("周一")){
					nums[0]=sd.getCensusnum()+"";
				}else if(sd.getCensustimess().equals("周二")){
					nums[1]=","+sd.getCensusnum();
				}else if(sd.getCensustimess().equals("周三")){
					nums[2]=","+sd.getCensusnum();
				}else if(sd.getCensustimess().equals("周四")){
					nums[3]=","+sd.getCensusnum();
				}else if(sd.getCensustimess().equals("周五")){
					nums[4]=","+sd.getCensusnum();
				}else if(sd.getCensustimess().equals("周六")){
					nums[5]=","+sd.getCensusnum();
				}else{
					nums[6]=","+sd.getCensusnum();
				}
				
			 }
			 for(int i=0;i<nums.length;i++){								
				 if(nums[i]==null&&i>0){
					 nums[i]=",0";
				 }else if(nums[i]==null&&i==0){
					 nums[i]="0";
				 }
			 }		
			 String[] ss=(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]+nums[5]+nums[6]).split(",");
			 for(int i=0;i<ss.length;i++){								
				 if(Integer.parseInt(ss[i])>Integer.parseInt(s)){					
						s=(Integer.parseInt(ss[i])+50)+"";
					}
			 }		
			 nums[7]=";"+s;
			int truck =list.size();
			 if (truck > 0) {				 
				json.setAns(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]+nums[5]+nums[6]+nums[7]);
				return json;
			}
			json.setAns("err");
			return json;
		}
		/*
		 * 月
		 */
		@RequestMapping(params = "method=getOrderInfoM")
		public @ResponseBody
		Json getOrderInfoM(String statrt ,String end,String name) {
			 String s="0";
				Json json = new Json();		
				String[] nums=new String[7];
				 List<ShippingOrder> list=csi.getOrderInfoM(statrt, end, name);
				 for(ShippingOrder sd:list){				
					if(sd.getCensustimess().equals("5")){
						nums[0]=sd.getCensusnum()+"";
					}else if(sd.getCensustimess().equals("10")){
						nums[1]=","+sd.getCensusnum();
					}else if(sd.getCensustimess().equals("15")){
						nums[2]=","+sd.getCensusnum();
					}else if(sd.getCensustimess().equals("20")){
						nums[3]=","+sd.getCensusnum();
					}else if(sd.getCensustimess().equals("25")){
						nums[4]=","+sd.getCensusnum();					
					}else{
						nums[6]=","+sd.getCensusnum();
					}
					
				 }
				 for(int i=0;i<nums.length;i++){								
					 if(nums[i]==null&&i>0){
						 nums[i]=",0";
					 }else if(nums[i]==null&&i==0){
						 nums[i]="0";
					 }
				 }		
				 String[] ss=(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]+nums[5]).split(",");
				 for(int i=0;i<ss.length;i++){								
					 if(Integer.parseInt(ss[i])>Integer.parseInt(s)){					
							s=(Integer.parseInt(ss[i])+100)+"";
						}
				 }		
				 nums[6]=";"+s;
				int truck =list.size();
				 if (truck > 0) {				 
					json.setAns(nums[0]+nums[1]+nums[2]+nums[3]+nums[4]+nums[5]+nums[6]);
					return json;
				}
				json.setAns("err");
				return json;
		}
		//导出
		@RequestMapping(params = "method=outReceiptBaob")
		public @ResponseBody List<ShippingOrder> outReceiptBaob(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String city1,String start_date, String end_date,
				String start_date1, String end_date1, String pay_type, String fhname,String []checkarray){
			String filename = "收货信息导出";	
			List<ShippingOrder> list ;
			if(checkarray!=null&&checkarray.length>0){
				list = csi.outReceiptBaob(null, null, null, null, null, null, null, null,checkarray);
			}else{
				list = csi.outReceiptBaob(ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname,null);
			}
			
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
				ExportUtils.outputHeaders(headtitle, workbook, "收货信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName, list, workbook, 1, "收货信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
		}
		/**
		 * 信息勾选导出
		 * 
		 * **/
		@RequestMapping(params = "method=outShi")
		public @ResponseBody List<ShippingOrder> outShi(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String city1,String start_date, String end_date,
				String start_date1, String end_date1, String pay_type, String fhname,String []checkarray){
			String filename = "回单信息导出";	
			List<ShippingOrder> list = csi.outReceiptBaob(ddId, city1, start_date, end_date, start_date1, end_date1, pay_type, fhname,null);
			
			for (ShippingOrder so : list) {
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
			}
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
				ExportUtils.outputHeaders(headtitle, workbook, "回单信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName, list, workbook, 1, "回单信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
		}
}
