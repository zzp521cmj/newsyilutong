package com.jy.thread;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.baidu.push.msg.AndroidPushBatchUniMsg;
import com.baidu.push.msg.AndroidPushBatchUniMsgNew;
import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;
import com.baidu.yun.push.auth.PushKeyPair;
import com.baidu.yun.push.client.BaiduPushClient;
import com.baidu.yun.push.constants.BaiduPushConstants;
import com.baidu.yun.push.exception.PushClientException;
import com.baidu.yun.push.exception.PushServerException;
import com.baidu.yun.push.model.PushBatchUniMsgRequest;
import com.baidu.yun.push.model.PushBatchUniMsgResponse;

public class CAInfoPushMessage implements Runnable {
	public static void main(String[] args) {
		String[] channelIdNo={"4147859322264897675"};
		CAInfoPushMessage ca = new CAInfoPushMessage("message",channelIdNo,"111","1");
		ca.run();
	}
	private static Logger log = Logger.getLogger(PushMsgThread.class);

	private String message;
	private String[] channelIdNo;
	private String msgtitle;
	private String msgFlag;
	private JSONObject jsonCustormCont; 
    
	public CAInfoPushMessage() {
		super();
	}

	public CAInfoPushMessage(String message, String[] channelIdNo,
			String msgtitle) {
		super();
		this.message = message;
		this.channelIdNo = channelIdNo;
		this.msgtitle = msgtitle;
		
	}
	

	public CAInfoPushMessage(String message, String[] channelIdNo,
			String msgtitle, String msgFlag) {
		super();
		this.message = message;
		this.channelIdNo = channelIdNo;
		this.msgtitle = msgtitle;
		this.msgFlag = msgFlag;
	}

	public CAInfoPushMessage(String message, String[] channelIdNo,
			String msgtitle, String msgFlag, JSONObject jsonCustormCont) {
		super();
		this.message = message;
		this.channelIdNo = channelIdNo;
		this.msgtitle = msgtitle;
		this.msgFlag = msgFlag;
		this.jsonCustormCont = jsonCustormCont;
	}

	public void run() {
		try {
			AndroidPushBatchUniMsgNew.androidPushBatchMsg(msgtitle,message,channelIdNo,jsonCustormCont);
		} catch (PushClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (PushServerException e) {
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
