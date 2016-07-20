package com.jy.action;

/**
 * 
 * @author hqh
 * @createtime 2015-6-8
 * @注释：任务计划导入
 */
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import com.jy.common.SessionInfo;
import com.jy.common.ExportUtils;
import com.jy.common.OperationExcelForPOI;
import com.jy.dao.Json;
import com.jy.model.LinStandard;
import com.jy.model.Taskonlineimport;
import com.jy.service.TaskonlineimportService;
import com.jy.service.UserInfoService;
@Controller
@RequestMapping(value = "/linplan.do")
public class TaskonlineimportController {
	@Resource
	private TaskonlineimportService taskonlineimportService;
	@Resource
	private UserInfoService uis;
	// 进入页面
	@RequestMapping(params = "method=gotoimp")
	public String gotoimp(String menu_id,HttpSession session) {
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
		return "classplan/taskonlineimport";
	}

	// 打开导入页面
	@RequestMapping(params = "method=imp")
	public String goimp() {
		return "classplan/maplinimp";
	}

	// 做导入前的上传处理
	@RequestMapping(params = "method=startimplinplan")
	public String startimplinplan(HttpServletRequest request,
			@RequestParam(value = "files") MultipartFile files)
			throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext()
				.getRealPath("WebRoot/TemporaryFile/");// 文件路径
		//System.out.println(path);
		File filez = new File(path);
		if (!filez.exists()) {
			filez.mkdirs();
		}
		MultipartFile myfile = files;
		String filename = myfile.getOriginalFilename();
		String prefix = filename.substring(filename.lastIndexOf("."));
		File newfile = filez.createTempFile("linplan", prefix, filez);
		//System.out.println(newfile);
		String filesname = newfile.toString();
		filesname = filesname.substring(filesname.lastIndexOf("\\") + 1,
				filesname.length());
		request.setAttribute("filesname", filesname);
		myfile.transferTo(newfile);
		return "classplan/maplinimp";
	}

	// 上传开始保存到数据库
	@RequestMapping(params = "method=implinplan")
	public @ResponseBody String implinplan(HttpServletRequest request, String filename) {
		String filepath = request.getSession().getServletContext()
				.getRealPath("WebRoot/TemporaryFile/" + filename);
		OperationExcelForPOI oef = new OperationExcelForPOI();
		String flag="";
		try {
			flag = oef.impExcel(filepath);
			deleteFile(filepath);// 执行上传文件删除操作
			return flag;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(flag+"===========================================");
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

	// 页面加载获取所有数据
	@RequestMapping(params = "method=getallLin")
	public @ResponseBody
	Map getallLin(String rows, String page, String linname,String st,String ed) {
		System.out.println(st+"========================");
		System.out.println(ed+"============================");
		String stime="";
		String edtime="";
		if(st!=null&&st!=""){
			stime=st;
		}
		if(ed!=null&&ed!=""){
			edtime=ed;
		}
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<Taskonlineimport> list = taskonlineimportService.getallLin(
				(page1 - 1) * rows1, rows1, linname,stime,edtime);
		int count = taskonlineimportService.getallLinCount(linname,stime,edtime);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 跳转至修改页面 附带参数ID
	@RequestMapping(params = "method=getlinplanbyid")
	public String getlinplanbyid(HttpServletRequest request, String linnumber) {
		request.setAttribute("linnumber", linnumber);
		return "classplan/edittaskonline";
	}

	// 查询单条数据通过 上一个方法附带的ID
	@RequestMapping(params = "method=getlinplanplanbyid")
	public @ResponseBody
	Taskonlineimport getlinplanplanbyid(String linnumber) {
		Taskonlineimport tl = null;
		tl = taskonlineimportService.getlinplanplanbyid(linnumber);
		return tl;
	}

	// 开始执行修改操作
	@RequestMapping(params = "method=updatelinplan")
	public @ResponseBody
	Json updatelinplan(Taskonlineimport tl) {
		Json json = new Json();
		int i = taskonlineimportService.updatelinplan(tl);
		if (i == 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}

	// select2的查询所有名称的方法
	@RequestMapping(params = "method=getLinName")
	public @ResponseBody
	String getLinName(String linname) {
		List<Taskonlineimport> list = taskonlineimportService
				.getLinName(linname);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Taskonlineimport t : list) {
			jb = new JSONObject();
			jb.put("id", t.getLinno());
			jb.put("name", t.getLinname());
			jsons.add(jb);
		}
		return jsons.toString();
	}

	// 删除方法
	@RequestMapping(params = "method=deletebyid")
	public @ResponseBody
	Json deletebyid(String[] del) {
		int i = taskonlineimportService.deletebyid(del);
		Json json = new Json();
		if (i == 0) {
			json.setFlag(true);
		} else {
			json.setFlag(false);
		}
		return json;
	}

	@RequestMapping(params = "method=downloadfile")
	public String downloadfile(HttpServletResponse response,
			HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;

			String file_url = request
					.getSession()
					.getServletContext()
					.getRealPath(
							"WEB-INF\\views\\classplan\\planfile\\任务计划表格设计.xls");
			File file = new File(file_url);
			if (file.exists()) {
				System.out.println(file_url);
				long fileLength = new File(file_url).length();
				// 设置下载头
				response.setContentType("application/octet-stream");
				String storeName =".任务计划表格设计.xls";
				storeName = new String(storeName.getBytes("UTF-8"), "ISO8859-1");  
				response.setHeader("Content-disposition",
						"attachment; filename="+storeName);
				// 设置输出长度
				response.setHeader("Content-Length", String.valueOf(fileLength));
				// 获取输入流
				bis = new BufferedInputStream(new FileInputStream(file_url));
				// 输出流
				bos = new BufferedOutputStream(response.getOutputStream());
				byte[] buff = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
					bos.write(buff, 0, bytesRead);
				}
				// 关闭流
				bis.close();
				bos.flush();
				bos.close();
			} else {
				request.setAttribute("downloaderror", "1");
				return "classplan/taskonlineimport";
			}

		} catch (Exception e) {
			e.getMessage();
			e.printStackTrace();
		}
		return null;
	}
	
	
	 /**
     * 导出
     * @param datas
     * @param headtitle
     * @param fieldName
     * @param response
     * @return
     */
	
    @RequestMapping(params = "method=getallLinss")
    public @ResponseBody
    String outputPostLine(String datas, String[] headtitle,String[] fieldName,HttpServletResponse response,
          String name) {
       String filename = "发车计划导出";
//根据传过来的条件查询所有数据（使用原来的分页查询类似，修改一下即可）
       List<Taskonlineimport> list = taskonlineimportService.getallLinss(name);
       try {
          // 声明一个工作薄
          HSSFWorkbook workbook = new HSSFWorkbook();
          // 生成一个表格
          response.setContentType("application/vnd.ms-excel;");
          response.setHeader("Content-Disposition","attachment;filename=\""
                 +new String(filename.getBytes("gbk"), "iso-8859-1")
                 +".xls\"");
          OutputStream ouputStream = response.getOutputStream();
       //调用工具类创建表头
          ExportUtils.outputHeaders(headtitle,workbook,"发车计划列表");
       //调用工具类生成内容
          ExportUtils.outputColums(fieldName, list,workbook,1,"发车计划列表");
          workbook.write(ouputStream);
          ouputStream.flush();
          ouputStream.close();

       }catch (Exception e) {
          e.printStackTrace();
       }
       return null;
    }
}
