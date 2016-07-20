package com.jy.common;

public class HttpSenderTest {
	public static final String url="http://222.73.117.158/msg/";
	public static final String account = "sd_smwl";// 账号
	public static final String pswd = "Smwl168888";// 密码
	public static void pushMassage(String mobile,String msg) {		
		/*String mobile = "15628849993,17086002495,13964147025,18340060673,15106997081,18363071700,15662626313";// 手机号码，多个号码使用","分割
		String msg = "亲爱的用户，您的验证码是8个8哦也，5分钟内有效。";// 短信内容*/
		boolean needstatus = true;// 是否需要状态报告，需要true，不需要false
		String product = null;// 产品ID
		String extno = null;// 扩展码

		try {
			String returnString = HttpSender.batchSend(url, account, pswd, mobile, msg, needstatus, product, extno);
			System.out.println(returnString);
			// TODO 处理返回值,参见HTTP协议文档
		} catch (Exception e) {
			// TODO 处理异常
			e.printStackTrace();
		}
	}
}
