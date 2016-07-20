package com.jy.action;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.DestinationFeeCloseMordel;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.model.jiLuLiShi;
import com.jy.service.DestinationFeeCloseSerivce;
import com.jy.service.HandlingChargeService;
import com.jy.service.SettleDaiskService;

@Component
@RequestMapping(value = "/Handling.do")
public class HandlingChargeController {
	@Resource
	private SettleDaiskService bid;
	@Resource
	private HandlingChargeService hcs;
	@Resource
	private DestinationFeeCloseSerivce dcs;
	@RequestMapping(params = "method=getHandlingCharge")
    public String getHandlingCharge(){  	
        return "HandlingCharge/HandlingChargeInfo";	
    }
	@RequestMapping(params = "method=getDestinationFeeCuctome")
    public@ResponseBody Map<String, Object> getDestinationFeeCuctome(String rows, String page,String customer_num,String customer_name,String js_time,String js_times,String sort,String order){
    	Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<DestinationFeeCloseMordel> list = hcs.getHandlingCuctome((page1 - 1) * rows1,rows1,  customer_num, customer_name, js_time, js_times, sort, order);
		int count = hcs.getHandlingFeeCount(customer_num, customer_name, js_time, js_times);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
    }
	@RequestMapping(params = "method=getShippingCollect")
	public String getShippingCollect(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "HandlingCharge/DestinationFeeClose";
	}
	//查询运单信息
	@RequestMapping(params = "method=getShippingClose")
	public@ResponseBody Map<String,Object> getShippingClose(String rows, String page,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times){
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<DestinationFeeCloseMordel> list = hcs.getShippingClose((page1 - 1) * rows1,rows1,pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
		int count = hcs.getShippingCloseCount(pid,send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	// 跳转编辑页面
	@RequestMapping(params = "method=getEditCompanyPagef")
	public String getEdittCompanyPagef(String[] pid, String fee,String hfee,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("fee", fee);
		request.setAttribute("hfee", hfee);
		return "HandlingCharge/EditClose";
	}	
	/**
	 * 编辑费用
	 * */
	@RequestMapping(params = "method=updateCollect")
	public @ResponseBody Json updateCollect(String[] pid,String handling_charge,String handling_shihou, HttpServletRequest request) {
		Json json = new Json();	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		user.getUsername();
		df.format(new Date());
		int i = hcs.UpdateShippFee(pid, handling_shihou);						    		    
		if (i>0) {
			json.setFlag(false);
		}
			return json;
	    }
// 跳转编辑页面并且获取合同的id 返回到页面
    @RequestMapping(params = "method=getEdiPagef")
	public String getEdiPagef(String[] pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "HandlingCharge/EditJiSuan";
		}
  //运费结算
  	public Map<String,Object> saveSettlementYf(String[] dds,String type, String remarks,String khbank,String usernames,String kahao,String zpnum,String userid,String state) {	
  		List<Settle_history> list=new ArrayList<Settle_history>();
  		List<DestinationFeeCloseMordel> order= hcs.getCustomerInput(null, null, null, null, null, null, null, null, null, null,dds,null);	
  		for(int i=0;i<order.size();i++){
  			Settle_history sh=new Settle_history();
  			sh.setSettlements_id(UUIDUtils.getUUID());			
  			sh.setOrder_id(order.get(i).getShiping_order_id());  	    	
  			//sh.setOver_money(Float.parseFloat(order.get(i).getHandling_charge())-Float.parseFloat(order.get(i).getHandling_shihou().split(",")[0])+"");//已结算金额
  			sh.setOrder_id(order.get(i).getShiping_order_id());
  			if(order.get(i).getSettl_type().equals("0")){
				sh.setAllmoney(order.get(i).getHandling_charge());				
			}else{
				sh.setAllmoney(Float.parseFloat(order.get(i).getHandling_charge())-Float.parseFloat(order.get(i).getHandling_ysce().split(",")[1])+"" );
			}
			sh.setOrder_id(order.get(i).getShiping_order_id());	
			if(order.get(i).getSettl_type().equals("0")){
				sh.setSettl_money(order.get(i).getHandling_shihou());				
			}else{
				sh.setSettl_money(Float.parseFloat(order.get(i).getHandling_shihou())-Float.parseFloat(order.get(i).getHandling_ysce().split(",")[0])+"");
			}
  			//sh.setAllmoney(order.get(i).getHandling_charge());//应收
  			
  			//sh.setOver_money(order.get(i).getTrade_cha());//差异		
  			
  			//sh.setSettl_money(order.get(i).getHandling_shihou());//实收
  			
  			sh.setSettl_user(userid);
  			sh.setSettl_username(usernames);
  			sh.setSettl_kahao(kahao);
  			sh.setSettl_khbank(khbank);
  			sh.setSettl_notes(remarks);
  			sh.setSettl_type(type);
  			sh.setSettl_order("1");
  			sh.setSettl_zpnum(zpnum);
  			list.add(sh);
  			order.get(i).setHandling_ysce(order.get(i).getHandling_shihou()+","+order.get(i).getTrade_cha());
  		}
  		
  		Map< String, Object> map =new HashMap<String,Object>();
  		map.put("list", list);
  		map.put("order", order);
  		return map;
  	}
  	
	//结算
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "method=updateJieSuan")	
	public @ResponseBody Json updateJieSuan(String[] pid,String usernames,String zpnum,String  khbank,String kahao, String des_time,String des_name,String remarks ,String type,HttpServletRequest request) {
		Json json = new Json();
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		
		/*List<DestinationFeeCloseMordel> dc = dcs.getShippingJiLu(pid);
		DestinationFeeCloseMordel dd = new DestinationFeeCloseMordel();
		List<Settle_history> list = new ArrayList<Settle_history>();

		for (DestinationFeeCloseMordel dm : dc) {
			for (Settle_history sh : list) {
				sh.setSettlements_id(UUIDUtils.getUUID());
				sh.setOrder_id(dm.getShiping_order_id());
				sh.setUsername(user.getUsername());
			
			}
			dm.setDes_sige_name(usernames);
			dm.setDes_bank(khbank);
			dm.setDes_card(kahao);
			dm.setDes_name(user.getUsername());
			dm.setDerfee_id(UUIDUtils.getUUID());
			dm.setDes_market(remarks);
			dm.setDestination_stata(type);
			dm.setZhipiao_binahao(zpnum);			
		}*/
		hcs.saveSettlchecks((List<Settle_history>) saveSettlementYf(pid, type, remarks, khbank, usernames, kahao, zpnum, user.getId(),"1").get("list"));
		hcs.saveSettl_fu((List<DestinationFeeCloseMordel>) saveSettlementYf(pid, type, remarks, khbank, usernames, kahao, zpnum, user.getId(),"1").get("order"));		
		//int js = hcs.insertJiSuan(dc);
		int i = hcs.updateJieSuan(pid, usernames, khbank, kahao,des_time, user.getUsername(), remarks, type);

		if (i>0) {
			json.setFlag(true);
		}
		return json;	
	}
	/**
	 * 提审跳转界面
	 * */
	@RequestMapping(params = "method=getArraignedClose")
    public String getArraignedClose(String[] pid,HttpServletRequest request){
		request.setAttribute("pid", pid);
    	return "HandlingCharge/EreArraigned";
    }
	/**
	 * 专线公司结算提审
	 * */
	@RequestMapping(params = "method=getEreArraignedCustoms")
	 public@ResponseBody Json getEreArraignedCustoms(String[] pid,String des_ts_bm,String did,String des_ts_market,HttpServletRequest request){
		//User user = (User) request.getSession().getAttribute(SessionInfo.SessionName); 
		Json json = new Json();
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		List<DestinationFeeCloseMordel> dc = dcs.getShippingJiLu(pid);
		List<SettlyfSh> list = new ArrayList<SettlyfSh>();
		SettlyfSh se = null;
		
		//DestinationFeeCloseMordel dd = new DestinationFeeCloseMordel();
		for(int j = 0;j < dc.size(); j++){
			se = new SettlyfSh();
			se.setSettlementids(UUIDUtils.getUUID());
			se.setOrderids(dc.get(j).getShiping_order_id());
			se.setSettlyf_type("0");
			se.setSettlyf_state("2");
			//se.setSettlyf_state(checks_state);
			se.setSettlyf_user(user.getId());
			se.setSettlyf_remaks(des_ts_market);
			se.setSettlyf_sf("1");
			se.setSettlyf_id(dc.get(j).getSettlements_id());
			se.setSettle_th_did(des_ts_bm);
			list.add(se);
		}
		int i = hcs.updateTiShen(pid, des_ts_bm, des_ts_market);
		List<Settle_history> lists=bid.getupdateSettle("jy_settlementy_ys_history", 1, pid);//最新结算记录
		bid.updateSettle(lists,"jy_settlementy_ys_history","1");//修改结算记录审核状态

		int s = hcs.saveSettlyfSh(list);
		//int j = hcs.inserJyShenHeJiLu(dc);
		 if (i>0&&s>0) {
			 System.out.println("成功！！！！！");
			 json.setFlag(true);
		}
		
		 return json; 
		 
	 }
	@RequestMapping(params = "method=getAuditing")
	public String getAuditing(){//destination_stata
		return "HandlingCharge/AuditingShipp";
	}
	@RequestMapping(params = "method=getShippingCloseAuditing")
	public@ResponseBody Map<String,Object> getShippingCloseAuditing(String rows, String page,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times){
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<DestinationFeeCloseMordel> list = hcs.getShippingCloseAuditing((page1 - 1) * rows1,rows1,pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
		int count = hcs.getShippingAuditingCount(pid,send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/**
	 * 审核跳转
	 * */
	@RequestMapping(params = "method=getDriverCh")
	public String getDriverCh(String id,HttpServletRequest request){
		request.setAttribute("id",id);
		return "HandlingCharge/EreCheckedRejct";
		
	}
	//审核信息保存
	public List<SettlyfSh> saveSettlyfSh(String [] orderid,String checks_type,String checks_notes,String checks_state,String checks_user,String  settlyf_sf) {
		List<SettlyfSh> list=new ArrayList<SettlyfSh>();
		for(String id:orderid){
			SettlyfSh s=new SettlyfSh();
			s.setSettlementids(UUIDUtils.getUUID());
			s.setOrderids(id);
			s.setSettlyf_type(checks_type);
			s.setSettlyf_state(checks_notes);
			s.setSettlyf_state(checks_state);
			s.setSettlyf_user(checks_user);
			s.setSettlyf_remaks(checks_notes);
			s.setSettlyf_sf(settlyf_sf);
			list.add(s);
		}
		return list;
	}
	//审核成功
	@RequestMapping(params = "method=UpdateCheckedShipp")
	public@ResponseBody Json UpdateCheckedShipp(String[] id,String shenhe_id,String shenhe_name,String shenhe_market,String handling_charge,String handling_shihou,String shenhe_stime,HttpServletRequest request){
		Json json = new Json();
		DestinationFeeCloseMordel dc = new DestinationFeeCloseMordel();
		List<DestinationFeeCloseMordel> list = new ArrayList<DestinationFeeCloseMordel>() ;
		User user = (User) request.getSession().getAttribute(SessionInfo.SessionName);
		list.add(dc);
		int h = hcs.saveSettlyfSh(saveSettlyfSh(id, "1", shenhe_market,"1", user.getId(),"1"));
		int i = hcs.UpdateCheckedShipp(id,"2");
		//int j = dcs.InsershenheJIlu(list);
		//int l = hcs.updateJyShenJiLU(user.getUsername(),  id,shenhe_market, handling_shihou, handling_charge);
		if (i>0) {
			json.setFlag(true);
		}
		return json;						
	}
	//审核驳回
	@RequestMapping(params = "method=UpdateCheckedBohui")
	public@ResponseBody Json UpdateCheckedBohui(String[] id,String shenhe_id,String shenhe_name,String shenhe_market,String handling_charge,String handling_shihou,String shenhe_stime,HttpServletRequest request){
		DestinationFeeCloseMordel dc = new DestinationFeeCloseMordel();
		Json json = new Json();
		User user = (User) request.getSession().getAttribute(SessionInfo.SessionName);
		int h = hcs.saveSettlyfSh(saveSettlyfSh(id, "1", shenhe_market,"0", user.getId(),"1"));

		//int l = hcs.updateJyShenJiLU(user.getUsername(),  id,shenhe_market, handling_shihou, handling_charge);
		int j = hcs.UpdateCheckedBohui(id,"3");
		//int j = dcs.InsershenheJIlu(list);
		List<ShippingOrder> order= bid.getSettlementYfout(null, null, null, null, null, null, null, null, null, null,id);	
		for(int i=0;i<order.size();i++){			
				order.get(i).setSetldaisk_fu(order.get(i).getSetldaisk_fu().split(",")[1]+","+order.get(i).getSetldaisk_fu().split(",")[1]);
		}
		bid.saveSettl_fu(order);

		if (j>0&&h>0) {
			json.setFlag(true);
		}
		return json;						
	}
	@RequestMapping(params = "method=getCustomerIO")
	public @ResponseBody List<ShippingOrder> getCustomerIO(HttpServletResponse response,String[] headtitle, String[] fieldName,String customer_name, String customer_num,String js_time,String js_times, String [] checkarray){
		String filename = "客户代收手续费结算信息导出";	
		List<DestinationFeeCloseMordel> list;
		if(checkarray!=null&&checkarray.length>0){
			list= hcs.getDestinationFeeIO(null, null, null, null, checkarray);			
		}else{
			list= hcs.getDestinationFeeIO(customer_num, customer_name, js_time, js_times, null);				
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
			ExportUtils.outputHeaders(headtitle, workbook, "客户代收手续费结算信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "客户代收手续费结算信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	/**
	 * 跳转详细运单
	 * */
	@RequestMapping(params = "method=getShippingXiangQing")
	public String getShippingXiangQing(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "HandlingCharge/XiangQingShipp";
	}
	//运单结算详细查询 
	@RequestMapping(params = "method=getJyShenHeJiLu")
	public@ResponseBody Map<String,Object> getJyShenHeJiLu(String rows, String page,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times){
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<Settle_history> list = hcs.getJyShenHeJiLu((page1 - 1) * rows1,rows1,pid);
		int count = hcs.getJyShenHeJiLuCount(pid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	//运单调整记录查询调转
	@RequestMapping(params = "method=getXiugaijilus")
	public String getXiugaijilus(){
		return "Xiugaijilus/Xiugaijilus";
		
	}
	//运单调整记录查询
	@RequestMapping(params = "method=getXiugaijilu")
	public@ResponseBody Map<String,Object> getXiugaijilu(String rows, String page,String num,String xiugaitime,String xiugaitimes){
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<jiLuLiShi> list = hcs.getXiugaijilu((page1 - 1) * rows1,rows1,num, xiugaitime, xiugaitimes);
	    int count = hcs.getXiugaijiluCount(num, xiugaitime, xiugaitimes);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	@RequestMapping(params = "method=getXiuGaiJuInput")
	public@ResponseBody Map<String,Object> getXiuGaiJuInput(HttpServletResponse response,String num,String xiugaitime,String xiugaitimes,String[] headtitle, String[] fieldName, String [] checkarray){
		String filename = "运单调整记录导出";	
		List<jiLuLiShi> list;
		if(checkarray!=null&&checkarray.length>0){
			list= hcs.getXiuGaiJuInput(num, xiugaitime, xiugaitimes, checkarray);
		}else{
			list= hcs.getXiuGaiJuInput(num, xiugaitime, xiugaitimes, null);	
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
			ExportUtils.outputHeaders(headtitle, workbook, "运单调整记录导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "运单调整记录导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	/**
	 * 跳转详细运单
	 * */
	@RequestMapping(params = "method=getShippingshenhe")
	public String getShippingshenhe(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "HandlingCharge/XiangQingshenhe";
	}
	@RequestMapping(params = "method=getSettleShRc")
	public @ResponseBody
	Map<String,Object> getSettleShRc(String rows, String page,String start_date, String end_date,String ddids) {
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
		List<SettlyfSh> list = hcs.getSettleShRc((page1 - 1) * rows1,rows1 , start_date, end_date, ddids);
		int count = hcs.getSettleShRcs(start_date, end_date, ddids);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	//订单导出
	@RequestMapping(params = "method=getCustomerInput")
	public @ResponseBody List<ShippingOrder> getCustomerInput(HttpServletResponse response,String[] headtitle, String[] fieldName,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times ,String [] checkarray,String sid){
		String filename = "客户手续费运单信息导出";	
		List<DestinationFeeCloseMordel> list;
		if(checkarray!=null&&checkarray.length>0){
			list= hcs.getCustomerInput(null, null, null, null, null, null, null, null, null, null, checkarray,sid);	
	    }else{
			list= hcs.getCustomerInput(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, null,sid);				
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
			ExportUtils.outputHeaders(headtitle, workbook, "客户手续费运单信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "客户手续费运单信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
				
		} catch (Exception e) {
		    e.printStackTrace();
		}
				return null;	
			}
	//审核界面查询
	@RequestMapping(params = "method=getShippingDriver")
	 public@ResponseBody DestinationFeeCloseMordel getShippingDriver(String id){
		DestinationFeeCloseMordel so = hcs.getShippingDriver(id);
		return so;		 
	 }
	//订单导出审核
		@RequestMapping(params = "method=getCustomerOup")
		public @ResponseBody List<ShippingOrder> getCustomerOup(HttpServletResponse response,String[] headtitle, String[] fieldName,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times ,String [] checkarray){
			String filename = "客户手续费运单审核信息导出";	
			List<DestinationFeeCloseMordel> list;
			if(checkarray!=null&&checkarray.length>0){
				list= hcs.getCustomerOup(null, null, null, null, null, null, null, null, null, null, checkarray);	
		    }else{
				list= hcs.getCustomerOup(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, null);				
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
				ExportUtils.outputHeaders(headtitle, workbook, "客户手续费运单审核信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName, list, workbook, 1, "客户手续费运单审核信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
					
			} catch (Exception e) {
			    e.printStackTrace();
			}
					return null;	
				}
}
