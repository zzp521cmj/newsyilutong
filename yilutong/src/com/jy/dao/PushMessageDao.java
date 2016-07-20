package com.jy.dao;

import java.util.List;

import com.jy.model.PushMessage;

public interface PushMessageDao {
	/**
	 * 查询分页
	 * @param i
	 * @param rows1
	 * @param message_title
	 * @param message_createuser
	 * @param start_date
	 * @param end_date
	 * @return
	 */
	List<PushMessage> getPushMessage(int i, Integer rows1,
			String message_title, String message_createuser, String start_date,
			String end_date);
	/**
	 * 查询个数
	 * @param message_title
	 * @param message_createuser
	 * @param start_date
	 * @param end_date
	 * @return
	 */
	int getCount(String message_title, String message_createuser,
			String start_date, String end_date);
	/**
	 * 保存消息
	 * @param pushmessage
	 * @return
	 */
	int saveMessage(PushMessage pushmessage);
	/**
	 * 删除消息
	 * @param del
	 * @return
	 */
	int deleteMessage(String[] del);
	/**
	 * 查询app消息
	 * @param userid
	 * @param username
	 * @return
	 */
	List<PushMessage> searchPushMessage(String userid, String username);

}
