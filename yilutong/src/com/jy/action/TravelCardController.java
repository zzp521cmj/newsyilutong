package com.jy.action;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.jy.common.SimpleClient;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.CarInvoice;
import com.jy.model.CarMaintenance;
import com.jy.model.Insurance;
import com.jy.model.Registration;
import com.jy.model.ShipperOrderImg;
import com.jy.model.TransportCard;
import com.jy.model.TravelCard;
import com.jy.model.TravelImg;
import com.jy.model.User;
import com.jy.service.InsuranceService;
import com.jy.service.TemporaryCarService;
import com.jy.service.TravelCardService;
import com.jy.service.UserInfoService;
import com.jy.csaction.BaseAction;
/**
 * 固定车辆信息
 * @author lx
 */
@Controller
@RequestMapping("/travel.do")
public class TravelCardController  extends BaseAction {
	@Resource
	private TravelCardService tc;
	@Resource
	private TemporaryCarService cs;
	@Resource
	private UserInfoService uis;
	@Resource
	private InsuranceService is;
	@RequestMapping(params = "method=travel")
	public String travel(String menu_id,HttpSession session){
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
		return "info/travel";
	}
	/**
	 * 新增车辆页面
	 * @return
	 */
	@RequestMapping(params = "method=getAddCar")
	public String addCar(){
		
		return "info/addTravel";
	}
	//跳页面
	@RequestMapping(params = "method=backImg")
	public String backImg(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "info/travelImg";
	}
	
//	上传图
	@RequestMapping(params = "method=up")
	public void upload(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) {

		try {
			super.upload(file, "travel", request);

			/*
			 * response.getWriter().print(super.getFileName());
			 * filename+=super.getFileName();
			 */
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	//上传
	@RequestMapping(params = "method=savepit")
	public @ResponseBody
	Json savetravelImg(String  ids , HttpSession session) {
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
				List<TravelImg> travelImgs=new ArrayList<TravelImg>();
			
				
				/*List<ShipperOrderImg> shiOrdImg = new ArrayList<ShipperOrderImg>();*/
				for (int j = 0; j < filenNamess.length; j++) {
					TravelImg travelImg = new TravelImg();
					travelImg.setImage_id(UUIDUtils.getUUID());
					travelImg.setCar_id(ids);
					travelImg.setImage_url(filenNamess[j]);
					travelImgs.add(travelImg);
				
				}
				int  b = tc.saveTravelImg(travelImgs);	
				session.setAttribute("filename","");
				if(b>0){
					json.setFlag(true);
					}else{
						json.setFlag(false);
						}					
					}														
		return json;
	}
	//查看
	@RequestMapping(params = "method=getimgurl")
	public String getimgurl(String iurl, HttpServletRequest request) {
		List<TravelImg> listOrderImg = tc.getTravelImg(iurl);
		
		if (listOrderImg.size() == 0) {
			request.setAttribute("iurl", "");
		}
		request.setAttribute("iurl", listOrderImg);

		return "info/travelupImg";
	}

	/**
	 * 新增车辆
	 * @param travel
	 * @param tran
	 * @param reg
	 * @param invoice
	 * @param main
	 * @return
	 */
	@RequestMapping(params = "method=addCar")
	public @ResponseBody Json addCars(TravelCard travel,TransportCard tran,Registration reg,CarInvoice invoice,CarMaintenance main,Insurance in){
		Json json3 = new Json();
		String uuid =UUIDUtils.getUUID();
		travel.setTravelCardId(uuid);
		int tra = tc.addTravel(travel);
		
		
		
		
		tran.setTravelCardId(travel.getTravelCardId());
		int tr = tc.addTran(tran);
		reg.setTravelCardId(travel.getTravelCardId());
		reg.setTravelCardId(uuid);
		int re = tc.addReg(reg);
		invoice.setTravelCardId(uuid);
		int invo = tc.addInvoice(invoice);
		main.setTravelCardId(uuid);
		int ma = tc.addMain(main);
		travel.setState(1);
		in.setTravelCardId(uuid);
		in.setInsured(travel.getCarOwner());
		in.setInsuredCard(travel.getUser_idcard());
		in.setPlateNumber(travel.getPlateNumber());
		is.addInsurance(in);
		if(tra>0 || tr>0 || re>0 || invo>0 || ma>0){
			json3.setFlag(true);
			return json3;
		}
		json3.setFlag(false);
		return json3;
	}
	/**
	 * 根据车牌号查询
	 * @param search
	 * @return
	 */
	@RequestMapping(params = "method=getCarNum")
	public @ResponseBody String getCar_Num(String search,String xxx){
		List<TravelCard> list=tc.getCar_Num(search,xxx);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (TravelCard t: list) {
			jb=new JSONObject();
			jb.put("id", t.getTravelCardId());
			jb.put("name",t.getPlateNumber());
			jsons.add(jb);
		}
			return jsons.toString();
	}
	/**
	 * 跳转到修改界面
	 * @return
	 */
	@RequestMapping(params = "method=getEditTravel")
	public String getEditTravel(String travelCardId,HttpServletRequest req){
		req.setAttribute("flg", travelCardId);
		return "info/editTravel";
	}
	/**
	 * 获取修改信息
	 * @param travelCardId
	 * @return
	 */
	@RequestMapping(params = "method=editTravel")
	public @ResponseBody TravelCard getTra(String travelCardId){
		TravelCard travel = tc.getTra(travelCardId);
		String did = travel.getDepartmentId();
		travel.setDepartmentId(uis.getDepartment(did));
		return travel;
	}
	/**
	 * 修改车辆信息
	 * @param travel
	 * @return
	 */
	@RequestMapping(params = "method=updateTravel")
	public @ResponseBody Json updateTra(TravelCard travel,TransportCard tran,Registration reg,CarInvoice invoice,CarMaintenance main,Insurance insu){
		Json json = new Json();
		boolean b = isNumeric0(travel.getDepartmentId());
		String a=uis.namegetDepartment(travel.getDepartmentId());
		if(a!=null&&!a.equals("")){
			travel.setDepartmentId(uis.namegetDepartment(travel.getDepartmentId()));
		}
		int edit = tc.editTra(travel);
		//System.out.println("第二步"+edit);
		int trans = tc.editTran(tran);
		//System.out.println("第三步"+trans);
		int regs = tc.editReg(reg);
		//System.out.println("第四步"+regs);
		int inv = tc.editInvoice(invoice);
		//System.out.println("第五步"+inv);
		int ma = tc.editMain(main);
		//System.out.println("第六步"+ma);
		travel.setState(1);
		insu.setTravelCardId(travel.getTravelCardId());
		insu.setInsured(travel.getCarOwner());
		insu.setInsuredCard(travel.getUser_idcard());
		insu.setPlateNumber(travel.getPlateNumber());
		is.editInsurance(insu);
		//System.out.println("第七步");
		if(edit>0 || trans>0 || regs>0 || inv>0 || ma>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	private static boolean isNumeric0(String str){
		  for(int i=str.length();--i>=0;){
		   int chr=str.charAt(i);
		   if(chr<48 || chr>57)
		    return false;
		  }
		  return true;
		 }
	/**
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteTravel")
	public @ResponseBody Json delTruck(String[] del){
		Json json = new Json();
		int truck = tc.deleteTravel(del);
		is.deleteInsurance(del);
		/*TravelCard t = new TravelCard();
		for(int i=0;i<del.length;i++){
			t = tc.getOneCar(del[i]);
			t.setState(0);
		}*/
		if(truck>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	@RequestMapping(params = "method=checkAgreement")
	public @ResponseBody Json checkAgreement(String[] del){
		Json json = new Json();
		int truck = tc.checkAgreement(del);
		if(truck>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	@RequestMapping(params = "method=checkCarName")
	public @ResponseBody Json checkCarName(String name){
		Json json = new Json();
		//int truck = tc.checkTemCarName(name);
		int truck2 = tc.checkTraCarName(name);
		if(truck2>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	/**
	 * 分页
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	@RequestMapping(params = "method=getTravel")
	public @ResponseBody Map<String, Object> getTravel(String page,String rows,String plateNumber,String did,String carType,HttpServletRequest request,String driverid,String box_add){
		User user = (User) request.getSession().getAttribute(
				SessionInfo.SessionName);
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
		if("".equals(did)){
			did=null;
		}
		
		if(user.getDriver_id()!=null&&!user.getDriver_id().equals("")){
			driverid=user.getDriver_id();
		}
		List<TravelCard> tr = tc.getTravel((page1 - 1) * rows1, rows1, plateNumber,did,carType,driverid,box_add);

		int count = tc.getCount(plateNumber,did,carType,driverid,box_add);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", tr);
		return map;
		
	}
	/**
	 * 勾选导出车辆信息
	 */
	/*	@RequestMapping(params = "method=outputCar")
		public @ResponseBody String  outputCar(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String plateNumber,String did,String[] putCarId,HttpServletRequest request,String driverid) {
			String filename = "固定车辆导出";
			User user = (User) request.getSession().getAttribute(
					SessionInfo.SessionName);
			if(user.getDriver_id()!=null&&!user.getDriver_id().equals("")){
				driverid=user.getDriver_id();
			}
					List<TravelCard> list = tc.getAllCar(driverid,putCarId);
				
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
				ExportUtils.outputHeaders(headtitle,workbook,"固定车辆列表");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"固定车辆列表");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}*/
		/**
		 * 导出全部信息
		 */
			@RequestMapping(params = "method=outputCarlist")
			public @ResponseBody String  outputCarlist(String datas, String[] headtitle1,String[] fieldName1,
					HttpServletResponse response,String plateNumber,String did,HttpServletRequest request,String driverid,String carType,String box_add,String [] putCarId) {
			
				String filename = "车辆导出";
				User user = (User) request.getSession().getAttribute(
						SessionInfo.SessionName);
				if(user.getDriver_id()!=null&&!user.getDriver_id().equals("")){
					driverid=user.getDriver_id();
				}
				
				List<TravelCard> list;
				System.out.println("putCarId.length============"+putCarId.length);
				if(putCarId.length>0){
					list = tc.getAllCarlist(null,null,driverid,null,null,putCarId);
				}else{
					list = tc.getAllCarlist(plateNumber, did,driverid,carType,box_add,null);
					
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
				//调用工具类创建表头
					ExportUtils.outputHeaders(headtitle1,workbook,"固定车辆列表");
				//调用工具类生成内容
					ExportUtils.outputColums(fieldName1, list,workbook,1,"固定车辆列表");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
			}
	public void tmsCar(TravelCard travel){
		//String str="http://192.168.5.30:8080/truck_cloud/tms.do?method=ceshi2";
		String str="http://192.168.5.123:8013/Lorry_Cloud_WBS.asmx/InsCar";
		JSONArray json = new JSONArray();
		JSONObject jsonobjec=new JSONObject();
		jsonobjec.put("czxm", travel.getCarOwner());
		jsonobjec.put("jsy", travel.getCarOwner());
		jsonobjec.put("tel", travel.getTels());
		String xiangxing = cs.getXiang(travel.getBoxType());
		if(xiangxing==null||"".equals(xiangxing))
		{
			jsonobjec.put("len","");
		}else{
			jsonobjec.put("len",xiangxing.substring(0,1));
		}
		jsonobjec.put("jsysfz",travel.getUser_idcard());
		jsonobjec.put("lx", travel.getCarType());
		jsonobjec.put("carport", travel.getPlateNumber());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		jsonobjec.put("htksrq", df.format(new Date()));
		 Calendar c = Calendar.getInstance();  
	        c.add(Calendar.DATE,  7);  
	        Date monday = c.getTime();
	        String preMonday = df.format(monday);
		jsonobjec.put("htjsrq", preMonday);
		jsonobjec.put("jgid", travel.getDepartmentId());
		jsonobjec.put("zt", travel.getState());
		jsonobjec.put("bz", "0");
		json.add(jsonobjec);
		//System.out.println(json.toString());
		JSONArray json2=SimpleClient.doPost(str,json);
		//System.out.println(json2.toString());
		
	}
	//当月到期的年审
	@RequestMapping(params = "method=dangyueTravelCard")
	public @ResponseBody
	List<TravelCard> dangyueTravelCard(){
		Calendar cal = Calendar.getInstance();
		String  year=(cal.get(Calendar.YEAR)-1)+"";
		String month=(cal.get(Calendar.MONTH)+1)+"";
		if(month.length()==1){
			month="0"+month;
		}
		List<TravelCard>list=tc.dangyueTravelCard(year, month);
		return list;
	}
	//当月到期的二级维护
	@RequestMapping(params = "method=dangyueTravelCardtwo")
	public @ResponseBody
	List<TravelCard> dangyueTravelCardtwo(){
		Calendar cal = Calendar.getInstance();
		String  year=cal.get(Calendar.YEAR)+"";
		String month=(cal.get(Calendar.MONTH)+1)+"";
		if(month.length()==1){
			month="0"+month;
		}
		List<TravelCard>list=tc.dangyueTravelCardtwo(year, month);
		return list;
	}
}
