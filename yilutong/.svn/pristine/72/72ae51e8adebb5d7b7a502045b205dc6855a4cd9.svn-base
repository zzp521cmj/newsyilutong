package com.jy.action;

/***
 * @author  黄清华
 * @param  标准路线的实体类（LinStandard）
 * @since 1.6
 * @version 1.0
 * @throws null
 * @createtime 2015-5-20
 */
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.LinStandard;
import com.jy.model.Linstandard_truck;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;
import com.jy.model.Warehouse;
import com.jy.service.LinStandardService;

@Controller
@RequestMapping(value = "/maplin.do")
public class LinStandardController {
	@Resource
	private LinStandardService linStandardService;

	//获取协议下的所有订单信息的坐标
	@RequestMapping(params="method=createLin")
	public String createLin(String aid,HttpServletRequest request){
		try {
			aid=new String(aid.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		request.setAttribute("aid", aid);
		return "map/mapcjbx";
	}
		@RequestMapping(params = "method=getorderbyaid")
		public @ResponseBody
		String getorderbyaid(String aid) {
			List<ShippingOrder> list = linStandardService.getorderbyaid(aid);
			return JSONArray.fromObject(list).toString();
		}
	
	// 获取班线的points
	@RequestMapping(params = "method=getlin")
	public @ResponseBody
	String getlinlist(String name) {
		List<PostClassline> list = linStandardService.getlinlist(name);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (PostClassline p : list) {
			jb = new JSONObject();
			jb.put("id", p.getClasslineId());
			jb.put("name", p.getClasslineName());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	@RequestMapping(params = "method=getLinName")
	public @ResponseBody
	String getLinName(String linname) {
		List<LinStandard> list = linStandardService.getLinName(linname);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (LinStandard l : list) {
			jb = new JSONObject();
			jb.put("id", l.getLinid());
			jb.put("name", l.getLinname());
			jsons.add(jb);
		}
		return jsons.toString();

	}

	// 获取班线的points通过ID
	@RequestMapping(params = "method=getlinbyid")
	public @ResponseBody
	String getlinbyid(String lxid) {
		List<PostClassLineInfo> list = linStandardService.getlinbyid(lxid);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (PostClassLineInfo p : list) {
			jb = new JSONObject();
			jb.put("id", p.getClasslineId());
			jb.put("fl", p.getSiteflag());
			List<Remark> rlist = linStandardService.getRemark(p.getRemarkId());
			for (Remark remark : rlist) {
				if (remark.getRemark_state() != null
						&& remark.getRemark_state().equals("polygon")) {
					jb.put("allpt", remark.getRemark_point());
				} else {
					String cd = remark.getRemarkRange().getRemark_range_name() == null ? ""
							: remark.getRemarkRange().getRemark_range_name();
					cd = cd.substring(0, cd.length() - 1);
					jb.put("ran", cd);
				}
			}

			if (p.getLnglat().indexOf("|") > 0) {
				String s = p.getLnglat().toString()
						.substring(0, p.getLnglat().indexOf("|"));
				jb.put("pt", s);
			} else {
				jb.put("pt", p.getLnglat());
			}
			jsons.add(jb);
		}
		return jsons.toString();
	}

	@RequestMapping(params="method=getlinnameandno")
	public @ResponseBody String getlinnameandno(String lxid){
		try {
			List<PostClassline> pcllist = linStandardService.getlinnameandno(lxid);;
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (PostClassline p : pcllist) {
				jb = new JSONObject();
				jb.put("name", p.getClasslineName());
				jb.put("no", p.getClasslineCode());
			}
			jsons.add(jb);
			return jsons.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		
	}
	// 保存 标准线路的points
	@RequestMapping(params = "method=savexlpts")
	public String savexlpts(LinStandard lst, HttpServletRequest request) {
		if (lst.getLinid() != "" || lst.getLinid() != null) {// 为修改时删除原有的
			String[] linid = { lst.getLinid() };
			delTruck(linid);
		}
		if (linStandardService.savelinstandard(lst)) {
			return "map/mapbxgl";
		} else {
			request.setAttribute("message", "err");
			return "map/mapbxgl";
		}
	}

	// 保存 标准线路的points
	@RequestMapping(params = "method=savexlptsgo")
	public String savexlptsgo(LinStandard lst, HttpServletRequest request,String text) {
		try {
			text=new String(text.getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println(text+"linid~~~~~~~~");
		if (lst.getLinid() != "" || lst.getLinid() != null) {// 为修改时删除原有的
			deleteallcar(lst.getLinid());
			String[] linid = { lst.getLinid() };
			delTruck(linid);
		}
		System.out.println(lst.getLinid());
		if (linStandardService.savelinstandard(lst)) {
		} else {
			request.setAttribute("message", "err");
		}
		if(text.equals("保存并新建")){
			return "map/mapbxgl";
		}else{
			return "map/LinInfo";
		}
	}

	// 保存 标准线路的points
	@RequestMapping(params = "method=savexlpts1")
	public String savexlpts1(String pts, HttpServletRequest request) {
		List carlist1 = new ArrayList();
		request.setAttribute("carlist", carlist1);
		return "map/mapbxgl";
	}

	// 保存 标准线路的points
	@RequestMapping(params = "method=golin")
	public String golin() {
		return "map/LinInfo";
	}

	// 检查线路名称是否存在checkname
	@RequestMapping(params = "method=checkname")
	public @ResponseBody
	String checkname(String linname) {
		int num = linStandardService.checkname(linname);
		if (num > 0) {
			return "err";
		} else {
			return "ok";
		}
	}

	@RequestMapping(params = "method=getLin")
	public @ResponseBody
	Map getLin(String rows, String page, String linname) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<LinStandard> list = linStandardService.getLinInfo((page1 - 1)
				* rows1, rows1, linname);
		int count = linStandardService.getLin(linname);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 获取路线的points通过ID
	@RequestMapping(params = "method=getLinbyid")
	public String getLinbyid(String linid, HttpServletRequest request) {
		List<LinStandard> list = linStandardService.getLinbyid(linid);
		request.setAttribute("linlist", list);
		return "map/mapbxgl";
	}
	// 获取路线的points通过ID执行车辆的绑定
		@RequestMapping(params = "method=getLinbyidforbd")
		public String getLinbyidforbd(String linids, HttpServletRequest request) {
			/*List<Linstandard_truck>ltlist=linStandardService.getlincar(linids);//绑定前查询是否有已经绑定的数据
			if(ltlist.size()>0){
				request.setAttribute("lt", ltlist);
			}*/
			List<LinStandard> list = linStandardService.getLinbyid(linids);
			request.setAttribute("linlist", list);
			return "map/llinbdcar";
		}
		// 绑定前查询是否有已经绑定的数据
		@RequestMapping(params = "method=getbdcar")
		public @ResponseBody String getbdcar(String linid) {
			List<Linstandard_truck>ltlist=null;
			try {
				ltlist=linStandardService.getlincar(linid);//
			} catch (Exception e) {
				System.out.println("没有linids");
			}
			String cars = JSONArray.fromObject(ltlist).toString();
			System.out.println(cars);
			return cars;
		}

	// 批量删除
	@RequestMapping(params = "method=deletebyid")
	public @ResponseBody
	Json delTruck(String[] del) {
		Json json = new Json();
		int s = linStandardService.getLincount(del);//这里改为判断是否和车辆绑定
		if (s == 0) {
			int truck = linStandardService.deleteLinById(del);
			if (truck > 0) {
				json.setFlag(true);
				return json;
			} else {
				json.setFlag(false);
				return json;
			}
		} else {
			json.setAns("hava");
			return json;
		}
	}
	
	// 绑定车辆
		@RequestMapping(params = "method=bdcar")
		public @ResponseBody Json bdcar(String[] cs,String[]cns,String linid) {
			int truck = linStandardService.deletecarbyno(linid);
			List<Linstandard_truck>ltlist=new ArrayList<Linstandard_truck>();
			Linstandard_truck lt=null;
			for (int i = 0; i < cs.length; i++) {
				lt=new Linstandard_truck();
				lt.setJltid(UUIDUtils.getUUID());
				lt.setLid(linid);
				lt.setTid(cs[i]);
				lt.setTname(cns[i]);
				ltlist.add(lt);
			}
			int count=linStandardService.bdcar(ltlist);
			System.out.println(0);
			Json json = new Json();
			if(count>0){
				json.setFlag(true);
			}else{
				json.setFlag(false);
			}
			return json;
		}
		
			// 删除线路上的所有绑定车辆
				@RequestMapping(params = "method=deleteallcar")
				public @ResponseBody Json deleteallcar(String linid) {
					System.out.println("come");
					System.out.println(linid);
					int truck = linStandardService.deletecarbyno(linid);
					Json json = new Json();
					if(truck>0){
						json.setFlag(true);
					}else{
						json.setFlag(false);
					}
					return json;
				}
		
				
				@RequestMapping(params="method=loadmarkforzd")
				public @ResponseBody
				String loadmarkforzd() {
					List<Warehouse> allrmklist = null;
					if (linStandardService.getallremark() != null) {
						allrmklist = linStandardService.getallremark();
						JSONObject jb = null;
						JSONArray jsons = new JSONArray();
						for (Warehouse r : allrmklist) {
							jb = new JSONObject();
							jb.put("names", r.getWarehouse_name());
							jb.put("points", r.getWarehouse_point());
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
*/
}
