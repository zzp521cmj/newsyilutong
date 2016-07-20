package com.jy.thread;

import org.apache.log4j.Logger;

import com.baidu.push.msg.AndroidPushBatchUniMsg;
import com.baidu.push.msg.AndroidPushMsgToAll;


public class PushMsgThread implements Runnable {
	private static Logger log = Logger.getLogger(PushMsgThread.class);

	private String message;
	private String[] channelIdNo;
	private String msgtitle;
	private String msgFlag;
	public PushMsgThread() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PushMsgThread(String msgtitle,String messages,String[] channelIdNos,String msgFlag) {
		if(channelIdNos!=null)
			channelIdNo=new String[channelIdNos.length];
		else
			channelIdNo=new String[0];
		this.message=messages;
		this.channelIdNo=channelIdNos;	
		this.msgtitle=msgtitle;
		this.msgFlag=msgFlag;
		// TODO Auto-generated constructor stub
	}

	public void run() {
		   
			try {
					if("1".equals(msgFlag))
						AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,message,channelIdNo);
					else
						AndroidPushMsgToAll.androidPushAllMsg(msgtitle,message);
			} catch (Exception e) {
				try {
					//Thread.sleep(60 * 1000);
				} catch (Exception e1) {
					log.error("{}", e1);
				}
				System.out.println("错误啦!");

				log.error("{}", e);
			}
		}
}
