package com.jy.thread;

import org.apache.log4j.Logger;

import com.baidu.push.msg.AndroidPushBatchUniMsg;


public class MsgThread implements Runnable {
	private static Logger log = Logger.getLogger(MsgThread.class);

	private String message;
	private String[] channelIdNo;
	public MsgThread() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MsgThread(String messages,String[] channelIdNos) {
		channelIdNo=new String[channelIdNos.length];
		this.message=messages;
		this.channelIdNo=channelIdNos;		
		// TODO Auto-generated constructor stub
	}

	public void run() {
		
			try {
				
					System.out.println("走啦！！");
					//AndroidPushBatchUniMsg.androidPushBatchMsg("确定车辆消息",message, channelIdNo);
				
				
				/*if (null != accessToken) {
					log.debug("获取access_token成功，有效时长{"+accessToken.getExpires_in()+"+}秒 token:{"+accessToken.getAccess_token()+"}");
					// 休眠7000秒
					Thread.sleep((Integer.parseInt(accessToken.getExpires_in()) - 200) * 1000);
				} else {
					// 如果access_token为null，60秒后再获取
					//Thread.sleep(60 * 1000);
				}*/
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
