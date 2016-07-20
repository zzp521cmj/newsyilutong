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
import com.jy.model.CreateAgreement;

import com.jy.model.Delivery_Audit;
import com.jy.model.Delivery_Clearing;
import com.jy.model.Settle_history;


import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.DistributionService;

@Controller
@RequestMapping(value = "/distribu.do")
public class DistributionController {
	
	@Resource
	private DistributionService dse;
	
	//跳转到主页面
	@RequestMapping(params="method=deal")
	public String deal(){
		return "distribution/distributionInfo";
	}
	//配送费结算运单页面
		@RequestMapping(params="method=settlementYfPage")
		public String getSettlementYfSearchPage(HttpServletRequest request,String pid){
			request.setAttribute("pid", pid);
			return "distribution/distributionDeal";
		}
		//跳转到结算运费页面
		@RequestMapping(params="method=edSettlement")
		public String edSettlement(HttpServletRequest request,String []pid){
			request.setAttribute("pid", pid);
			return "distribution/distributionAccounts";
		}
		//跳转到提审页面
		@RequestMapping(params="method=thSettlement")
		public String ThTraspfree(HttpServletRequest request,String []pid){
			request.setAttribute("pid", pid);
			return "distribution/distributionSettl";
		}
		//运费结算记录主页面
		@RequestMapping(params="method=setlRcordInfo")
		public String SettlementYfRC(HttpServletRequest request,String pid,String state){
			request.setAttribute("pid", pid);
			request.setAttribute("state", state);
			return "distribution/distributionRcordInfo";
		}
		//运费结算审核主页面
		@RequestMapping(params="method=settlementYfSh")
		public String SettlementYfShPage(){
			return "distribution_audit/settlementYfShInfo";
		}
		
		//跳转到单个审核页面
				@RequestMapping(params="method=shSettlement")
				public String shTraspfree(HttpServletRequest request,String []pid){			
					request.setAttribute("pid", pid[0]);
					return "distribution_audit/shSettlement";
				}
				
				//运费结算审核历史记录主页面
				@RequestMapping(params="method=settlementShRC")
				public String settlementShRC(HttpServletRequest request,String pid){
					request.setAttribute("pid", pid);
					return "distribution_audit/shrcordInfo";
				}
	//协议查询
	@RequestMapping(params = "method=getCustomerSetYf")
	public @ResponseBody Map<String,Object> getCustomerSetYf(String rows, String page,String ddId,
			String types, String isdelivery, String start_date,
			String end_date, String start_date1, String end_date1,
			String start_date2, String end_date2,String sort,String order,String carname) {
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
			List<CreateAgreement> list = dse.getCustomerSetYf((page1 - 1) * rows1,rows1,ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2,sort,order,carname);
			int count = dse.getCustomerSetYfs(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2,sort,order,carname);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
//			JSONObject json=new JSONObject();
//			json.put("rows", list);
//			System.out.println(json.toString());
			return map;
		}
	//协议查询导出
	@RequestMapping(params = "method=getCustomerSetYfout")
	public @ResponseBody List<CreateAgreement> getCustomerSetYfout(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String types, String isdelivery,
			String start_date, String end_date, String start_date1,
			String end_date1, String start_date2, String end_date2,String carname, String [] checkarray){
		String filename = "配送费结算信息导出";	
		List<CreateAgreement> list;
		if(checkarray!=null&&checkarray.length>0){
			list= dse.getCustomerSetYfout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2,carname, checkarray);				
		}else{
			list= dse.getCustomerSetYfout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2,carname, null);
			
		}	
		/*for (CreateAgreement so : list) {
		if (so!=null) {				
		
		 if (so.getAgreement_type()!=null&&so.getAgreement_type()==0) {
			so.setAgreement_type(Integer.parseInt("班线"));
		}  if(so.getAgreement_type()!=null&&so.getAgreement_type()==1){
			so.setAgreement_type(Integer.parseInt("配送"));
		}  if(so.getAgreement_type()!=null&&so.getAgreement_type()==2){
			so.setAgreement_type(Integer.parseInt("转运"));
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
			ExportUtils.outputHeaders(headtitle, workbook, "配送费结算信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "配送费结算信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	
	 //订单查询
		@RequestMapping(params = "method=getSettlementYf")
		public @ResponseBody
		Map<String,Object> getSettlementYfInfo(String rows, String page,String agreement_number, String agreement_type,String id) {
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
			List<ShippingOrder> list = dse.getSettlementYfInfo((page1 - 1) * rows1,rows1 ,agreement_number, agreement_type,id);
			int count = dse.getSettlementYf(agreement_number, agreement_type,id);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
//			JSONObject json=new JSONObject();
//			json.put("rows", list);
//			System.out.println(json.toString());
			return map;
		}
		
		/*
		 * 结算运费实际应收
		 */
		@RequestMapping(params = "method=changePrice")
		public @ResponseBody
		Json updateSettlementYf(String dds, String price,String payment_bz,HttpServletRequest request) {
			User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
			Json json = new Json();
			int truck=dse.updateSettlementYf(dds,price,payment_bz);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		/*
		 * 结算运费
		 */
		@SuppressWarnings("unchecked")
		@RequestMapping(params = "method=addSettlementYf")
		public @ResponseBody
		Json addSettlementYf(String[] dds,String type, String remarks,String khbank,String usernames,String kahao,
				HttpServletRequest request,String zpnum) {
			User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
			Json json = new Json();
			//保存结算记录
			dse.saveSettlchecks((List<Delivery_Clearing>) saveSettlementYf(dds, type, remarks, khbank, usernames, kahao, zpnum, user.getId(),"0").get("list"));

			dse.saveSettl_fu((List<CreateAgreement>) saveSettlementYf(dds, type, remarks, khbank, usernames, kahao, zpnum, user.getId(),"0").get("order"));		
			int truck=dse.addSettlementYf(dds, type,user.getId(), remarks,khbank, usernames, kahao, zpnum);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}	
		//运费结算
		public Map<String,Object> saveSettlementYf(String[] dds,String type, String remarks,String khbank,String usernames,String kahao,String zpnum,String userid,String state) {	
			List<Delivery_Clearing> list=new ArrayList<Delivery_Clearing>();
			List<CreateAgreement> order= dse.getCustomerSetYfout(null, null, null, null, null, null, null, null, null,null, dds);
			for(int i=0;i<order.size();i++){
				Delivery_Clearing sh=new Delivery_Clearing();
				sh.setClearingid(UUIDUtils.getUUID());
				if(order.get(i).getPaytypes().equals("0")){
					sh.setAllmoney(order.get(i).getAll_money());				
				}else{
					//sh.setAllmoney(order.get(i).getPayment_fu().split(",")[1]);
				 sh.setAllmoney(Float.parseFloat(order.get(i).getReceivable_fee())-Float.parseFloat(order.get(i).getPayment_fu().split(",")[1])+"");
				}
				sh.setOrder_id(order.get(i).getAgreement_id());	
				if(order.get(i).getPaytypes().equals("0")){
					sh.setSettl_money(order.get(i).getReceivable_fee());				
				}else{
					sh.setSettl_money(Float.parseFloat(order.get(i).getReceivable_fee())-Float.parseFloat(order.get(i).getPayment_fu().split(",")[0])+"");
				}
				sh.setOver_money(order.get(i).getTrade_cha());					
				sh.setSettl_user(userid);
				sh.setSettl_username(usernames);
				sh.setSettl_kahao(kahao);
				sh.setSettl_khbank(khbank);
				sh.setSettl_notes(remarks);
				//sh.setSettl_type(type);
				sh.setSettl_order(state);
				sh.setSettl_zpnum(zpnum);
				sh.setPayment_bz(order.get(i).getPayment_bz());
				list.add(sh);
				/*order.get(i).setPayment_fu(order.get(i).getReceivable_fee()+","+order.get(i).getTrade_cha());*/		
				if(order.get(i).getPayment_method().equals("0")){
					order.get(i).setPayment_fu(order.get(i).getReceivable_fee()+","+0);		
				}else{
					order.get(i).setPayment_fu(order.get(i).getReceivable_fee()+","+order.get(i).getPayment_fu().split(",")[0]);
				}	
			}
			Map< String, Object> map =new HashMap<String,Object>();
			map.put("list", list);
			map.put("order", order);
			return map;
		}
	
		/*		if(order.get(i).getPaytypes().equals("0")){
					order.get(i).setSetldaisk_fu(order.get(i).getSetldaisk_trade()+","+0);		
				}else{
					order.get(i).setSetldaisk_fu(order.get(i).getSetldaisk_trade()+","+order.get(i).getSetldaisk_fu().split(",")[0]);
				}		
						}
		
		}*/
		
		/*
		 * 结算运费提审
		 */
		@RequestMapping(params = "method=delSettlementYf")
		public @ResponseBody
		Json delSettlementYf(String[] dds,String did,String notes,HttpServletRequest request) {
			User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
			Json json = new Json();
			int truck=dse.delSettlementYf(dds, did, user.getId(), notes);
			List<Delivery_Clearing> list=dse.getupdateSettle("jy_delivery_clearing", 2, dds);//最新结算记录
			dse.updateSettle(list,"jy_delivery_clearing","1");//修改结算记录审核状态
			dse.saveSettlyfSh(saveSettlyfSh(dds, "0", notes,"2", user.getId(),"0","",user.getDid()));//审核记录保存
				
			if (truck > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
		
		//审核信息保存
		public List<Delivery_Audit> saveSettlyfSh(String [] orderid,String checks_type,String checks_notes,String checks_state,String checks_user,String settlyf_sf,String settlyf_id,String did) {
			List<Delivery_Audit> list=new ArrayList<Delivery_Audit>();
			
			for(String id:orderid){
				Delivery_Audit s=new Delivery_Audit();
				s.setAuditId(UUIDUtils.getUUID());
				s.setOrderids(id);
				s.setSettlyf_type(checks_type);
				s.setSettlyf_state(checks_notes);
				s.setSettlyf_state(checks_state);
				s.setSettlyf_user(checks_user);
				s.setSettlyf_remaks(checks_notes);
				s.setSettlyf_sf(settlyf_sf);
				s.setSettlyf_id(settlyf_id);
			    s.setSettle_th_did(did);
				list.add(s);
			}
			return list;
		}
		
		//运费记录查询
				@RequestMapping(params = "method=getSettleRc")
				public @ResponseBody Map<String,Object> getSettleRc(String rows, String page,String order_id, String settl_order) {
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
						List<Delivery_Clearing> list = dse.getSettleRc((page1 - 1) * rows1,rows1,order_id, settl_order);
						int count = dse.getSettleRcs(order_id, settl_order);
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("total", count);
						map.put("rows", list);
//						JSONObject json=new JSONObject();
//						json.put("rows", list);
//						System.out.println(json.toString());
						return map;
					}
				
				//运费结算审核查询
				@RequestMapping(params = "method=getSettlementYfSHInfo")
				public @ResponseBody
				Map<String,Object> getSettlementYfSHInfo(String rows, String page,String agreement_number, String kname,
						String payment_sh, String create_time, String create1_time,
						String settl_times, String settl1_times, String isdelivery) {
					   
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
					List<CreateAgreement> list = dse.getSettlementYfSHInfo((page1 - 1) * rows1,rows1 ,agreement_number, kname,
							payment_sh, create_time, create1_time, settl_times,
							settl1_times, isdelivery);
					int count = dse.getSettlementYfSH(agreement_number, kname,
							payment_sh, create_time, create1_time, settl_times,
							settl1_times, isdelivery);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("total", count);
					map.put("rows", list);
//					JSONObject json=new JSONObject();
//					json.put("rows", list);
//					System.out.println(json.toString());
					return map;
				}
				
				/*
				 * 结算运费审核驳回
				 */
				@RequestMapping(params = "method=settlementYfBH")
				public @ResponseBody
				Json shSettlementYfBH(String[] ids,String notes,HttpServletRequest request) {
					User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
					List<ShippingOrder> order=dse.getSettlementYfout(null, null, ids);	
					for(int i=0;i<order.size();i++){			
							order.get(i).setPayment_fu(order.get(i).getPayment_fu().split(",")[1]+","+order.get(i).getPayment_fu().split(",")[1]);
					}
					Json json = new Json();
					List<Delivery_Clearing> list=dse.getupdateSettle("jy_delivery_clearing", 2, ids);//最新结算记录
					dse.updateSettle(list,"jy_delivery_clearing","1");//修改结算记录审核状态
					dse.saveSettlyfSh(saveSettlyfSh(ids, "1", notes,"0", user.getId(),"0","",user.getDid()));
					int truck=dse.shSettlementYf(ids, "3", user.getId(), notes);		
					if (truck > 0) {			
						json.setFlag(true);
						return json;
					}
					json.setFlag(false);
					return json;
				}
				
				/*
				 * 结算运费审核通过
				 */
				@RequestMapping(params = "method=settlementYfTG")
				public @ResponseBody
				Json shSettlementYfTG(String[] ids,String notes,HttpServletRequest request) {
					User user=(User) request.getSession().getAttribute(SessionInfo.SessionName);
					Json json = new Json();
					List<Delivery_Clearing> list=dse.getupdateSettle("jy_delivery_clearing", 2, ids);//最新结算记录
					dse.updateSettle(list,"jy_delivery_clearing","1");//修改结算记录审核状态
					dse.saveSettlyfSh(saveSettlyfSh(ids, "1", notes,"1", user.getId(),"0","",user.getDid()));
					int truck=dse.shSettlementYf(ids, "2", user.getId(), notes);		
					if (truck > 0) {		
						json.setFlag(true);
						return json;
					}
					json.setFlag(false);
					return json;
				}
				
				//运费结算审核记录查询
				@RequestMapping(params = "method=getSettleShRc")
				public @ResponseBody
				Map<String,Object> getSettleShRc(String rows, String page,String start_date, String end_date,
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
					List<Delivery_Audit> list = dse.getSettleShRc((page1 - 1) * rows1,rows1 , start_date, end_date, ddids);
					int count = dse.getSettleShRcs(start_date, end_date, ddids);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("total", count);
					map.put("rows", list);
//					JSONObject json=new JSONObject();
//					json.put("rows", list);
//					System.out.println(json.toString());
					return map;
				}
				
                   //查询
						@RequestMapping(params="method=getSettlout")
						public @ResponseBody CreateAgreement getMsgContent(String []id){
							List<CreateAgreement> list= dse.getCustomerSetYfout(null, null, null, null, null, null, null, null, null,null, id);
							return list.get(0);
						}
						
						//运费导出
						@RequestMapping(params = "method=getSettlementYfout")
						public @ResponseBody List<ShippingOrder> getSettlementYfout(HttpServletResponse response,String[] headtitle, String[] fieldName,String agreement_number, String agreement_type,String [] checkarray){
							String filename = "运单信息导出";	
							List<ShippingOrder> list;
							if(checkarray!=null&&checkarray.length>0){
								list= dse.getSettlementYfout(null, null, checkarray);	
							}else{
								list= dse.getSettlementYfout(agreement_number, agreement_type, checkarray);
								
							}
								/*	for (ShippingOrder so : list) {
								if (so!=null) {				
								
								} if (so.getAgreement_type()!=null&&so.getAgreement_type().equals("0")) {
									so.setAgreement_type("班线");
								}  if(so.getAgreement_type()!=null&&so.getAgreement_type().equals("1")){
									so.setAgreement_type("配送");
								}  if(so.getAgreement_type()!=null&&so.getAgreement_type().equals("2")){
									so.setAgreement_type("转运");
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
						
						//运费审核导出
						@RequestMapping(params = "method=getSettlementYfSHout")
						public @ResponseBody List<CreateAgreement> getSettlementYfSHout(HttpServletResponse response,String[] headtitle, String[] fieldName,String ddId, String types, String isdelivery, String start_date,
								String end_date, String start_date1, String end_date1,String start_date2, String end_date2, String kname,String [] checkarray){
							String filename = "配送费结算审核信息导出";	
							List<CreateAgreement> list;
							if(checkarray!=null&&checkarray.length>0){
								list= dse.getSettlementYfSHout(null, null, null, null, null, null, null, null, null, null,checkarray);					
							}else{
								list= dse.getSettlementYfSHout(ddId, types, isdelivery, start_date, end_date, start_date1, end_date1, start_date2, end_date2, kname,null);
								
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
								ExportUtils.outputHeaders(headtitle, workbook, "配送费结算审核信息导出");
								// 调用工具类生成内容
								ExportUtils.outputColums(fieldName, list, workbook, 1, "配送费结算审核信息导出");
								workbook.write(ouputStream);
								ouputStream.flush();
								ouputStream.close();
							
							} catch (Exception e) {
								e.printStackTrace();
							}
							return null;	
						}
}
