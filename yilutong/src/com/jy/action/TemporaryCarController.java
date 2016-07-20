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
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.SessionInfo;
import com.jy.common.SimpleClient;
import com.jy.dao.Json;
import com.jy.model.Car_length;
import com.jy.model.City_info;
import com.jy.model.Source;
import com.jy.model.TemporaryCar;
import com.jy.model.User;
import com.jy.service.Demand_releaseService;
import com.jy.service.TemporaryCarService;
import com.jy.service.UserInfoService;
/**
 * 临时车辆信息
 * @author lx
 */
@Controller
@RequestMapping("/temcar.do")
public class TemporaryCarController {
	@Resource
	private Demand_releaseService demand_releaseService;
	@Resource
	private TemporaryCarService cs;
	@Resource
	private UserInfoService uis;
	/**
	 * 车辆信息查询
	 * @return
	 */
	@RequestMapping(params = "method=temcar")
	public String getTem(String menu_id,HttpSession session){
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
		return "temCar/temcar";
	}
	/**
	 * 跳转到添加界面
	 * @return
	 */
	@RequestMapping(params = "method=getAddCar")
	public String getAddCar(){
		
		return "temCar/addTemcar";
	}
	/**
	 * 添加车辆
	 * @param tem
	 * @return
	 */
	@RequestMapping(params = "method=addCar")
	public @ResponseBody Json addCar(TemporaryCar tem){
		/*System.out.println(tem.getRoute_id());
		System.out.println("+++++++++++++++++++++++++++++++++++");
		System.out.println(tem.getNormalRoute());*/
		Json json3 = new Json();
		int add = cs.addCar(tem);
		tem.setState(1);
		this.tmsCar(tem);
		if (add > 0) {
			json3.setFlag(true);
			return json3;
		}
			json3.setFlag(false);
			return json3;
	}
	/**
	 * 查询竞价车辆
	 * @param tem
	 * @return
	 */
	@RequestMapping(params = "method=getjingjia")
	public @ResponseBody Json getjingjia(String id){
	
		Json json3 = new Json();
		int add = cs.getjingjia(id);
		if (add > 0) {
			json3.setFlag(true);
			return json3;
		}
			json3.setFlag(false);
			return json3;
	}
	/**
	 * 批量删除
	 * @param del
	 * @return
	 */
	@RequestMapping(params = "method=deleteTem")
	public @ResponseBody Json delTem(String[] del){
		Json json = new Json();
		int tem = cs.deleteTemCar(del);
		TemporaryCar tem2 = new TemporaryCar();
		for(int i=0;i<del.length;i++){
			tem2 = cs.getOneCar(del[i]);
			tem2.setState(0);
			this.tmsCar(tem2);
		}
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
	@RequestMapping(params = "method=getEditTemCar")
	public @ResponseBody TemporaryCar getEditTemCar(String temporaryCarId){
		TemporaryCar truck = cs.getEditTemCar(temporaryCarId);
		String did = truck.getInstitutionId();
		truck.setInstitutionId(uis.getDepartment(did));
		return truck;
		
	}
	/**
	 * 去修改页面
	 * @return
	 */
	@RequestMapping(params = "method=editTem")
	public String editTruck(String temporaryCarId,HttpServletRequest req){
		req.setAttribute("flg", temporaryCarId);
		return "temCar/editTemcar";
	}
	/**
	 * 去详细信息页面
	 * @return
	 */
	@RequestMapping(params = "method=xinxiTem")
	public String xinxitem(String temporaryCarId,HttpServletRequest req){
		req.setAttribute("flg", temporaryCarId);
		return "temCar/xinxiTemcar";
	}
	// 获取装货城市下拉框列表
		@RequestMapping(params = "method=getCity_info")
		public @ResponseBody
		String getCity_info(String cityinfo) {
			List<City_info> list = demand_releaseService.getCity_info(cityinfo);
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (City_info city_info : list) {
				jb = new JSONObject();
				jb.put("id", city_info.getCitycode());
				jb.put("name", city_info.getCityname());
				jsons.add(jb);
			}
			return jsons.toString();
		}
	/**
	 * 修改车辆信息
	 * @param tem
	 * @return
	 */
	@RequestMapping(params = "method=updateTem")
	public  @ResponseBody Json editTemCar(TemporaryCar tem) {
		Json json = new Json();
		String did = tem.getInstitutionId();
		boolean b = isNumeric0(did);
		if(!b){
		tem.setInstitutionId(uis.namegetDepartment(did));
		}
		int i = cs.editTemCar(tem);
		tem.setState(1);
		this.tmsCar(tem);
		if (i > 0) {
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
	 * 根据车牌号查询
	 * @param search
	 * @return
	 */
	@RequestMapping(params = "method=getCarNum")
	public @ResponseBody String getCar_Num(String search,String xx){
		List<TemporaryCar> list=cs.getCar_Num(search,xx);
		JSONObject jb=null;
		JSONArray jsons=new JSONArray();
		for (TemporaryCar t: list) {
			jb=new JSONObject();
			jb.put("id", t.getTemporaryCarId());
			jb.put("name",t.getPlateNumber());
			jsons.add(jb);
		}
			return jsons.toString();
	}
	/**
	 * 来源信息
	 * @return
	 */
	@RequestMapping(params = "method=getSource")
	public @ResponseBody List<Map<String, Object>> getSource() {
		List<Source> state = cs.getSource();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (Source st : state) {
			map = new HashMap<String, Object>();
			map.put("id", st.getSourceId());
			map.put("text", st.getSourceName());
			list.add(map);
		}
		return list;
	}
	
	/**
	 * 厢型信息
	 * @return
	 */
	@RequestMapping(params = "method=getLength")
	public @ResponseBody List<Map<String, Object>> getLength() {
		List<Car_length> state = cs.getLength();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		for (Car_length st : state) {
			map = new HashMap<String, Object>();
			map.put("id", st.getLength_id());
			map.put("text", st.getLength_name());
			list.add(map);
		}
		return list;
	}
	/**
	 * 分页
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	@RequestMapping(params = "method=getTemCar")
	public @ResponseBody Map<String, Object> getTemCar(String page,String rows,String plateNumber,String carLength,String volume,String load_s,String source,String carType,String boxType){
		/*System.out.println("plateNumber+++"+plateNumber);
		System.out.println("carLength+++"+carLength);
		System.out.println("volume+++"+volume);
		System.out.println("load_s++++"+load_s);
		System.out.println("source++++"+source);
		System.out.println("carType++++"+carType);
		System.out.println("boxType++++"+boxType);*/
		
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
		List<TemporaryCar> tr = cs.getTemCar((page1 - 1) * rows1, rows1, plateNumber,carLength,volume,load_s,source,carType,boxType);
		int count = cs.getCount(plateNumber, carLength, volume, load_s, source, carType, boxType);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", tr);
		return map;
		
	}
	/**
	 * 导出车辆信息
	 */
		@RequestMapping(params = "method=outputCar")
		public @ResponseBody String  outputCar(String datas, String[] headtitle,String[] fieldName,
				HttpServletResponse response,String plateNumber,String carLength,String volume,
				String load_s,String source,String carType,String boxType) {
			String filename = "临时车辆导出";
			List<TemporaryCar> list = cs.getAllCar(plateNumber, carLength, volume, load_s, source, carType, boxType);
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
				ExportUtils.outputHeaders(headtitle,workbook,"临时车辆列表");
			//调用工具类生成内容
				ExportUtils.outputColums(fieldName, list,workbook,1,"临时车辆列表");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		//接口共同方法
	public void tmsCar(TemporaryCar tem){
		String str="http://192.168.5.123:8013/Lorry_Cloud_WBS.asmx/InsCar";
		//String str="http://192.168.5.30:8080/truck_cloud/tms.do?method=ceshi2";
		JSONArray json = new JSONArray();
		JSONObject jsonobjec=new JSONObject();
		jsonobjec.put("czxm", tem.getUserName());
		jsonobjec.put("jsy", tem.getUserName());
		jsonobjec.put("tel", tem.getTel());
		String xiangxing = cs.getXiang(tem.getBoxType());
		if(xiangxing==null||"".equals(xiangxing))
		{
			jsonobjec.put("len","");
		}else{
			jsonobjec.put("len",xiangxing.substring(0,1));
		}
		jsonobjec.put("jsysfz",tem.getUser_idcard());
		jsonobjec.put("lx", tem.getCarType());
		jsonobjec.put("carport", tem.getPlateNumber());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		jsonobjec.put("htksrq", df.format(new Date()));
		 Calendar c = Calendar.getInstance();  
	        c.add(Calendar.DATE,  7);  
	        Date monday = c.getTime();
	        String preMonday = df.format(monday);
		jsonobjec.put("htjsrq", preMonday);
		jsonobjec.put("jgid", tem.getInstitutionId());
		jsonobjec.put("zt", tem.getState());
		jsonobjec.put("bz", "1");
		json.add(jsonobjec);
		JSONArray json2=SimpleClient.doPost(str,json);
		//System.out.println(json2.toString());
		
	}
}
