package com.jy.action;

import java.awt.image.BufferedImage;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.jy.common.ExportUtils;
import com.jy.common.OrderExcelForPOI;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.dao.OrderDao;
import com.jy.model.Delivery;
import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.OrderInfoService;
import com.jy.service.UserInfoService;

/*
 * 货运订单管理
 * */
@Controller
@RequestMapping(value = "/orderC.do")
public class OrderInfoController {
	@Resource
	private OrderInfoService csi;
	private String customid;
    @Resource
    private OrderDao ad;
	@Resource
	private UserInfoService uis;

	@RequestMapping(params = "method=orderCustomInfo")
	public String getorderCustomInfoMan(String menu_id,HttpServletRequest request,HttpSession session) {
		System.out.println("menu_id:"+menu_id);
		Integer[] rid = (Integer[]) session
				.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id, rid);
		if (list.size() > 0) {
			StringBuffer bf = new StringBuffer();
			for (String ss : list) {
				bf.append(ss);
				bf.append(",");

			}
			bf.deleteCharAt(bf.length() - 1);
			request.setAttribute("function", bf.toString());
			System.out.println(bf.toString());
			//session.setAttribute("function", bf.toString());
		} 
		return "order/orderCustomInfo";
	}
	//查看订单
	@RequestMapping(params = "method=getShipOrderInfo")
	public String getShipOrderInfoMan(String pid,HttpServletRequest request,String functions) {
		request.setAttribute("flg", pid);
		request.setAttribute("functions", functions);
		return "shipping_order/shippingOrderInfo";
	}
	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditorderCustom")
	public String getEditShipOrderPage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "order/EditorderCustom";
	}
	//查询是否有该订单数量
	@RequestMapping(params = "method=orderCustomMsg")
	public @ResponseBody Json getShipOrder(String pid, HttpServletRequest request) {
		int i=csi.getAorder(pid);
		Json json=new Json();
		if (i == 1) {
			json.setFlag(true);
		}else{
			json.setFlag(false);
		}
		return json;
	}
	//查询页面订单信息展示
	@RequestMapping(params = "method=getShipOrderPage")
	public String getShipOrderPage(String pid,String costomersid, HttpServletRequest request) {
	Delivery d=csi.getShipOrderMsg(pid);	
	//System.out.println(costomersid+"!!!!!!!!!!!!!!!!!!!!!!!");
			if(d.getShiping_order_id()!=null||d.getShiping_order_id()!=""){
				if(d.getShipping_order_state()==0){
					d.setOrder_states("未出库");
				}else if(d.getShipping_order_state()==1){
					d.setOrder_states("配送中");
				}else if(d.getShipping_order_state()==2){
					d.setOrder_states("转运中");
				}else if(d.getShipping_order_state()==4){
					d.setOrder_states("签收");
				}	
			}
			if(d.getSend_type()==null||d.getSend_type().equals("")){
				d.setSendtype("");
			}else{
				if(d.getSend_type()==0){
					d.setSendtype("客户自提");
				}else if(d.getSend_type()==1){
					d.setSendtype("转车送货");	
				}else if(d.getSend_type()==2){
					d.setSendtype("送货进仓");	
				}else if(d.getSend_type()==3){
					d.setSendtype("送货上楼");	
				}else if(d.getSend_type()==4){
					d.setSendtype("送货上门");	
				}					
			}	
			if(d.getPay_type()==0){
				d.setPaytype("回付");
				d.setHf_pay(d.getTransport_pay());
			}else if(d.getPay_type()==1){
				d.setPaytype("提付");
				d.setTf_pay(d.getTransport_pay());
			}else if(d.getPay_type()==2){
				d.setPaytype("现付");
				d.setXf_pay(d.getTransport_pay());
			}else if(d.getPay_type()==3){
				d.setPaytype("货到前付");
				d.setHdqf_pay(d.getTransport_pay());
			}
			if(d.getGoods_num()!=null&&!d.getGoods_num().equals("")&&d.getPractiacl_num()!=null&&!d.getPractiacl_num().equals("")){
				d.setOverGoodsNum(d.getGoods_num()-d.getPractiacl_num());
			}else if(d.getGoods_num()!=null&&!d.getGoods_num().equals("")&&(d.getPractiacl_num()==null||d.getPractiacl_num().equals(""))){
				d.setOverGoodsNum(d.getGoods_num());
			}else if((d.getGoods_num()==null||d.getGoods_num().equals(""))&&d.getPractiacl_num()!=null&&!d.getPractiacl_num().equals("")){
				d.setOverGoodsNum(-d.getPractiacl_num());
			}else{
				d.setOverGoodsNum(0);
			}
			
			//实收总运费计算getPaid_chayi getChayi_daifukuan1  paid1 代收 paid 提货款  paid_chayi		
				/*if(d.getPaid_chayi()!=""&&d.getPaid_chayi()!=null&&d.getChayi_daifukuan1()!=""&&d.getChayi_daifukuan1()!=null&&d.getChayi_daifukuan1().length()>0){
					d.setTransport_pay1(String .valueOf(Double.parseDouble(d.getPaid_chayi()))+"0");
					d.setSum_pay(String.valueOf(Double.parseDouble(d.getPaid_chayi())+Double.parseDouble(d.getChayi_daifukuan1()))+"0");
					}else if(d.getPaid_chayi()!=""&&d.getPaid_chayi()!=null&&(d.getChayi_daifukuan1()==""||d.getChayi_daifukuan1()==null)){
						d.setSum_pay(String.valueOf(Double.parseDouble(d.getPaid_chayi()))+"0");
						d.setTransport_pay1(String.valueOf(Double.parseDouble(d.getPaid_chayi()))+"0");
					}else if(d.getChayi_daifukuan1()!=""&&d.getChayi_daifukuan1()!=null&&(d.getPaid_chayi()==""||d.getPaid_chayi()==null)){
						d.setTransport_pay1("0.00");
						d.setSum_pay(String.valueOf(Double.parseDouble(d.getChayi_daifukuan1()))+"0");
					}else{
						if(d.getPaid()!=""&&d.getPaid()!=null&&d.getPaid1()!=""&&d.getPaid1()!=null){	
							d.setTransport_pay1(d.getPaid());
							d.setSum_pay(String.valueOf(Integer.parseInt(d.getPaid().substring(0,d.getPaid().length()-3))+Integer.parseInt(d.getPaid1().substring(0, d.getPaid1().length()-3)))+".00");
						}else if(d.getPaid()!=""&&d.getPaid()!=null&&(d.getPaid1()==""||d.getPaid1()==null)){
							d.setTransport_pay1(d.getPaid());
							d.setSum_pay(String.valueOf(Integer.parseInt(d.getPaid().substring(0, d.getPaid().length()-3)))+".00");
							}else if(d.getPaid1()!=""&&d.getPaid1()!=null&&(d.getPaid()==""||d.getPaid()==null)){
								d.setTransport_pay1("0.00");
								d.setSum_pay(String.valueOf(Integer.parseInt(d.getPaid1().substring(0, d.getPaid1().length()-3)))+".00");
							}
					}	*/
				//System.out.println(d.getUid()+"??????????????");
               // System.out.println(d.getCostomersid()+"@@@@@@@@@@@@@@@@@@");
		if(!"null".equals(costomersid)){
			d.setChange_pay("");
			//System.out.println(costomersid);
			d.setStart_phone("89089056");//电话
			d.setSend_fee1("");//送货费
			d.setCompany_name("易路通");
			//System.out.println("sssssssssdffffc");
			d.setCar_name ("易路通");
			d.setPhone_number("18562619978");
			}
			//运费核销 write_off5
			if(d.getIs_settlementyf().equals("2")){
				d.setSettl_yf("打卡");
			}else if(d.getIs_settlementyf().equals("1")){
				d.setSettl_yf("现金");
			}else {//状态为3 是未核销
				d.setSettl_yf("未结算");
			}
			//客户核销 write_off  write_off_z
			if(d.getAdorn_fee2()!=null&&d.getAdorn_fee2()!=""){
				if(d.getWrite_off()!=null&&d.getWrite_off()!=""){
					if(d.getWrite_off().equals("0")){
						d.setWrite_off_kh("打卡");
					}else if(d.getWrite_off().equals("1")){
						d.setWrite_off_kh("现金");
					}else {//状态为3 是未核销
						d.setWrite_off_kh("未结算");
					}		
				}
				
			}
		
			//中转费核销 write_off  write_off_c 中转费费核销文字 
			if(d.getChange_pay()!=null&&d.getChange_pay()!=""){
				if(d.getChange_write_off().equals("0")){
					d.setWrite_off_zh("打卡");
				}else if(d.getChange_write_off().equals("1")){
					d.setWrite_off_zh("现金");
				}else if(d.getChange_write_off().equals("3")){
					d.setWrite_off_zh("未结算");
				}
			}else {
				d.setWrite_off_zh("");
			}
			
			//司机核销 write_off3  write_off3_l
			if(d.getSend_fee1()!=null&&d.getSend_fee1()!=""){
				if(d.getSettlement_modes().equals("0")){
					d.setWrite_off_sj("现金");
				}else if(d.getSettlement_modes().equals("1")){
					d.setWrite_off_sj("油卡");
				}else if(d.getSettlement_modes().equals("3")){
					d.setWrite_off_sj("转账");
				}else {//状态为3 是未核销
					d.setWrite_off_sj("未结算");
				}
			}
		
			request.setAttribute("sp",d);	
			return "layout/shipOrderMsg";
	}


	// 导入
	@RequestMapping(params = "method=imp")
	public String goimp(String pid, HttpServletRequest request) {
		customid=pid;
		request.setAttribute("flg_id", pid);
		return "order/maplinimp";
	}

	// 做导入前的上传处理
	@RequestMapping(params = "method=startimplinplan")
	public String startimplinplan(HttpServletRequest request,
			@RequestParam(value = "files") MultipartFile files,String pid)	
			throws IllegalStateException, IOException {
		customid=pid;
		String path = request.getSession().getServletContext()
				.getRealPath("WebRoot/orderFiles/");// 文件路径
		// System.out.println(path);
		File filez = new File(path);
		if (!filez.exists()) {
			filez.mkdirs();
		}
		MultipartFile myfile = files;
		String filename = myfile.getOriginalFilename();
		String prefix = filename.substring(filename.lastIndexOf("."));
		File newfile = filez.createTempFile("shipOrder", prefix, filez);
		// System.out.println(newfile);
		String filesname = newfile.toString();
		filesname = filesname.substring(filesname.lastIndexOf("\\") + 1,
				filesname.length());
		request.setAttribute("filesname", filesname);
		myfile.transferTo(newfile);
		return "order/maplinimp";
	}

	// 上传开始保存到数据库
	@RequestMapping(params = "method=implinplan")
	public @ResponseBody
	String implinplan(HttpServletRequest request, String filename,String usersname) {
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		String filepath = request.getSession().getServletContext()
				.getRealPath("WebRoot/orderFiles/" + filename);
		OrderExcelForPOI oef = new OrderExcelForPOI();
		String flag = "";
		String pid=customid;
		try {
			flag = oef.impExcel(filepath,usersname,pid,request);
			deleteFile(filepath);// 执行上传文件删除操作
			customid="";
			return flag;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(flag
					+ "===========================================");
			return flag;
		}
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
	@RequestMapping(params = "method=getOrderCustom")
	public @ResponseBody
	Map getShipOrderInfos(String rows, String page, 
			String name ,String start_date1,String end_date2,String start_date,String end_date,String car_number,String type,String send_address,String phone,String is_arrive,String costomersid) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<OrderCustom> list = csi.getOrderCustomInfo((page1 - 1) * rows1,rows1, name, start_date1, end_date2, start_date, end_date, car_number, type, send_address, phone,is_arrive,costomersid);
		int count = csi.getOrderCustom(name, start_date1, end_date2, start_date, end_date, car_number, type, send_address, phone,is_arrive,costomersid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	/**
	  * 查询是否有关联的订单
	  * @param pid
	  * @return
	  */
	@RequestMapping(params = "method=OrderMsgNum")
	public @ResponseBody  Json  OrderMsgNum(String[] del){
		int i=csi.OrderMsgNum(del);
		Json json =new Json();
		if(i>0){
			json.setFlag(true);
		}else{
			json.setFlag(false);
		}
		return json;
	}
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteOrderCustom")
	public @ResponseBody
	Json delShipOrder(String[] del) {
		Json json = new Json();
		List<ShippingOrder> list=csi.OrderMsgIds(del);		
		if(list.size()>0){
			csi.deleteOrder(list);
		}	
		csi.deleteOrdercustoms(del);			
			csi.deleteOrderMsg(del);
		int truck = csi.deleteOrderCustom(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addOrderCustom")
	public String addShipOrder() {
		return "order/AddorderCustom";
	}

	// 保存
	@RequestMapping(params = "method=saveOrderCustom")
	public @ResponseBody
	Json saveOrderCustom(OrderCustom d,HttpServletRequest request) {
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
        d.setUser_id(user.getId());
		Json json = new Json();
		d.setCustom_id(UUIDUtils.getUUID());
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		int truck = csi.saveOrderCustom(d);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
			return json;
		}

	}

	// 修改查询
	/*
	 * 订单重复查询
	 */
	@RequestMapping(params = "method=getUpdateOrderCustom")
	public @ResponseBody
	OrderCustom getUpdateOrderCustom(String id) {
		OrderCustom der = csi.getUpdateOrderCustom(id);
		return der;
	}

	

	// 修改
	@RequestMapping(params = "method=updateOrderCustom")
	public @ResponseBody
	Json updateShipOrder(OrderCustom d) {
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		Json json = new Json();
		int i = csi.updateOrderCustom(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	
	 /**
	  * 修改订单备注
	  * @param pid
	  * @param notes
	  * @return
	  */
	@RequestMapping(params="method=getRemakesOrder")
	public  @ResponseBody Json getRemakesOrder(String pid,String notes,String remarks_orde ,String remarks_date){
		System.out.println(notes);
		int i=csi.getRemakesOrder(pid,notes,remarks_orde,remarks_date);
		Json json=new Json();
		if(i>0){
			json.setFlag(true);
		}else{
			json.setFlag(false);
		}
		return json;
	}

	//客户检索 getCustomer 
	@RequestMapping(params = "method=getCustomer")
	public @ResponseBody
	String getCustomer(String name) {
		List<OrderCustom> list = csi.getCustomer(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		OrderCustom co = null;
		int i =1;
		int j = 0;
		for (OrderCustom d : list) {
			if (d.getCustomer_id()!=null&&d.getCustomer_id()!="") {
				co =csi.getCar_timeMax(d.getCustomer_id());
			}
			
			jb = new JSONObject();
			jb.put("id", d.getCustomer_id());
			jb.put("name", d.getCustomer_name());
			jb.put("customer_grade", d.getCustomer_grade());
				System.out.println(d.getCustomer_grade()+"(▔□▔)");
			if (!"".equals(co)&&co != null) {
				j =Integer.parseInt(co.getCar_time());
			}
			

			
			jb.put("car_time", j+i);
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	
/*	// 车牌检索
	@RequestMapping(params = "method=getPlateNumberLength")
	public @ResponseBody
	String getPlateNumber(String number) {
		List<OrderCustom> list = csi.getPlateNumber(number);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (OrderCustom d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}*/
	

	// 导出信息
	@RequestMapping(params = "method=outShipOrder")
	public @ResponseBody
	String outShipOrder(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response, String name, String plate_number,
			String type, String start_date, String end_date) {
		String filename = "运单信息导出";
		List<OrderCustom> list = csi.getOrderCustomAll(name, plate_number,
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
	// 首页全部查询
		@RequestMapping(params = "method=getShipOrder")
		public @ResponseBody
		Map getShipOrderInfo(String rows, String page, String name,
				String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = csi.getShipOrderInfo((page1 - 1) * rows1,
					rows1, name, phone_number, type, start_date, end_date,pid,phone, order_state, pay_type, send_address,goods_name);
			int count = csi.getShipOrder(name, phone_number, type, start_date,
					end_date,pid, phone, order_state, pay_type, send_address,goods_name);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
	
		/**
		 * 订单修改记录查询
		 * @param rows
		 * @param page
		 * @param pid
		 * @return
		 */
		@RequestMapping(params = "method=getShipOrder1")
		public @ResponseBody
		Map getShipOrderInfo1(String rows, String page,String pid) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			System.out.println(pid);
			List<ShippingOrder> list = csi.getShipOrderInfo1((page1 - 1) * rows1,
					rows1,pid);
			System.out.println(list.size());
			int count = csi.getShipOrder1(pid);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		
		
		//首页订单页面转
		@RequestMapping(params="method=getOrderMsgSY")
		public String  getOrderMsgSY(){
			return"layout/getOrderMsgSY";
		}
}
