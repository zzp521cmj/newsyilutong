package com.jy.action;

import java.io.UnsupportedEncodingException;
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
import javax.swing.filechooser.FileSystemView;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.ctc.wstx.util.DataUtil;
import com.jy.common.BaiduWeather;
import com.jy.common.DateUtils;
import com.jy.common.SessionInfo;
import com.jy.dao.Json;
import com.jy.model.LinStandard;
import com.jy.model.Maps;
import com.jy.model.Mapsite;
import com.jy.model.OldMointorData;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;
import com.jy.model.Taskonlineimport;
import com.jy.model.User;
import com.jy.service.MapService;
import com.jy.service.RemarkMapService;

@Controller
@RequestMapping(value = "/map.do")
public class MapController {
	@Resource
	private MapService mapService;

	// 地图展示页面
	@RequestMapping(params = "method=getMap")
	public String getMap() {
		return "map/map";
	}
	// 地图展示页面
	@RequestMapping(params = "method=getorderpage")
	public String toorder(String carno,HttpServletRequest request) {
		request.setAttribute("carno", carno);
		return "map/showorder";
	}
	@RequestMapping(params = "method=getMapgjhf")
	public String getMapgjhf() {
		return "map/mapgjhf";
	}

	@RequestMapping(params = "method=getmapbzxl")
	public String getmapbxgl() {
		return "map/mapbxgl";
	}

	@RequestMapping(params = "method=getRemarkMap")
	public String remarkMap() {
		return "map/remarkMap";
	}

	/**
	 * 获取select2的车牌号
	 */
	/*
	 * @RequestMapping(params = "method=getcarnotoselect") public @ResponseBody
	 * String getcarnotoselect(String carno) { List<Maps> list =
	 * mapService.getcarnotoselect(carno); JSONObject jb = null; JSONArray jsons
	 * = new JSONArray(); for (LinStandard l : list) { jb = new JSONObject();
	 * jb.put("id", l.getLinid()); jb.put("name", l.getLinname());
	 * jsons.add(jb); } return jsons.toString(); }
	 */
	/**
	 * 画框取车通过车牌号获取对应的车辆信息
	 * 
	 * @param car
	 * @return String
	 */
	@RequestMapping(params = "method=getcarinfo")
	public @ResponseBody
	String returncarinfo(String car) {
		try {
			car = new String(car.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {

		}
		car = car.substring(1, car.length() - 1);
		String[] cars = car.split(",");
		List<Maps> carlist = mapService.returncarinfo(cars);
		String maps = JSONArray.fromObject(carlist).toString();
		return maps;
	}

	/**
	 * 开始加载地图时加载mark所需要的信息
	 * 
	 * @param carno
	 * @return String
	 */
	@RequestMapping(params = "method=loadmapinfo")
	public @ResponseBody
	String loadmapinfo(String carno,HttpSession session) {
		/*if (carno != null) {
			try {
				carno = new String(carno.getBytes("iso-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}*/
		User user=(User) session.getAttribute(SessionInfo.SessionName);

		List<Maps> loadmaplist = mapService.loadmapinfo(carno,user.getCostomersid());
		String infotomap = JSONArray.fromObject(loadmaplist).toString();
		return infotomap;
	}

	/**
	 * 加载站点开始
	 * 
	 * @return String
	 */
	@RequestMapping(params = "method=loadmarkforzd")
	public @ResponseBody
	String loadmarkforzd() {
		List<Remark> allrmklist = null;
		if (mapService.getallremark() != null) {
			allrmklist = mapService.getallremark();
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (Remark r : allrmklist) {
				jb = new JSONObject();
				jb.put("rid", r.getRemark_id());
				jb.put("rname", r.getRemark_name());
				jb.put("dname", r.getDepartment_name());
				jb.put("rtype", r.getRemark_state());
				jb.put("apoint", r.getRemark_point());
				jb.put("rad", r.getRemark_address());
				jb.put("rran", r.getRemark_range_name());
				jsons.add(jb);
			}
			return jsons.toString();
		} else {
			return "";
		}
	}

	/**
	 * 通过连锁店名字获取当前的连锁店信息
	 * 
	 * @param dname
	 * @return String
	 */
	@RequestMapping(params = "method=getallremarkbydname")
	public @ResponseBody
	String getallremarkbydname(String dname) {
		String name = "";
		try {
			name = new String(dname.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Remark> onelist = mapService.getallremarkbydname(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Remark r : onelist) {
			jb = new JSONObject();
			jb.put("rname", r.getRemark_name());
			jb.put("dname", r.getDepartment_name());
			jb.put("rad", r.getRemark_address());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/**
	 * 加载所有[分页查询]
	 * 
	 * @param rows
	 * @param page
	 * @param carno
	 * @param dept
	 * @return
	 */
	@RequestMapping(params = "method=loadallcarinfo")
	public @ResponseBody
	Map loadallcarinfo(String rows, String page, String carno, String dept,String ydh,HttpSession session) {
		User user=(User) session.getAttribute(SessionInfo.SessionName);
		
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<Maps> list = mapService.loadallcarinfo((page1 - 1) * rows1, rows1,
				carno, dept,ydh,user.getCostomersid());
		int count = mapService.loadallcarinfocount(carno, dept,ydh,user.getCostomersid());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/**
	 * 导出画框取车得到的车辆信息
	 * 
	 * @param outjson
	 *            前台传入的json串
	 * @param expFilePath
	 *            路径
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "method=outjsontoexcel")
	public @ResponseBody
	Json outjsontoexcel(String outjson, String expFilePath,
			HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("application/vnd.ms-excel;");
		SimpleDateFormat df = new SimpleDateFormat("yy-MM-dd HH:mm:ss");// 设置日期格式
		String filenamefromdate = df.format(new Date());// new Date()为获取当前系统时间
		filenamefromdate = filenamefromdate.replaceAll("\\D+", "");
		expFilePath = "导出的车辆信息" + filenamefromdate;// 根据时间产生文件名字
		
		String msg = outjson.substring(1, outjson.length());
		Json json = new Json();
		try {
			expExcel(expFilePath, msg, response);
			json.setFlag(true);
		} catch (Exception e) {
			e.printStackTrace();
			json.setFlag(false);
		}
		return null;
	}

	/**
	 * 利用poi写json截取按cell导出的方法
	 * 
	 * @param expFilePath
	 *            ,mess
	 * @param mess
	 */
	public void expExcel(String expFilePath, String mess,HttpServletResponse response) {
		OutputStream os = null;
		HSSFWorkbook book = null;
		String[] mes = mess.split("\\|");
		String[] head = { "车号", "设备号", "状态", "机构", "位置", "定位时间", "司机姓名", "司机电话" };
		try {
			// 创建工作区(97-2003)
			// 创建第一个sheet页
			book = new HSSFWorkbook();
			Sheet sheet = null;
			Row row = null;
			sheet = book.createSheet("车辆信息");
			row = sheet.createRow(0);
			for (int k = 0; k < head.length; k++) {
				row.createCell(k).setCellValue(head[k]);
			}
			for (int i = 1; i < mes.length + 1; i++) {
				String[] ce = mes[i - 1].split(",");
				// 生成第一行
				row = sheet.createRow(i);
				for (int j = 0; j < ce.length; j++) {
					// 给第一行的第一列赋值
					row.createCell(j).setCellValue(ce[j]);
				}
			}
			response.setHeader("Content-Disposition","attachment;filename=\""
	                 +new String(expFilePath.getBytes("gbk"), "iso-8859-1")
	                 +".xls\"");
			// 写文件
			// 输出流
			os = response.getOutputStream();
			book.write(os);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭输出流
			try {
				os.flush();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 以下为追踪\回放的方法============华丽丽的分割线==============================
	 */

	/**
	 * 
	 * @param gzhidvalue
	 * @param request
	 * @return 跟踪进入
	 */
	@RequestMapping(params = "method=getmapzz")
	public String getmapzz(String gzhidvalue, HttpServletRequest request) {
		request.setAttribute("mapzz", gzhidvalue);
		return "map/mapzz";
	}

	/**
	 * 获取单挑追踪所需要的信息通过车号
	 * 
	 * @param carno
	 * @return
	 */
	@RequestMapping(params = "method=getgzinfo")
	public @ResponseBody
	String getgzinfo(String carno) {
		List<OldMointorData> omdlist = null;
		if (mapService.gethfinfo(carno) != null) {
			omdlist = mapService.gethfinfo(carno);
		} else {
			omdlist = new ArrayList<OldMointorData>();
		}
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (OldMointorData o : omdlist) {
			jb = new JSONObject();
			jb.put("lng", o.getDlng());
			jb.put("lat", o.getDlat());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	/**
	 * ====================== 回放开始 ================================
	 */
int i=0;
	// 跳转
	@RequestMapping(params = "method=getmaphf")
	public String getmaphf(String hzhidvalue, HttpServletRequest request) {
		
		request.setAttribute("maphf", hzhidvalue);
		return "map/mapgjhf";
	}

	@RequestMapping(params = "method=gethfinfo")
	public @ResponseBody
	String gethfinfo(String carno, String times) {
		i=i+1;
		String starttime = "";
		String endtime = "";
		if (times != null && !times.equals("")) {
			String[] str = times.split("至");
			starttime = str[0].trim();
			endtime = str[1].trim();
			List<Maps> mplist = mapService.gethfmess(carno, starttime, endtime);// 获取坐标点集合
			// 开始处理坐标合集保存停留点
			// 声明一个数组保存时间点
			/*List<String> siteList = new ArrayList<String>();
			String t = "";// 记录停留点开始时间
			double st = 0;// 记录停留点持续时间
			for (int i = 0; i < mplist.size(); i++) {
				Mapsite mst=new Mapsite();
				if (mplist.get(i).getGpsstate().equals("0.0")) {
				
					// 如果连续为0时
					if (i >= 1) {
						st = DateUtils
						.diffDatemin(DateUtils.parseDates(mplist.get(i)	.getNowdate(),"yyyy-MM-dd HH:mm:ss"), 
						DateUtils.parseDates(t,"yyyy-MM-dd HH:mm:ss"));
					}
					t = mplist.get(i).getNowdate();
				}else{//速度不为0
					if(!t.equals("")){//只有一个空缺
						st = DateUtils
								.diffDatemin(DateUtils.parseDates(mplist.get(i)	.getNowdate(),"yyyy-MM-dd HH:mm:ss"), 
								DateUtils.parseDates(t,"yyyy-MM-dd HH:mm:ss"));
						System.out.println(st);
						t="";
						st=0;
					}else if(!t.equals("")&&st!=0){//2个或以上的空缺
						st=st+DateUtils
								.diffDate(DateUtils.parseDate(mplist.get(i)	.getNowdate()), 
								DateUtils.parseDate(t));
						System.out.println(st);
						t="";
						st=0;
					}
				}
				//循环内
				
			}*/
			String maphfjson = JSONArray.fromObject(mplist).toString();
			return maphfjson;
		} else {
			return "";
		}
	}
	
	//加载回放坐标点非0
		@RequestMapping(params = "method=gethfinfonozero")
		public @ResponseBody
		String gethfinfonozero(int page,String carno, String times,String dbname,HttpServletRequest request,HttpSession session) {
			//SimpleDateFormat dateFormat=new SimpleDateFormat("YYYY-MM-dd HH:mm");
			String starttime = "";
			String endtime = "";
			String oldcarno=carno;
			
			if (times != null && !times.equals("")&&carno!=null&&!"".equals(carno)&&carno.length()>=7) {
				carno=carno.substring(carno.length()-6,carno.length());
				String[] str = times.split("至");
				starttime = str[0].trim();
				endtime = str[1].trim();
				
				
				List<Maps> mplist = new ArrayList<Maps>();
				Map<String,String> tablename=BaiduWeather.dateFen(starttime,endtime);
				
				long looo=new Date().getTime();
				System.out.println("回放数据开始加载");
				String [] db=new String[2];
				int n=0;
				for(String table:tablename.keySet()){
					long lo=new Date().getTime();
					System.out.println("开始查");
					db[n++]=table;
					System.out.println("完事了"+(new Date().getTime()-lo));
				}
				if("".equals(db[1])||db[1]==null){
					db[1]=db[0];
				}
				mplist=mapService.gethfmessnozero(db[0],oldcarno,starttime,endtime,db[1],(page*1000)+"");
				System.out.println("回放数据加载完了"+(new Date().getTime()-looo)+"\t"+mplist.size());
				double licheng=0;
				/*if(mplist.size()>1){
					if(mplist.get(0).getNowspace()!=null&&mplist.get(mplist.size()-1).getNowspace()!=null){
						BigDecimal decimal2=new BigDecimal(mplist.get(0).getNowspace());
						BigDecimal decimal1=new BigDecimal(mplist.get(mplist.size()-1).getNowspace());
						licheng=decimal1.subtract(decimal2).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
					}
				}else if(mplist.size()==1){
					licheng=0;
				}*/
				//BaiDuMap.licheng(mplist);
				/*Maps maps=mapService.getqtmessgage(oldcarno,dbname);
				if(maps!=null){
					for (Maps map : mplist) {
						map.setDepartmentname(maps.getDepartmentname());
						map.setTels(maps.getTels());
						//map.setNowspace(nowspace);
					}
				}*/
				String maphfjson = JSONArray.fromObject(mplist).toString();
				return maphfjson+"^!@"+licheng;
			} else {
				return "";
			}
		}
	
	@RequestMapping(params = "method=gethfinfopage")
	public @ResponseBody
	Map gethfinfopage(String carno, String times,String rows, String page) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		String starttime = "";
		String endtime = "";
		if (times != null && !times.equals("")) {
			String[] str = times.split("至");
			starttime = str[0].trim();
			endtime = str[1].trim();
			List<Maps> mplist = mapService.gethfmesspage(carno, starttime, endtime,(page1 - 1) * rows1, rows1);// 获取坐标点集合
			int count = mapService.loadhfpage(carno, starttime, endtime);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", mplist);
			return map;
		} else {
			return null;
		}
	}
	@RequestMapping(params="method=gethfpage")
	public @ResponseBody String gethfpage(String carno, String times,String beidouid,String dbname,HttpServletRequest request,HttpSession session){
		String starttime = "";
		String endtime = "";
		
		if (times != null && !times.equals("")&&carno!=null&&!"".equals(carno)&&carno.length()>=7) {
			String[] str = times.split("至");
			starttime = str[0].trim();
			endtime = str[1].trim();
			
			int num=0;
			long lo=new Date().getTime();
			Map<String,String> tablename=BaiduWeather.dateFen(starttime,endtime);
			System.out.println("回放数据开始加载");
			for(String table:tablename.keySet()){
				num+=mapService.gethfpage(table,carno,starttime,endtime);
			}
			System.out.println("完事了"+(new Date().getTime()-lo));
			return num+"";
		} else {
			return "";
		}
	}
	@RequestMapping(params = "method=getShipOrder")
	public @ResponseBody
	Map getShipOrderInfo(String rows, String page, String name,
			String phone_number, String type, String start_date, String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String goods_name,HttpSession session) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		User user=(User)session.getAttribute(SessionInfo.SessionName);
		List<ShippingOrder> list = mapService.getShipOrderInfo((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date,pid,phone, order_state, pay_type, send_address,goods_name,user.getCostomersid());
		int count = mapService.getShipOrder(name, phone_number, type, start_date,
				end_date,pid, phone, order_state, pay_type, send_address,goods_name,user.getCostomersid());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
}
