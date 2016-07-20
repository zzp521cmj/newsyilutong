package com.jy.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.jy.model.OrderCustom;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.model.shipmentStatistics;
import com.jy.service.ShippingOrderInfoService;
import com.jy.service.impl.OrderInfoServiceImpl;
import com.jy.service.impl.ShippingOrderInfoServiceImpl;

/**
 * 
 * @author hqh
 */
@Component
public class OrderExcelForPOI {
	private ApplicationContext ac;
	private OrderInfoServiceImpl OrderInfoServiceImpl ;

	
	public String impExcel(String execelFile,String usersname,String pid,HttpServletRequest request) throws Exception {
		ac=new ClassPathXmlApplicationContext(new String[] {"classpath:mybatis-config.xml","classpath:spring.xml"});
		OrderInfoServiceImpl=(OrderInfoServiceImpl) ac.getBean("OrderInfoService");
		StringBuffer order_num=new StringBuffer();
		ShippingOrder tli;
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
		shipmentStatistics ss = new shipmentStatistics();
		OrderCustom oc=OrderInfoServiceImpl.getUpdateOrderCustom(pid);
		List<ShippingOrder> tlist = new ArrayList<ShippingOrder>();
	       File file = new File(execelFile);
	       String[][] result = getData(file, 1);
	       int rowLength = result.length;
	       for(int i=0;i<rowLength;i++) {
	    	   tli=new ShippingOrder();
	    	   System.out.println("//----------------------循环插入"+rowLength);
	    	   
	           for(int j=0;j<result[i].length;j++) {
	              	if (j == 0) {//发车日期
	              		if(result[i][j]!=""&&result[i][j]!=null){
	              			tli.setSend_time(result[i][j]);	
	              		}
	              	
					} else if (j == 1) {//发站
						tli.setSend_station(result[i][j]);
					} else if (j == 2) {//发货人电话 send_phone
						tli.setSend_phone(result[i][j]);

					} else if (j ==3 ) {//委托时间  weituo_time
						tli.setWeituo_time(result[i][j]);
					} else if (j == 4) {//委托单号 weitoudanhao
						tli.setWeitoudanhao(result[i][j]);
					} else if (j == 5) {//  运单号
						if(result[i][j]!=null&&!"".equals(result[i][j])){
							int der = OrderInfoServiceImpl.getAorder(result[i][j]);
							if(der>0){
								if(i>0){
									order_num.append(","+result[i][j]);
								}else{
									order_num.append(result[i][j]);
								}
								tli.setShiping_order_num("");
								break;
							}else{
								tli.setShiping_order_num(result[i][j]);
							}
						}else{
							SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
							String number=dateFormat.format(new Date());
							Random r=new Random();
							String s="";
							int k=r.nextInt(99);
							if(k<10){
								s="0"+k;
							}else{
								s=k+"";
							}
							tli.setShiping_order_num(number.substring(8,10)+number.substring(11, 13)+s);
						}
					} else if (j == 6) {//交接方式
						if("专车送货".equals(result[i][j])){
							tli.setSend_type("1");
						}else if("客户自提".equals(result[i][j])){
							tli.setSend_type("0");
						}else if("送货进仓".equals(result[i][j])){
							tli.setSend_type("2");
						}else if("送货上楼".equals(result[i][j])){
							tli.setSend_type("3");
						}else if("送货上门".equals(result[i][j])){
							tli.setSend_type("4");
						}			
					} else if (j == 7) {// 到站
						tli.setEnd_address(result[i][j]);
					} else if (j == 8) {// 收货人名称
						tli.setReceipt(result[i][j]);						
					} else if (j == 9) {// 收货人电话
						tli.setReceipt_tel(result[i][j]);
					} else if (j == 10) {//送货地址
						if(result[i][j]!=""){
							tli.setReceipt_address(result[i][j]);
						}
					}else if (j == 11) {// 品名
						tli.setGoods_name(result[i][j]);
					}else if (j == 12) {// 包装
						tli.setGoods_packing(result[i][j]);
					}else if (j == 13) {// 件数
						if(result[i][j]!=null&&!"".equals(result[i][j])){
							tli.setGoods_num(result[i][j]);
						}else{
							tli.setGoods_num("0");
						}
					}else if (j == 14) {// 重量
					
					if(result[i][j]!=null&&!"".equals(result[i][j])){
							tli.setGoods_weight(result[i][j]);
						}
					}else if (j == 15) {// 体积
						if(result[i][j]!=null&&!"".equals(result[i][j])){
							tli.setGoods_vol(result[i][j]);
						}
					}else if (j == 16) {//备注
						tli.setRemarks(result[i][j]);		
					}else if (j == 17) {//运费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setFreight_fee(result[i][j]);
						}
					} else if (j == 18) {//提货费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setPicking_fee(result[i][j]);
						}
					}else if (j == 19) {//装卸费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setReceivable_ground_fee(result[i][j]);
						}
					}else if (j == 20) {//上楼费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setUpstairs_fee(result[i][j]);
						}
					}else if (j == 21) {//直送费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setDeliver_fee(result[i][j]);
						}
					}else if (j == 22) {//理货费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setSeized_fee(result[i][j]);
						}
					}else if (j == 23) {//开箱验货费
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setInspect_fee(result[i][j]);
						} 
					}else if (j == 24) {//投保价值 Affirm_value
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setAffirm_value(result[i][j]);
						}
					}else if (j == 25) {//费率Rates
						if(result[i][j]==""||result[i][j]==null){
						}else{
							tli.setRates(result[i][j]);
						}
					}else if (j == 26) {//保价费 Insurance_fee
						if(result[i][j]==""||result[i][j]==null){
						}else{
							tli.setInsurance_fee(result[i][j]);
						}
					}else if (j == 27) {//代收货款
						if(result[i][j]==""||result[i][j]==null){
						}else{
							tli.setTrade_agency(result[i][j]);
						}
					}else if (j == 28) {//费率 shouxu_feelv
						if(result[i][j]==""||result[i][j]==null){
						}else{
							tli.setShouxu_feelv(result[i][j]);
						}
					}else if (j == 29) {//手续费handling_charge
						if(result[i][j]==""||result[i][j]==null){
						}else{
							tli.setHandling_charge(result[i][j]);
						}
					}else if (j == 30) {//其他费用
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setAdorn_fee(result[i][j]);
						}
					}else if (j == 31) {//到付款
						if(result[i][j]!=null&&!"".equals(result[i][j])){
						tli.setDestination_fee(result[i][j]);
						}
					}else if (j == 32) {//总运费
						if(result[i][j]==""||result[i][j]==null){
						}else{
							tli.setTransport_pay(result[i][j]);
						}
					}else if (j == 33) {//付款方式
						if ("回付".equals(result[i][j])) {
							tli.setPay_type("0");
						}else if ("提付".equals(result[i][j])) {
							tli.setPay_type("1");
						}else if ("现付".equals(result[i][j])) {
							tli.setPay_type("2");
						}else if ("货到前付".equals(result[i][j])) {
							tli.setPay_type("3");
						}else if ("发货方月结".equals(result[i][j])) {
							tli.setPay_type("4");
						}else if ("收货方月结".equals(result[i][j])) {
							tli.setPay_type("5");
						}else if ("".equals(result[i][j])) {
							tli.setPay_type("0");
						}
										
						
					}else if (j == 34) {//回扣				
						tli.setBack_fee(result[i][j]);
				    }else if (j == 35) {//付款方式
						if ("现付".equals(result[i][j])) {
							tli.setFankuan_stata("0");
						}else if ("欠返".equals(result[i][j])) {
							tli.setFankuan_stata("1");
						}else if ("".equals(result[i][j])) {
							tli.setFankuan_stata("0");
						}
										
						
					}else if (j == 36) {//应收备注
						tli.setRemarks_fee(result[i][j]);
				     }else if (j == 37) {//要回单
							if("是".equals(result[i][j])){						
								tli.setInvoice_state("0");
							}else if("否".equals(result[i][j])){
								tli.setInvoice_state("1");
							}else if ("".equals(result[i][j])) {
								tli.setInvoice_state("1");
							}
						}else if (j == 38) {//要回单
						if("是".equals(result[i][j])){						
							tli.setIs_recept_no("1");
						}else if("否".equals(result[i][j])){
							tli.setIs_recept_no("0");
						}else if ("".equals(result[i][j])) {
							tli.setIs_recept_no("0");
						}
					}else if (j == 39) {//回单分数
						tli.setIs_recept(result[i][j]);	
					}else if (j == 40) {//急货
						if("是".equals(result[i][j])){						
							tli.setMost_urgent("1");
						}else if("否".equals(result[i][j])){
							tli.setMost_urgent("0");
						}else if ("".equals(result[i][j])) {
							tli.setMost_urgent("0");
						}
					}else if (j == 41) {//控货
						if("是".equals(result[i][j])){						
							tli.setKonghuo("1");
						}else if("否".equals(result[i][j])){
							tli.setKonghuo("0");
						}else if ("".equals(result[i][j])) {
							tli.setKonghuo("0");
						}
					} else if (j == 42) {//控货
						if("机打运单".equals(result[i][j])){						
							tli.setPrinted("1");
						}else if("机打标签".equals(result[i][j])){
							tli.setPrinted("0");
						}else if ("".equals(result[i][j])) {
							tli.setPrinted("0");
						}
					}   
	           }
	           if(tli.getShiping_order_num()!=""){
	        	   tli.setPaid_fu(tli.getBack_fee());
	        	   tli.setReality_sum(tli.getTransport_pay());
	        	   tli.setSetldaisk_trade(tli.getTrade_agency());
	        	   tli.setPaidgf_fu(tli.getTrade_agency());
	        	   tli.setPaid_fee(tli.getDestination_fee());
	        	   tli.setHandling_shihou(tli.getHandling_charge());
	        	   
	        	   
	        	   tli.setCustom_id(oc.getCustom_id());
		           tli.setCar_number(oc.getCar_number());
		           tli.setCustom_name(oc.getCustom_name());
		           tli.setShipping_order_name(usersname);
		           tli.setCreat_type("1");
		           tli.setShipping_order_state("0");
		           tli.setTransport_mode("0");
	 	           tli.setShiping_order_id(UUIDUtils.getUUID());
	 	           tli.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
	 	           tli.setOrder_time(DateFormat.getDateTimeInstance().format(new Date()));//制单时间
	 	           tli.setUser_id(user.getId());
	 	           tli.setCustomer_id(oc.getCustomer_id());
	 	           ss.setCustomer_id(oc.getCustomer_id());
	 	           ss.setOrder_time(DateFormat.getDateTimeInstance().format(new Date()));
	 	           ss.setShipment_statistics_id(UUIDUtils.getUUID());
	 	           
	 	           tlist.add(tli);
	           } 
	       }
	       	   int js=tlist.size();//插入成功条数
	       	   int zs=rowLength;//总数
	           ss.setTotality(js);
	       	   String rb=zs+"#"+js+"#"+order_num.toString()+"#"+pid;
	       	   int num=0;
	       	   int groos = 0;
	       	   if(tlist.size()>0){
	       		   num=OrderInfoServiceImpl.saveimp(tlist);
	       		   groos = OrderInfoServiceImpl.insertIntoShipStatis(ss);
	       		   System.out.println(tlist.size()+"o(︶︿︶)o");
	       	   }
	    	   
	    	   if(num==0){
	    		   return rb;
	    	   }else{
	    		   return rb;
	    	   }
	    	   
	    }
	 
	    /**
	     * 读取Excel的内容，第一维数组存储的是一行中格列的值，二维数组存储的是多少个行
	     * @param file 读取数据的源Excel
	     * @param ignoreRows 读取数据忽略的行数，比喻行头不需要读入 忽略的行数为1
	     * @return 读出的Excel中数据的内容
	     * @throws FileNotFoundException
	     * @throws IOException
	     */
	    public static String[][] getData(File file, int ignoreRows)
	           throws FileNotFoundException, IOException {
	       List<String[]> result = new ArrayList<String[]>();
	       int rowSize = 0;
	       BufferedInputStream in = new BufferedInputStream(new FileInputStream(
	              file));
	       // 打开HSSFWorkbook
	       POIFSFileSystem fs = new POIFSFileSystem(in);
	       HSSFWorkbook wb = new HSSFWorkbook(fs);
	       HSSFCell cell = null;
	       for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
	           HSSFSheet st = wb.getSheetAt(sheetIndex);
	           // 第一行为标题，不取
	           for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
	              HSSFRow row = st.getRow(rowIndex);
	              if (row == null) {
	                  continue;
	              }
	              int tempRowSize = row.getLastCellNum() + 1;
	              if (tempRowSize > rowSize) {
	                  rowSize = tempRowSize;
	              }
	              String[] values = new String[rowSize];
	              Arrays.fill(values, "");
	              boolean hasValue = false;
	              for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
	                  String value = "";
	                  cell = row.getCell(columnIndex);
	                  if (cell != null) {
	                     switch (cell.getCellType()) {
	                     case HSSFCell.CELL_TYPE_STRING:
	                         value = cell.getStringCellValue();
	                         break;
	                     case HSSFCell.CELL_TYPE_NUMERIC:
	                         if (HSSFDateUtil.isCellDateFormatted(cell)) {
	                            Date date = cell.getDateCellValue();
	                            if (date != null) {
	                                value = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
	                                       .format(date);
	                            } else {
	                                value = "";
	                            }
	                         } else {
	                        /*    value = new DecimalFormat("0.00").format(cell
	                                   .getNumericCellValue());*/
	                        	 cell.setCellType(1);//设置为String
	                            value =cell.getStringCellValue().trim();
	                         }
	                         break;
	                     case HSSFCell.CELL_TYPE_FORMULA:
	                         // 导入时如果为公式生成的数据则无值
	                         if (!cell.getStringCellValue().equals("")) {
	                            value = cell.getStringCellValue();
	                         } else {
	                            value = cell.getNumericCellValue() + "";
	                         }
	                         break;
	                     case HSSFCell.CELL_TYPE_BLANK:
	                         break;
	                     case HSSFCell.CELL_TYPE_ERROR:
	                         value = "";
	                         break;
	                     case HSSFCell.CELL_TYPE_BOOLEAN:
	                         value = (cell.getBooleanCellValue() == true ? "Y"
	                                : "N");
	                         break;
	                     default:
	                         value = "";
	                     }
	                  }else{
	                	  
	                  }
	                  if (columnIndex == 6 &&(value.trim().equals("")|| value.trim().equals(null))) {
	                	 hasValue = false;             	  
	                     break;
	                  }else{
	                	  values[columnIndex] = rightTrim(value);
		                  hasValue = true;
	                  }
	              }
	              if (hasValue) {
	                  result.add(values);
	              }
	           }
	       }
	       in.close();
	       String[][] returnArray = new String[result.size()][rowSize];
	       for (int i = 0; i < returnArray.length; i++) {
	           returnArray[i] = (String[]) result.get(i);
	       }
	       return returnArray;
	    }

	    /**
	     * 去掉字符串右边的空格
	 
	     * @param str 要处理的字符串
	 
	     * @return 处理后的字符串
	 
	     */
	 
	     public static String rightTrim(String str) {
	       if (str == null) {
	           return "";
	       }
	       int length = str.length();
	       for (int i = length - 1; i >= 0; i--) {
	           if (str.charAt(i) != 0x20) {
	              break;
	           }
	           length--;
	       }
	       return str.substring(0, length);
	    }
	 
/*	public void expExcel(String expFilePath) {
		OutputStream os = null;
		Workbook book = null;
		try {
			// 输出流
			os = new FileOutputStream(expFilePath);
			// 创建工作区(97-2003)
			// 创建第一个sheet页
			book = new HSSFWorkbook();
			Sheet sheet = book.createSheet("test");
			// 生成第一行
			Row row = sheet.createRow(0);
			// 给第一行的第一列赋值
			row.createCell(0).setCellValue("column1");
			// 给第一行的第二列赋值
			row.createCell(1).setCellValue("column2");
			// 写文件
			book.write(os);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 关闭输出流
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}*/
}
