package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.TransferBox;
import com.jy.service.TransferBoxService;
import com.jy.service.UserInfoService;
@Controller
@RequestMapping(value = "/TransferBox.do")
public class TransferBoxController {
	@Resource
	private UserInfoService uis;
	@Resource
	private TransferBoxService transferBoxService;
	/**
	 * 去中转箱信息页面
	 */
	@RequestMapping(params = "method=getTransferBox")
	public String TransferBox(String menu_id,HttpSession session) {
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
		return "TransferBox/TransferBox";
	}
	//,String zhuang, String xie, String models,String truckTypeId,String publisher,String determine
	//分页显示所有中转箱
	@RequestMapping(params = "method=getTransferBoxInfo")
	public @ResponseBody
	Map<String, Object> getManuals(String page, String rows,String transferBox_name,String transferBox_outervolume) {
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
		List<TransferBox> list = 
				transferBoxService.getTransferBox((page2 - 1) * rows1, rows1,transferBox_name,transferBox_outervolume);
		
		int total = transferBoxService.getTransferBoxCount(transferBox_name,transferBox_outervolume);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
	//获取信息
	@RequestMapping(params = "method=getTransfer")
	public @ResponseBody
	TransferBox getTransferBox(String transferBox_id){
		System.out.println(transferBox_id);
		return transferBoxService.getTransferInfo(transferBox_id);
	}
	
	//去新增页面
	@RequestMapping(params = "method=getAddBox")
	public String getAddBox(String transferBox_id){
		return "TransferBox/addTransferBox";
	}
	//新增
	@RequestMapping(params = "method=addBox")
	public @ResponseBody
	Json addBox(TransferBox box){
		box.setTransferBox_id(UUIDUtils.getUUID());
		int add=transferBoxService.addBox(box);
		System.out.println(add+"****");
		Json json=new Json();
		if (add > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	
	//去修改页面
	@RequestMapping(params = "method=geteditBox")
	public String getEditBox(String transferBox_id,HttpServletRequest req){
		req.setAttribute("flg", transferBox_id);
		return "TransferBox/editTransferBox";
	}
	//修改
	@RequestMapping(params = "method=editBox")
	public @ResponseBody 
	Json editBox(TransferBox box){
		Json json=new Json();
		int add=transferBoxService.editTransfer(box);
		if(add>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	//检查
	@RequestMapping(params = "method=checkBoxName")
	public Json checkBoxName(String name){
		Json json = new Json();
		//int truck = tc.checkTemCarName(name);
		/*int truck2 = tc.checkTraCarName(name);
		if(truck2>0){
			json.setFlag(true);
			return json;
		}*/
		json.setFlag(true);
		return json;
	}
	
	//删除
	@RequestMapping(params = "method=deltetBoxs")
	public @ResponseBody
	Json deleteBoxs(String[] del){
		Json json = new Json();
		int add=transferBoxService.deleteBoxs(del);
		if(add>0){
			json.setFlag(true);
			return json;
		}
		json.setFlag(true);
		return json;
	}
	
	
}
