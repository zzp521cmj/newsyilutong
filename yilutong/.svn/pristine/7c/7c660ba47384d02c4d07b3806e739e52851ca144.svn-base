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
import com.jy.model.Customer;
import com.jy.model.DestinationFeeCloseMordel;
import com.jy.model.Settle_history;
import com.jy.model.SettlyfSh;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.DestinationFeeCloseSerivce;
import com.jy.service.HandlingChargeService;
import com.jy.service.SettleDaiskService;

@Component
@RequestMapping(value = "/Destination.do")
public class DestinationFeeCloseController {
	@Resource
	private SettleDaiskService bid;
	@Resource
	private HandlingChargeService hcs;
    @Resource
    private DestinationFeeCloseSerivce dcs;
    @RequestMapping(params = "method=getCuctome")
    public String getCuctome(){
		return "DestinationFeeCuctome/DestinationFeeCuctomeInfo";
    }
    //客户查询
    @RequestMapping(params = "method=getDestinationFeeCuctome")
    public@ResponseBody Map<String, Object> getDestinationFeeCuctome(String rows, String page,String customer_num,String customer_name,String js_time,String js_times,String chayi,String order){
    	Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<DestinationFeeCloseMordel> list = dcs.getDestinationFeeCuctome((page1 - 1) * rows1,rows1,  customer_num, customer_name, js_time, js_times, chayi,order);
		int count = dcs.getDestinationFeeCount(customer_num, customer_name, js_time, js_times, chayi);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
    }
	/**
	 * 调整运单信息主页面
	 * */
	@RequestMapping(params = "method=getShippingCollect")
	public String getShippingCollect(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "DestinationFeeCuctome/DestinationFeeClose";
	}
	//运单查询信息
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
		List<DestinationFeeCloseMordel> list = dcs.getShippingClose((page1 - 1) * rows1,rows1,pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
		int count = dcs.getShippingCloseCount(pid,send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	// 跳转编辑页面
	@RequestMapping(params = "method=getEditCompanyPagef")
	public String getEdittCompanyPagef(String[] pid, String fee,String paid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		request.setAttribute("fee", fee);
		request.setAttribute("paid", paid);
		return "DestinationFeeCuctome/EditClose";
	}	
    /**
     * 编辑费用
     * */
	@RequestMapping(params = "method=updateCollect")
	public @ResponseBody
	Json updateCollect(String[] pid,String destination_fee,String paid_fee, HttpServletRequest request) {
		Json json = new Json();	
		
	       
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		user.getUsername();
		df.format(new Date());
		int i = dcs.UpdateShippFee(pid, paid_fee);	
				    
	    
			if (i>0) {
			    json.setFlag(false);
			}
			return json;
      }
	// 跳转结算界面
	@RequestMapping(params = "method=getEdiPagef")
	public String getEdiPagef(String[] pid, HttpServletRequest request) {
		System.out.println("id"+pid);
		request.setAttribute("flg", pid);
		return "DestinationFeeCuctome/EditJiSuan";
	}
	/*public Map<String,Object> saveSettlementYf(String[] dds,String type, String remarks,String khbank,String usernames,String kahao,String zpnum,String userid,String state) {	
		List<Settle_history> list=new ArrayList<Settle_history>();
		List<ShippingOrder> order= bid.getSettlementYfout(null, null, null, null, null, null, null, null, null, null,dds);	
		for(int i=0;i<order.size();i++){
			Settle_history sh=new Settle_history();
			sh.setSettlements_id(UUIDUtils.getUUID());	
			
			if(order.get(i).getPaytypes().equals("0")){
				sh.setAllmoney(order.get(i).getTrade_agency());				
			}else{
				sh.setAllmoney(Float.parseFloat(order.get(i).getTrade_agency())-Float.parseFloat(order.get(i).getSetldaisk_fu().split(",")[1])+"" );
			}
			sh.setOrder_id(order.get(i).getShiping_order_id());	
			if(order.get(i).getPaytypes().equals("0")){
				sh.setSettl_money(order.get(i).getSetldaisk_trade());				
			}else{
				sh.setSettl_money(Float.parseFloat(order.get(i).getSetldaisk_trade())-Float.parseFloat(order.get(i).getSetldaisk_fu().split(",")[0])+"");
			}
			sh.setOver_money(order.get(i).getTrade_cha());					
			sh.setSettl_user(userid);
			sh.setSettl_username(usernames);
			sh.setSettl_kahao(kahao);
			sh.setSettl_khbank(khbank);
			sh.setSettl_notes(remarks);
			sh.setSettl_type(type);
			sh.setSettl_order(state);
			sh.setSettl_zpnum(zpnum);
			list.add(sh);
			if(order.get(i).getPaytypes().equals("0")){
				order.get(i).setSetldaisk_fu(order.get(i).getSetldaisk_trade()+","+0);		
			}else{
				order.get(i).setSetldaisk_fu(order.get(i).getSetldaisk_trade()+","+order.get(i).getSetldaisk_fu().split(",")[0]);
			}		
					}
		Map< String, Object> map =new HashMap<String,Object>();
		map.put("list", list);
		map.put("order", order);
		return map;
	}
*/
	//运费结算
  	public Map<String,Object> saveSettlementYf(String[] dds,String type, String remarks,String khbank,String usernames,String kahao,String zpnum,String userid,String state) {	
  		List<Settle_history> list=new ArrayList<Settle_history>();
  		List<DestinationFeeCloseMordel> order= dcs.getCustomerInput(null, null, null, null, null, null, null, null, null, null, dds,null);	
  		for(int i=0;i<order.size();i++){
  			System.out.println(order.size()+"⊙▂⊙"+order.get(i).getDestination_stata());
  			
  			Settle_history sh=new Settle_history();
  			sh.setSettlements_id(UUIDUtils.getUUID()); 		
  			
  			//sh.setOver_money(Float.parseFloat(order.get(i).getDestination_fee())-Float.parseFloat(order.get(i).getPaid_fee().split(",")[0])+"");//已结算金额
  			if(order.get(i).getSettl_type().equals("0")){
				sh.setAllmoney(order.get(i).getDestination_fee());				
			}else{
				sh.setAllmoney(Float.parseFloat(order.get(i).getDestination_fee())-Float.parseFloat(order.get(i).getPaid_derived_fee().split(",")[1])+"" );
			}
			sh.setOrder_id(order.get(i).getShiping_order_id());	
			if(order.get(i).getSettl_type().equals("0")){
				sh.setSettl_money(order.get(i).getPaid_fee());				
			}else{
				sh.setSettl_money(Float.parseFloat(order.get(i).getPaid_fee())-Float.parseFloat(order.get(i).getPaid_derived_fee().split(",")[0])+"");
			}
  			
  			sh.setOrder_id(order.get(i).getShiping_order_id());
  			
  			//sh.setAllmoney(order.get(i).getDestination_fee());//应收
  			
  			//sh.setOver_money(order.get(i).getTrade_cha());//差异		
  			
  			//sh.setSettl_money(order.get(i).getPaid_fee());//实收
  			
  			sh.setSettl_user(userid);
  			sh.setSettl_username(usernames);
  			sh.setSettl_kahao(kahao);
  			sh.setSettl_khbank(khbank);
  			sh.setSettl_notes(remarks);
  			sh.setSettl_type(type);
  			sh.setSettl_order("0");
  			sh.setSettl_zpnum(zpnum);
  			list.add(sh);
  			order.get(i).setPaid_derived_fee(order.get(i).getPaid_fee()+","+order.get(i).getTrade_cha());
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
		User user= (User)request.getSession().getAttribute(SessionInfo.SessionName);
		int i = dcs.updateJieSuan(pid, usernames, khbank, kahao,des_time, user.getUsername(), remarks, type);
	    int s = 	dcs.saveSettlchecks((List<Settle_history>) saveSettlementYf(pid, type, remarks, khbank, usernames, kahao, zpnum, user.getId(),"0").get("list"));
	    int p =	dcs.saveSettl_fu((List<DestinationFeeCloseMordel>) saveSettlementYf(pid, type, remarks, khbank, usernames, kahao, zpnum, user.getId(),"0").get("order"));		
		//int js = dcs.insertJiSuan(dc);
		if (i>0&&s>0&&p>0) {
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
    	return "DestinationFeeCuctome/EreArraigned";
    }
	/**
	 * 专线公司结算提审
	 * */
	@RequestMapping(params = "method=getEreArraignedCustoms")
	 public@ResponseBody Json getEreArraignedCustoms(String[] pid,String des_ts_bm,String did,String des_ts_market,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(SessionInfo.SessionName); 
		Json json = new Json();
		List<DestinationFeeCloseMordel> dc = dcs.getShippingJiLu(pid);		
		List<SettlyfSh> list = new ArrayList<SettlyfSh>();
		int k = dcs.updateTiShen(pid, des_ts_bm, des_ts_market);		
		SettlyfSh se = null;
		for (int i = 0; i < dc.size(); i++) {
			se = new SettlyfSh();
			se.setSettlementids(UUIDUtils.getUUID());
			se.setOrderids(dc.get(i).getShiping_order_id());
			se.setSettlyf_type("0");
			se.setSettlyf_state("2");
			//se.setSettlyf_state(checks_state);
			se.setSettlyf_user(user.getId());
			se.setSettlyf_remaks(des_ts_market);
			se.setSettlyf_sf("0");
			se.setSettlyf_id(dc.get(i).getSettlements_id());
			se.setSettle_th_did(des_ts_bm);
			list.add(se);
		}		
		List<Settle_history> lists=bid.getupdateSettle("jy_settlementy_ys_history", 0, pid);//最新结算记录
		bid.updateSettle(lists,"jy_settlementy_ys_history","1");//修改结算记录审核状态

		
		int s = dcs.saveSettlyfSh(list);
		
		 if (k>0&&s>0) {
			 json.setFlag(true);
		}
		 return json; 
		 
	 }
	/**
	 * 跳转详细页面
	 * */
	@RequestMapping(params = "method=getShippingXiangQing")
	public String getShippingXiangQing(String pid,HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "DestinationFeeCuctome/XiangQingShipp";
	}
	/**
	 * 结算记录查询
	 * */
	 @RequestMapping(params = "method=getXiangQingShipp")
	    public@ResponseBody Map<String, Object> getXiangQingShipp(String rows, String page,String pid,String jiesuantime,String jiesuantimes){
	    	Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<Settle_history> list = dcs.getXiangQingShipp((page1 - 1) * rows1,rows1,pid,jiesuantime,jiesuantimes);
			int count = dcs.getXiangQingShippCount(pid,jiesuantime,jiesuantimes);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
	    }
	 
	//运费客户导出
		@RequestMapping(params = "method=getCustomerIO")
		public @ResponseBody List<ShippingOrder> getCustomerIO(HttpServletResponse response,String[] headtitle, String[] fieldName,String customer_name, String customer_num,String js_time,String js_times, String [] checkarray){
			String filename = "客户代收运费结算信息导出";	
			List<DestinationFeeCloseMordel> list;
			if(checkarray!=null&&checkarray.length>0){
				list= dcs.getDestinationFeeIO(null, null, null, null, checkarray);			
			}else{
				list= dcs.getDestinationFeeIO(customer_num, customer_name, js_time, js_times, null);				
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
				ExportUtils.outputHeaders(headtitle, workbook, "客户代收运费结算信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName, list, workbook, 1, "客户代收运费结算信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
		}
		//订单导出
		@RequestMapping(params = "method=getCustomerInput")
		public @ResponseBody List<ShippingOrder> getCustomerInput(HttpServletResponse response,String[] headtitle, String[] fieldName,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times ,String [] checkarray,String idss){
			String filename = "客户代收运费结算运单信息导出";	
			List<DestinationFeeCloseMordel> list;
			if(checkarray!=null&&checkarray.length>0){
				list= dcs.getCustomerInput(null, null, null, null, null, null, null, null, null, null, checkarray,idss);	
			}else{
				list= dcs.getCustomerInput(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, null,idss);				
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
				ExportUtils.outputHeaders(headtitle, workbook, "客户代收运费结算运单信息导出");
				// 调用工具类生成内容
				ExportUtils.outputColums(fieldName, list, workbook, 1, "客户代收运费结算运单信息导出");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;	
		}
		//跳转审核主页面
		@RequestMapping(params = "method=getAuditing")
		public String getAuditing(){//destination_stata
			return "DestinationFeeCuctome/AuditingShipp";
		}
		//审核运单查询
		@RequestMapping(params = "method=getShippingAuditing")
		public@ResponseBody Map<String,Object> getShippingCloseAuditing(String rows, String page,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times){
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<DestinationFeeCloseMordel> list = dcs.getShippingCloseAuditing((page1 - 1) * rows1,rows1,pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
			int count = dcs.getShippingAuditingCount(pid,send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times,shipindi);
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
			return "DestinationFeeCuctome/EreCheckedRejct";
			
		}
		//审核信息保存
		public List<SettlyfSh> saveSettlyfSh(String [] orderid,String checks_type,String checks_notes,String checks_state,String checks_user,String  settlyf_sf) {
			List<SettlyfSh> list=new ArrayList<SettlyfSh>();
			for(String id:orderid){
				SettlyfSh s=new SettlyfSh();
				s.setSettlementids(UUIDUtils.getUUID());
				s.setOrderids(id);
				s.setSettlyf_type(checks_type);
				//s.setSettlyf_state(checks_notes);
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
		public@ResponseBody Json UpdateCheckedShipp(String[] id,String shenhe_id,String shenhe_name,String shenhe_market,String destination_fee,String paid_fee,String shenhe_stime,HttpServletRequest request){
			Json json = new Json();
			DestinationFeeCloseMordel dc = new DestinationFeeCloseMordel();
			List<DestinationFeeCloseMordel> list = new ArrayList<DestinationFeeCloseMordel>() ;
			User user = (User) request.getSession().getAttribute(SessionInfo.SessionName);
			dc.setShenhe_id(UUIDUtils.getUUID());
			dc.setShenhe_market(shenhe_market);
			dc.setDestination_fee(destination_fee);
			dc.setPaid_fee(paid_fee);
			dc.setShenhe_name(user.getUsername());
			//dc.setShiping_order_id(id);
			list.add(dc);
			int i = dcs.UpdateCheckedShipp("2", id);
			int h = hcs.saveSettlyfSh(saveSettlyfSh(id, "1", shenhe_market,"1", user.getId(),"0"));
			//int j = dcs.InsershenheJIlu(list);
			if (i>0&&h>0) {
				json.setFlag(true);
			}
			return json;						
		}
		//审核驳回
		@RequestMapping(params = "method=UpdateCheckedBohui")
		public@ResponseBody Json UpdateCheckedBohui(String[] id,String shenhe_id,String shenhe_name,String shenhe_market,String destination_fee,String paid_fee,String shenhe_stime,HttpServletRequest request){
			DestinationFeeCloseMordel dc = new DestinationFeeCloseMordel();
			Json json = new Json();
			List<DestinationFeeCloseMordel> list = new ArrayList<DestinationFeeCloseMordel>() ;
			User user = (User) request.getSession().getAttribute(SessionInfo.SessionName);
			dc.setShenhe_id(UUIDUtils.getUUID());
			dc.setShenhe_market(shenhe_market);
			dc.setDestination_fee(destination_fee);
			dc.setPaid_fee(paid_fee);
			dc.setShenhe_name(user.getUsername());
			//dc.setShiping_order_id(id);
			list.add(dc);
			int j = dcs.UpdateCheckedBohui("3", id);
			int h = hcs.saveSettlyfSh(saveSettlyfSh(id, "1", shenhe_market,"0", user.getId(),"0"));
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
		/**
		 * 跳转详细运单
		 * */
		@RequestMapping(params = "method=getShippingshenhe")
		public String getShippingshenhe(String pid,HttpServletRequest request) {
			request.setAttribute("flg", pid);
			return "DestinationFeeCuctome/XiangQingshenhe";
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
			List<SettlyfSh> list = dcs.getSettleShRc((page1 - 1) * rows1,rows1 , start_date, end_date, ddids);
			int count = dcs.getSettleShRcs(start_date, end_date, ddids);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		//审核界面查询
		@RequestMapping(params = "method=getShippingDriver")
		 public@ResponseBody DestinationFeeCloseMordel getShippingDriver(String id){
			DestinationFeeCloseMordel so = dcs.getShippingDriver(id);	
			return so;		 
		 }
		//审核订单导出
		@RequestMapping(params = "method=getCustomerInputOut")
		public @ResponseBody List<ShippingOrder> getCustomerInputOut(HttpServletResponse response,String[] headtitle, String[] fieldName,String pid,String send_time,String send_times,String shipindi,String jiesuStata,String shenhe,String jiesuantime,String jiesuantimes,String order_time,String order_times ,String idss,String [] checkarray){
			String filename = "客户代收运费审核运单信息导出";	
			List<DestinationFeeCloseMordel> list;
			if(checkarray!=null&&checkarray.length>0){
				list= dcs.getCustomerInputOut(null, null, null, null, null, null, null, null, null, null, checkarray,idss);	
			}else{
				list= dcs.getCustomerInputOut(pid, send_time, send_times, jiesuStata, shenhe, jiesuantime, jiesuantimes, order_time, order_times, shipindi, null,idss);				
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
			ExportUtils.outputHeaders(headtitle, workbook, "客户代收运费审核运单信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "客户代收运费审核运单信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();
					
		    } catch (Exception e) {
			e.printStackTrace();
		    }
			return null;	
	 }
		
}
