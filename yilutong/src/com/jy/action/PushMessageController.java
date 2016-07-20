package com.jy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.dao.Json;
import com.jy.model.PushMessage;
import com.jy.model.User;
import com.jy.service.PushMessageService;
import com.jy.service.UserInfoService;
import com.jy.thread.MsgThread;
import com.jy.thread.PushMsgThread;

@Controller
@RequestMapping(value="/pushMessage.do")

public class PushMessageController {
	@Resource
	private PushMessageService pushMessageService;
	@Resource
	private UserInfoService uis;

	/**
	 * 消息推送管理页面
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=messageInfo")
	public String messageInfo(String menu_id,HttpSession session) {
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
		return "pushmessage/messageInfo";
	}
	/**
	 * 消息推送查询datagrid页面
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=getPushMessage")
	public @ResponseBody String getPushMessage(String page, String rows,String message_title,String message_createuser,String start_date,String end_date) {
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
		List<PushMessage> list = pushMessageService.getPushMessage((page2 - 1) * rows1, rows1,message_title,message_createuser,start_date,end_date);

		int total = pushMessageService.getCount(message_title,message_createuser,start_date,end_date);
		// json返回串
		JSONObject json=new JSONObject();
		json.put("total", total);
		json.put("rows",list);
		return json.toString();
	}
	/**
	 * 消息推送添加页面
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=addMessagePage")
	public String addMessagePage() {
		return "pushmessage/Addmessage";
	}
	/**
	 * 推送消息推送添加页面
	 * @return String
	 * @param
	 */
	@RequestMapping(params = "method=pushMessage")
	public @ResponseBody Json pushMessage(PushMessage pushmessage,HttpSession session) {
		String channelid=pushmessage.getChannelId();
		String channelIdNo[]=null;
		if(!"".equals(channelid)){
			channelIdNo=channelid.split(",");
		}
		Json json=new Json();
		try{
			//如果选择的是全部
			if("".equals(pushmessage.getMessage_touser())){
				new Thread(new PushMsgThread(pushmessage.getMessage_title(), pushmessage.getMessage_content(),channelIdNo,"0")).start();
			}else{
				new Thread(new PushMsgThread(pushmessage.getMessage_title(), pushmessage.getMessage_content(),channelIdNo,"1")).start();
			}
			User user=(User)session.getAttribute(SessionInfo.SessionName);
			pushmessage.setMessage_createuser(user.getId());
			int i=pushMessageService.saveMessage(pushmessage);
			if(i>0)
				json.setFlag(true);
			else
				json.setFlag(false);
			return json;
		}catch (Exception e) {
			// TODO: handle exception
			json.setFlag(false);
			return json;
		}
	}
	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteMessage")
	public @ResponseBody
	Json deleteMessage(String[] del) {
		Json json = new Json();
		int truck = pushMessageService.deleteMessage(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
}
