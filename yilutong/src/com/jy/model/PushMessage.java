package com.jy.model;

public class PushMessage {
	private String id;//推送消息id
	private String message_title;//消息标题
	private String message_content;//消息内容
	private String message_time;//消息创建时间
	private String message_createuser;//消息创建者id
	private String message_touser;//消息推送给谁(接受消息者）
	private String message_tousername;//接受消息者名字
	private String username;//消息创建者用户名
	private String channelId;//设备id
	public String getChannelId() {
		return channelId;
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessage_tousername() {
		return message_tousername;
	}
	public void setMessage_tousername(String message_tousername) {
		this.message_tousername = message_tousername;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_time() {
		return message_time;
	}
	public void setMessage_time(String message_time) {
		this.message_time = message_time;
	}
	public String getMessage_createuser() {
		return message_createuser;
	}
	public void setMessage_createuser(String message_createuser) {
		this.message_createuser = message_createuser;
	}
	public String getMessage_touser() {
		return message_touser;
	}
	public void setMessage_touser(String message_touser) {
		this.message_touser = message_touser;
	}
	
}
