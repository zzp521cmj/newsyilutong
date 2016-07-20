package com.jy.action;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.reflect.TypeToken;
import com.jy.common.ExportUtils;
import com.jy.common.GSONUtils;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.excel.bean.PostLineExcel;
import com.jy.model.ClassLineToLinstandard;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.service.PostLineService;
import com.jy.service.UserInfoService;
/**
 * 班线管理
 * @author zzp
 *
 */
@Controller
@RequestMapping(value = "/postline.do")
public class PostLineController {


	@Resource
	private PostLineService postLineService;
	@Resource
	private UserInfoService uis;
	/**
	 * 班线管理页面跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=getpostlineinfo")
	public String getPostLineInfo(String menu_id,HttpSession session) {
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
		return "postline/postLineInfo";
	}

	/**
	 * 班线管理新增页面跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=addPostLine")
	public String addPostLine() {
		return "postline/addPostLine";
	}
	
	/**
	 * 班线管理修改页面跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=editPostLine")
	public String editPostLine(String pid,HttpServletRequest request) {
		request.setAttribute("pid", pid);
		return "postline/editPostLine";
	}
	
	/**
	 * 班线管理详细信息跳转
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=lookPostLineInfo")
	public String lookPostLineInfo(String pid,HttpServletRequest request) {
		request.setAttribute("pid", pid);
		/*PostClassline postClassline=postLineService.getSelectPostLine(pid);
		List<PostClassLineInfo> postClassLineInfo=postLineService.getPostClassLineInfo(pid);
		
		List<LinStandard> cltllist=postLineService.getlinesinfo(pid);
		request.setAttribute("postClassline",postClassline);
		request.setAttribute("postClassLineInfo", postClassLineInfo);
		request.setAttribute("cltllist", cltllist);*/
		PostClassline postClassline = postLineService.lookPostLineInfo(pid);
		request.setAttribute("postClassline", postClassline);
		return "postline/lookPostLineInfo";
	}
	/**
	 * 获取班线管理页面信息
	 * @param page
	 * @param rows
	 * @param zhuang
	 * @param xie
	 * @param models
	 * @param truckTypeId
	 * @param publisher
	 * @return
	 */
	@RequestMapping(params = "method=getPostLine")
	public @ResponseBody String getPostLine(String page, String rows,
			String classlineName,String organization,String chufadian,String zhongdian) {
		// 当前第几页
		Integer page2 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page != null && !"".equals(page)) {
			page2 = Integer.parseInt(page);
		}
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		List<PostClassline> list = postLineService.getPostLine((page2 - 1) * rows1, rows1,classlineName,organization,chufadian,zhongdian);

		int total = postLineService.getCount(classlineName,organization,chufadian,zhongdian);
		// json返回串
		JSONObject json=new JSONObject();
		json.put("total", total);
		json.put("rows",list);
		return json.toString();
	}
		
		/**
		 * 新增班线信息
		 * @param pcl
		 * @param startsite
		 * @param endsite
		 * @param passsite
		 * @return
		 */
		@RequestMapping(params = "method=addPostLineInfo")
		public @ResponseBody Json addPostLineInfo(PostClassline pcl,String repetition_periods,String startsite,String endsite,String passsite,String lines) {
			pcl.setRepetition_period(repetition_periods);
			String plsId=postLineService.addPostLine(pcl);
			boolean flag=false;
			boolean flagline=false;
			if(plsId!=null){
				List<PostClassLineInfo> list=creaverpostinfo(startsite,endsite,passsite,plsId);
				List<ClassLineToLinstandard> ctl=creaverctl(lines,plsId); 
				flag=postLineService.addPostLineInfo(list);
				flagline=postLineService.addCtl(ctl);
			}
			Json json = new Json();
			if(flag)
				json.setFlag(true);
			else
				json.setFlag(false);
			return json;

		}
		
		

		/**
		 * 修改班线信息
		 * @param pcl
		 * @param startsite
		 * @param endsite
		 * @param passsite
		 * @return
		 */
		@RequestMapping(params = "method=editPostLineInfo")
		public @ResponseBody Json editPostLineInfo(PostClassline pcl,String repetition_periods,String startsite,String endsite,String passsite,String lines) {
			boolean b = isNumeric0(pcl.getOrganizationId());
			if(!b){
				pcl.setOrganizationId(uis.namegetDepartment(pcl.getOrganizationId()));
			}
			pcl.setRepetition_period(repetition_periods);
			int delflag=postLineService.deletePostLine(pcl.getClasslineId());
			String plsId=postLineService.addPostLine(pcl);
			boolean flag=false;
			boolean flagline=false;
			if(plsId!=null){
				List<PostClassLineInfo> list=creaverpostinfo(startsite,endsite,passsite,plsId);
				List<ClassLineToLinstandard> ctl=creaverctl(lines,plsId);
				flag=postLineService.addPostLineInfo(list);
				flagline=postLineService.addCtl(ctl);
			}
			Json json = new Json();
			if(flag)
				json.setFlag(true);
			else
				json.setFlag(false);
			return json;

		}
		
		/**
		 * 获取要修改的信息
		 * @param pid
		 * @return
		 */
		@RequestMapping(params = "method=getSelectPostLine")
		public @ResponseBody String getSelectPostLine(String pid) {
			PostClassline postClassline=postLineService.getSelectPostLine(pid);
			List<PostClassLineInfo> postClassLineInfo=postLineService.getPostClassLineInfo(pid);
			List<LinStandard> cltllist=postLineService.getlinesinfo(pid);
			JSONObject json=new JSONObject();
			json.put("postClassline", postClassline);
			json.put("postClassLineInfo", postClassLineInfo);
			json.put("linesinfo", cltllist);
			return json.toString();
		}
		/**
		 * 获取指定标注 
		 */
		@RequestMapping(params="method=getRemark")
		public @ResponseBody String getRemark(String remarkName){
			List<Remark> remark=postLineService.getRemark(remarkName);
			JSONObject json=null;
			JSONArray jsonarray=new JSONArray();
			for (Remark remark2 : remark) {
				json=new JSONObject();
				json.put("id", remark2.getRemark_id());
				json.put("name", remark2.getRemark_name());
				json.put("code", remark2.getRemark_code());
				json.put("lnglat",remark2.getRemark_point());
				jsonarray.add(json);
			}
			return jsonarray.toString();
		}
		/**
		 * 获取指定线路
		 */
		@RequestMapping(params="method=getlinInfo")
		public @ResponseBody String getlinInfo(String linName){
			List<LinStandard> linStandard=postLineService.getlinInfo(linName);
			JSONObject json=null;
			JSONArray jsonarray=new JSONArray();
			
			for (LinStandard remark2 : linStandard) {
				json=new JSONObject();
				json.put("id", remark2.getLinid());
				json.put("name", remark2.getLinname());
				json.put("lincd", remark2.getLincd());
				jsonarray.add(json);
			}
			return jsonarray.toString();
		}
		
		@RequestMapping(params = "method=deletePostLine")
		public @ResponseBody Json deletePlan(String[] del) {
			Json json = new Json();
			int delete = postLineService.deletePostLine(del);
			if (delete > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}

	// 更新编辑竞价
	/*@RequestMapping(params = "method=updateDemand_releaseInfo")
	public  @ResponseBody
	Json updateDemand_release(Demand_release demand_release) {
		Json json = new Json();
		int i = demand_releaseService.updateDemand_release(demand_release);
		System.out.println(demand_release.getDemandReleaseId());
		System.out.println(i);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}*/


	// 批量删除
/*	@RequestMapping(params = "method=delDemand_release")
	public @ResponseBody
	Json deletePlan(String[] del) {
		Json json = new Json();
		int delete = demand_releaseService.deleteDemand_release(del);
		if (delete > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}*/
	
		
		/**
		 * 把得到的json转成对应的list
		 * @param startsite
		 * @param endsite
		 * @param passsite
		 * @return List<PostClassLineInfo>
		 */
		@SuppressWarnings("unused")
		private List<PostClassLineInfo> creaverpostinfo(String startsite,String endsite, String passsite,String classlineId) {
			// TODO Auto-generated method stub
			List<PostClassLineInfo> list=new ArrayList<PostClassLineInfo>();
			//获取首节点信息start
			JSONObject json =JSONObject.fromObject(startsite);
			String remark_id=json.getString("site_id");
			String site_name=json.getString("site_name");
			String lnglat=json.getString("lnglat");
			PostClassLineInfo pli=new PostClassLineInfo();
			pli.setSite_id(UUIDUtils.getUUID());
			pli.setSite_name(site_name);
			pli.setLnglat(lnglat);
			pli.setRemarkId(remark_id);
			pli.setSiteflag(1);
			pli.setClasslineId(classlineId);
			list.add(pli);
			//end
			//start获取途经点
			//途经点start
			if(passsite!=null){
				JSONObject passjson =JSONObject.fromObject(passsite);
				for(int i=0;i<passjson.size();i++){
					if(!("").equals(passjson.get(i+""))){
					JSONObject psjs=passjson.getJSONObject(i+"");
					if(psjs!=null){
							if(psjs.getString("site_id")!=null&&!"".equals(psjs.getString("site_id"))){
								PostClassLineInfo passinfo=new PostClassLineInfo();
								passinfo.setSite_id(UUIDUtils.getUUID());
								passinfo.setSite_mlg(psjs.getString("site_mlg"));
								passinfo.setSite_name(psjs.getString("site_name"));
								passinfo.setSite_run(psjs.getString("site_run"));
								passinfo.setSite_stop(psjs.getString("site_stop"));
								passinfo.setLnglat(psjs.getString("lnglat"));
								passinfo.setSiteflag(2);
								passinfo.setSite_code(psjs.getString("site_code"));
								passinfo.setSite_order(psjs.getString("site_order"));
								passinfo.setClasslineId(classlineId);
								passinfo.setRemarkId(psjs.getString("site_id"));
								list.add(passinfo);
							}
						}
					}
				}
			}
			//end
			//获取首节点信息start
			JSONObject endjson =JSONObject.fromObject(endsite);
			PostClassLineInfo endpli=new PostClassLineInfo();
			endpli.setSite_id(UUIDUtils.getUUID());
			endpli.setSite_name(endjson.getString("site_name"));
			endpli.setSite_run(endjson.getString("site_run"));
			endpli.setSite_mlg(endjson.getString("site_mlg"));
			endpli.setLnglat(endjson.getString("lnglat"));
			endpli.setClasslineId(classlineId);
			endpli.setRemarkId(endjson.getString("site_id"));
			endpli.setSiteflag(0);
			list.add(endpli);
			//end
			return list;
		}
		/**
		 * 解析绑定线路json
		 * @param lines
		 * @param classlineId
		 * @return
		 */
		private List<ClassLineToLinstandard> creaverctl(String lines,String classlineId) {
			// TODO Auto-generated method stub
			List<ClassLineToLinstandard> list=new ArrayList<ClassLineToLinstandard>();
			if(lines!=null){
				JSONObject linesinfo =JSONObject.fromObject(lines);
				for(int i=0;i<linesinfo.size();i++){
					
					if(!("").equals(linesinfo.get(i+""))){
					JSONObject psjs=linesinfo.getJSONObject(i+"");
						if(psjs!=null){
							if(psjs.getString("line_id")!=null&&!"".equals(psjs.getString("line_id"))){
								ClassLineToLinstandard passinfo=new ClassLineToLinstandard();
								passinfo.setClasslineId(classlineId);
								passinfo.setClassline_linstandard_id(UUIDUtils.getUUID());
								passinfo.setIsdefalut(psjs.getInt("line_default"));
								passinfo.setLinid(psjs.getString("line_id"));
								list.add(passinfo);
							}
						}
					}
				}
			}
			return list;
		}
		
		/**
		 * 导出
		 * @param datas
		 * @param headtitle
		 * @param fieldName
		 * @param response
		 * @return
		 */
		@RequestMapping(params = "method=outputPostLine")
		public @ResponseBody
		String outputPostLine(String datas, String[] headtitle,String[] fieldName,HttpServletResponse response,
				String classlineName,String organization,String chufadian,String zhongdian) {
			String filename = "班线导出";
			List<PostLineExcel> list=postLineService.searchAll(classlineName,organization,chufadian,zhongdian);
			try {
				// 声明一个工作薄
				HSSFWorkbook workbook = new HSSFWorkbook();
				// 生成一个表格
				response.setContentType("application/vnd.ms-excel;");
				response.setHeader("Content-Disposition", "attachment;filename=\""
						+ new String(filename.getBytes("gbk"), "iso-8859-1")
						+ ".xls\"");
				OutputStream ouputStream = response.getOutputStream();
				ExportUtils.outputHeaders(headtitle,workbook,"班线列表");
				ExportUtils.outputColums(fieldName, list,workbook,1,"班线列表");
				workbook.write(ouputStream);
				ouputStream.flush();
				ouputStream.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		private static boolean isNumeric0(String str){
			  for(int i=str.length();--i>=0;){
			   int chr=str.charAt(i);
			   if(chr<48 || chr>57)
			    return false;
			  }
			  return true;
			 }

}
