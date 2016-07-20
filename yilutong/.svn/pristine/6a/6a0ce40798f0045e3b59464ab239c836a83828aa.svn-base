package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.common.UUIDUtils;
import com.jy.dao.PushMessageDao;
import com.jy.model.PushMessage;
import com.jy.service.PushMessageService;
@Controller
public class PushMessageServiceImpl implements PushMessageService{
@Resource
private PushMessageDao pmd;
	/**
	 * 查询分页
	 */
	public List<PushMessage> getPushMessage(int i, Integer rows1,
			String message_title, String message_createuser, String start_date,
			String end_date) {
		// TODO Auto-generated method stub
		System.out.println(message_title);
		List<PushMessage> list=pmd.getPushMessage(i,rows1,message_title,message_createuser,start_date,end_date);
		return list;
	}
	/**
	 * 查询总个数
	 */
	public int getCount(String message_title, String message_createuser,
			String start_date, String end_date) {
		// TODO Auto-generated method stub
		int i=pmd.getCount(message_title,message_createuser,start_date,end_date);
		return i;
	}
	/**
	 * 保存消息
	 */
	public int saveMessage(PushMessage pushmessage) {
		// TODO Auto-generated method stub
		pushmessage.setId(UUIDUtils.getUUID());
		int i=pmd.saveMessage(pushmessage);
		return i;
	}
	/**
	 * 删除消息
	 */
	public int deleteMessage(String[] del) {
		// TODO Auto-generated method stub
		int i=pmd.deleteMessage(del);
		return i;
	}
	/**
	 * 查询app消息
	 */
	public List<PushMessage> searchPushMessage(String userid, String username) {
		// TODO Auto-generated method stub
		List<PushMessage> list=pmd.searchPushMessage(userid,username);
		return list;
	}
	
}
