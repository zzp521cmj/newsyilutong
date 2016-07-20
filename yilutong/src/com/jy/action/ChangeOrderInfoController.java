package com.jy.action;

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
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ChangeOrder;
import com.jy.model.CreateAgreement;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.service.ChangeOrderInfoService;
import com.jy.service.ShippingOrderInfoService;
import com.jy.csaction.BaseAction;

/*
 * 货运订单管理
 * */
@Controller
@RequestMapping(value = "/ChangeO.do")
public class ChangeOrderInfoController extends BaseAction{
	@Resource
	private ChangeOrderInfoService csi;
	@Resource
	private ShippingOrderInfoService soi;
	

	@RequestMapping(params = "method=backImg")
	public String backImg(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "back_oder/backImg";
	}
	//签收页面
	@RequestMapping(params = "method=getSignOrder")
	public String getSignOrder() {
		return "change_order/changeOrderInfo";
	}
	
	@RequestMapping(params = "method=ChangeOrderInfo")
	public String getShipOrderInfoMan() {
		return "change_order/changeOrderInfo";
	}
	
	@RequestMapping(params = "method=deliveryOrderInfo")
	public String DeliveryOrderInfo() {
		return "deliveryOrder/deliveryOrderInfo";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=AddchangeOrder")
	public String AddchangeOrder(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "change_order/AddchangeOrder";
	}
	@RequestMapping(params = "method=EditchangeOrder")
	public String EditchangeOrder(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "change_order/EditchangeOrder";
	}
	
	// 全部查询
	@RequestMapping(params = "method=getChangeOrder")
	public @ResponseBody
	Map getChangeOrderInfo(String rows, String page, String name,
			String phone_number, String type, String start_date, String end_date) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = csi.getChangeOrderInfo((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date);
		int count = csi.getChangeOrder(name, phone_number, type, start_date,
				end_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	
	
	//订单群发页面
	@RequestMapping(params = "method=OrderSendMsg")
	public String OrderSendMsg() {
		return "ordermessage/orderSendMsg";
	}
	
	/**
	 * 订单发送消息
	 * @param rows
	 * @param page
	 * @param name
	 * @param phone_number
	 * @param type
	 * @param start_date
	 * @param end_date
	 * @return
	 */
	// 全部查询
	@RequestMapping(params = "method=getOrderInfo")
	public @ResponseBody
	Map getOrderInfo(String rows, String page,String num ,String receipt,String phone,String send_type) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<ShippingOrder> list = csi.getOrderInfo((page1 - 1) * rows1,
				rows1,num , receipt, phone, send_type);
		int count = csi.getOrderInfoCount(num , receipt, phone, send_type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteChangeOrder")
	public @ResponseBody
	Json delShipOrder(String[] del) {
		Json json = new Json();
		int truck = csi.deleteChangeOrder(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	

	// 保存
	@RequestMapping(params = "method=saveChangeOrder")
	public @ResponseBody
	Json saveChangeOrder(ChangeOrder d) {
		Json json = new Json();
		String id=d.getShiping_order_id();
		int check=csi.searchOrder(id);
		if(check>0){
			d.setUpdate_time(DateFormat.getDateTimeInstance().format(new Date()));
			int up=csi.updateChangeOrder(d);
			if(up>0){
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		}else{
			d.setChange_fee_id(UUIDUtils.getUUID());
			d.setUpdate_time(DateFormat.getDateTimeInstance().format(new Date()));
			int truck = csi.saveChangeOrder(d);
			int  order=csi.updateOrder(d.getShiping_order_id());
			if (truck > 0&&order>0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		}
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateChangeOrder")
	public @ResponseBody
	ChangeOrder getUpdateShipOrder(String id) {
		ChangeOrder der = csi.getUpdateChangeOrder(id);
		return der;
	}


	// 修改
	@RequestMapping(params = "method=updateChangeOrder")
	public @ResponseBody
	Json updateChangeOrder(ChangeOrder d) {
		d.setUpdate_time(DateFormat.getDateTimeInstance().format(new Date()));
		Json json = new Json();
		int i = csi.updateChangeOrder(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * 订单查询协议类型
	 */
	@RequestMapping(params = "method=getAddOrderFee")
	public @ResponseBody
	CreateAgreement getAddOrderFee(String id) {
		CreateAgreement der = csi.getAddOrderFee(id);
		return der;
	}

	// 车牌检索
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumberLength(String number) {
		List<ShippingOrder> list = csi.getPlateNumberLength(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (ShippingOrder d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 导出信息
	@RequestMapping(params = "method=outShipOrder")
	public @ResponseBody
	String outShipOrder(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response, String name, String plate_number,
			String type, String start_date, String end_date) {
		String filename = "运单信息导出";
		List<ShippingOrder> list = csi.getShipOrderAll(name, plate_number,
				type, start_date, end_date);
		// ExportExcel<Agreement> esx= new ExportExcel<Agreement>();
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
			ExportUtils.outputHeaders(headtitle, workbook, "运单信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "运单信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 客户回单模块功能
	 *
	 */
	//跳转到客户回单页面
	@RequestMapping(params = "method=backOrderInfo")
	public String backOrderInfo() {
		return "back_oder/backOrderInfo";
	}
	
	// 回单全部查询分页
		@RequestMapping(params = "method=getBackOrderInfo")
		public @ResponseBody
		Map getBackOrderInfo(String rows, String page, String name,
				String phone_number, String type, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String costomid,String driver_id) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			if(costomid!=null&&!costomid.equals("")){
				custom_name=costomid;				
			}
			List<ShippingOrder> list = csi.getBackOrderInfo((page1 - 1) * rows1,
					rows1,  name, phone_number, type, start_date, end_date, start_date1, end_date1, start_date2, end_date2,custom_name,driver_id);
			int count = csi.getBackOrder(name, phone_number, type, start_date, end_date, start_date1, end_date1, start_date2, end_date2,custom_name,driver_id);
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
		
		@RequestMapping(params = "method=dealBackOrder")
		public @ResponseBody
		Json dealBackOrder(String[] deal) {
			Json json = new Json();
			int truck = csi.dealBackOrder(deal);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/**
		*批量接收处理取消
		*/
		@RequestMapping(params = "method=dealBackOrderUpdate")
		public @ResponseBody
		Json dealBackOrderUpdate(String[] deal) {
			Json json = new Json();
			int truck = csi.dealBackOrderUpdate(deal);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/**	
		*寄出
		**/
		@RequestMapping(params = "method=dealNotBackOrder")
		public @ResponseBody
		Json dealNotBackOrder(String[] deal,String nums,String company) {
			Json json = new Json();
			int truck = csi.dealNotBackOrder(deal,nums,company);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/*
		 * 批量寄出取消处理
		 */
		@RequestMapping(params = "method=dealOrderUpdate")
		public @ResponseBody
		Json dealOrderUpdate(String[] deal) {
			Json json = new Json();
			int truck = csi.dealOrderUpdate(deal);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		@RequestMapping(params = "method=outShipOrderHui")
		public @ResponseBody List<ShippingOrder> outShipOrderHui(HttpServletResponse response,String[] headtitle, String[] fieldName,String name,
				String phone_number, String type, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String custom_name,String[] checkarray,String driver_id,String costomid){
			String filename = "回单信息导出";	
			if(costomid!=null&&!costomid.equals("")){
				custom_name=costomid;
			}
			List<ShippingOrder> list;
			if(checkarray!=null&&checkarray.length>0){
				list = csi.outShipOrder(null, null, null, null, null, null, null, null, null, null,checkarray,null);				
			}else{
				list = csi.outShipOrder(name, phone_number, type, start_date, end_date, start_date1, end_date1, start_date2, end_date2, custom_name,null, driver_id);
				
			}
					for (ShippingOrder so : list) {
				if (so!=null) {				
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("0")) {
						so.setSend_type("客户自提");
					}
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("1")) {
						so.setSend_type("专车送货");
					} 
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("2")) {
						so.setSend_type("送货进仓");
					} 
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("3")) {
						so.setSend_type("送货上楼");
					} 
					if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("4")) {
						so.setSend_type("送货上门");
					} 
					if (so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("0")) {
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
		/**
		 * 回单信息勾选导出
		 * 
		 * **/
		@RequestMapping(params = "method=outShi")
		public @ResponseBody List<ShippingOrder> outShi(HttpServletResponse response,String[] headtitle, String[] fieldName,String[] checkarray,String driver_id){
			String filename = "回单信息导出";	
			List<ShippingOrder> list = csi.outShi(checkarray);
			for (ShippingOrder so : list) {
				if (so!=null) {				
				if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("0")) {
					so.setSend_type("客户自提");
				}
				if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("1")) {
					so.setSend_type("专车送货");
				} 
				if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("2")) {
					so.setSend_type("送货进仓");
				} 
				if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("3")) {
					so.setSend_type("送货上楼");
				} 
				if (so.getSend_type()!=null&&so.getSend_type()!="null"&&so.getSend_type().equals("4")) {
					so.setSend_type("送货上门");
				} 
				if (so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("0")) {
					so.setShipping_order_state("未出库");
				}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("1")){
					so.setShipping_order_state("配送中");
				}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("2")){
					so.setShipping_order_state("转运中");
				}  if(so.getShipping_order_state()!=null&&so.getShipping_order_state().equals("3")){
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
		// 提货全部查询分页
				@RequestMapping(params = "method=getDeliveryOrderInfo")
				public @ResponseBody
				Map getSendOrderInfo(String rows, String page, String ddId,
						String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,String costomid) {
					Integer rows1 = 0;// 当前有几行
					Integer page1 = 1;// 当前有几页
					if (rows != null && !"".equals(rows)) {
						rows1 = Integer.parseInt(rows);
					}
					if (page != null && !"".equals(page)) {
						page1 = Integer.parseInt(page);
					}
					if(costomid!=null&&!costomid.equals("")){
						kname=costomid;				
					}
					List<ShippingOrder> list = csi.getDeliveryOrderInfo((page1 - 1) * rows1,
							rows1,  ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2,kname);
					int count = csi.getDeliveryOrder(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2,kname);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("total", count);
					map.put("rows", list);
					return map;
				}
				
				@RequestMapping(params = "method=outDeliveryOrder")
				public @ResponseBody List<ShippingOrder> outDeliveryOrder(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId,
						String types, String isdelivery, String start_date, String end_date,String start_date1,String end_date1,String start_date2,String end_date2,String kname,String [] checkarray,String costomid){
					String filename = "提货单信息导出";	
					if(costomid!=null&&!costomid.equals("")){
						kname=costomid;
					}
					List<ShippingOrder> list;
					if(checkarray!=null&&checkarray.length>0){
						list = csi.outDeliveryOrder(null, null, null, null, null, null, null, null, null, null,checkarray);				
					}else{
						list = csi.outDeliveryOrder(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,null);			
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
						ExportUtils.outputHeaders(headtitle, workbook, "提货单信息导出");
						// 调用工具类生成内容
						ExportUtils.outputColums(fieldName, list, workbook, 1, "提货单信息导出");
						workbook.write(ouputStream);
						ouputStream.flush();
						ouputStream.close();
					
					} catch (Exception e) {
						e.printStackTrace();
					}
					return null;	
				}
				//打印
				@RequestMapping(params = "method=getShipOrderPrint")
				public @ResponseBody Json getShipOrderPrint(String pid[], HttpServletRequest request) {
					User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
					int i=csi.updateDyOrder(pid,user.getUsername());
				/*	ShippingOrder d = csi.getShipOrder(pid).get(0);
					if (d.getSend_type() .equals(0) ) {
						d.setSendtype("√");
					} else if (d.getSend_type() .equals(1)) {
						d.setSendtype1("√");
					}
					if (d.getCheck_type().equals("0")) {
						d.setChecktype("√");
					} else if (d.getCheck_type().equals("1")) {
						d.setChecktype1("√");
					}
					if (d.getPay_type().equals("0")) {
						d.setPaytype("现付");
					} else if (d.getPay_type().equals("1")) {
						d.setPaytype("到付");
					} else if (d.getPay_type().equals("2")) {
						d.setPaytype("月结");
					} else if (d.getPay_type().equals("3")) {
						d.setPaytype("打卡");
					}
					request.setAttribute("sp", d);
					return "shipping_order/printer";*/
					Json json = new Json();
					if(i>0){
						json.setFlag(true);
					}else{
						json.setFlag(false);
					}
					return json;
				}
				/**	
				*提货确认
				**/
				@RequestMapping(params = "method=updateFreeOrder")
				public @ResponseBody
				Json updateFreeOrder(String[] deal,HttpServletRequest request) {
					User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
					int i=csi.updateFreeOrder(deal, user.getUsername());
					Json json = new Json();
					if(i>0){
						json.setFlag(true);
					}else{
						json.setFlag(false);
					}
					return json;
				}
				
				//上传
				@RequestMapping(params = "method=up")
				public void upload(@RequestParam("file") MultipartFile file,
						HttpServletRequest request, HttpServletResponse response) {

					try {
						super.upload(file, "backshiporder", request);

						/*
						 * response.getWriter().print(super.getFileName());
						 * filename+=super.getFileName();
						 */
					} catch (Exception e) {
						e.printStackTrace();
					}

				}
				// 保存图片
				@RequestMapping(params = "method=savepit")
				public @ResponseBody
				Json saveSignShipOrder(String  ids , HttpSession session) {
					/*if (sign_order.getSign_time() == null
							|| "".equals(sign_order.getSign_time())) {
						SimpleDateFormat dateFor = new SimpleDateFormat(
								"yyyy-MM-dd hh:mm:ss");
						sign_order.setSign_time(dateFor.format(new Date()));
					}*/
					Json json = new Json();
						int ii = 0;
						String filenames = (String) session.getAttribute("filename");
						if (filenames != null) {
							String[] filenNamess = filenames.split(",");
							List<ShipperOrderImg> shiOrdImg = new ArrayList<ShipperOrderImg>();
							for (int j = 0; j < filenNamess.length; j++) {
								ShipperOrderImg sOrdImg = new ShipperOrderImg();
								sOrdImg.setImage_id(UUIDUtils.getUUID());
								sOrdImg.setOrder_id(ids);
								sOrdImg.setImageUrl(filenNamess[j]);
								shiOrdImg.add(sOrdImg);
							}
							int  b = csi.saveFilename(shiOrdImg);	
							session.setAttribute("filename","");
							if(b>0){
								json.setFlag(true);
								}else{
									json.setFlag(false);
									}					
								}														
					return json;
				}
				@RequestMapping(params = "method=getimgurl")
				public String getimgurl(String iurl, HttpServletRequest request) {
					List<ShipperOrderImg> listOrderImg = csi.getSingShiperOrderImg(iurl);
					System.out.println(listOrderImg.size());
					if (listOrderImg.size() == 0) {
						request.setAttribute("iurl", "");
					}
					request.setAttribute("iurl", listOrderImg);

					return "back_oder/orderImg";
				}
				
				@RequestMapping(params = "method=shhavepit")
				public @ResponseBody
				void  saveSignShipr(HttpSession session) {
					session.setAttribute("filename","");
				}
}
