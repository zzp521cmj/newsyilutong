package com.jy.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;





import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.jy.model.PostClassline;
import com.jy.model.Taskonlineimport;
import com.jy.service.LinStandardService;
import com.jy.service.impl.LinStandardServiceImpl;
import com.jy.service.impl.TaskonlineimportServiceImpl;

/**
 * 
 * @author hqh
 */
@Component
public class OperationExcelForPOI {
	
	private ApplicationContext ac;
	private TaskonlineimportServiceImpl taskonlineimportServiceImpl ;
	private LinStandardServiceImpl linStandardServiceImpl;
	
	public String impExcel(String execelFile) throws Exception {
		
		ac=new ClassPathXmlApplicationContext(new String[] {"classpath:mybatis-config.xml","classpath:spring.xml"});
		taskonlineimportServiceImpl=(TaskonlineimportServiceImpl) ac.getBean("TaskonlineimportService");
		linStandardServiceImpl=(LinStandardServiceImpl) ac.getBean("LinStandardService");
		
		List carnojl=new ArrayList();
		
		Taskonlineimport tli;
		List<Taskonlineimport> tlist = new ArrayList<Taskonlineimport>();
		List<PostClassline>pclist=linStandardServiceImpl.getlinnameandno(null);
	       File file = new File(execelFile);
	       String[][] result = getData(file, 1);
	       int rowLength = result.length;
	       for(int i=0;i<rowLength;i++) {
	    	   tli=new Taskonlineimport();
	    	   //----------------------循环插入
	           for(int j=0;j<result[i].length;j++) {
	              System.out.print(result[i][j]+"\t\t");
	              if (j == 0) {
						tli.setLinnumber(result[i][j]);// 线路号
					} else if (j == 1) {
						tli.setLinname(result[i][j]);// 线路名称
					} else if (j == 2) {
						tli.setLincarno(result[i][j]);// 车号
					} else if (j == 3) {
						tli.setLincartype(result[i][j]);// 车型
					} else if (j == 4) {
						tli.setLincarowner(result[i][j]);// 车主
					} else if (j == 5) {
						if (result[i][j] != null && !result[i][j].trim().equals("")) {
							tli.setLinmoney(Double.parseDouble(result[i][j]));// 总运费
						} else {
							tli.setLinmoney(0);
						}
					}
	           }//----------------循环插入end
	           //-----------------通过车牌号查询车长，车型 start
	           if(tli.getLincarno()!=null||"".equals(tli.getLincarno())){
	        	  String cartype = taskonlineimportServiceImpl.getcartype(tli.getLincarno());
	        	  String carow = taskonlineimportServiceImpl.getcarow(tli.getLincarno());
	        	  if(cartype==null||cartype.equals("")){
	        		  cartype=""; 
	        	  }
	        	  if(carow==null||carow.equals("")){
	        		  carow=""; 
	        	  }
	        	  tli.setLincartype(cartype);
	        	  tli.setLincarowner(carow);
	           }//-----------------通过车牌号查询车长，车型end
	           tli.setLinno(UUIDUtils.getUUID());
	           
	          // tli.getLinname();//获取班线名称
	          // tli.getLincarno();//班线号
	           if(tli.getLinname()!=null& tli.getLinname()!=""&& tli.getLincarno()!=null&& tli.getLincarno()!=""){
	        	   String carno="";
	        	   boolean flag=false;
	        	   for (PostClassline p : pclist) {
	       				if(p.getClasslineName().equals(tli.getLinname())){
		       				tli.setLinnumber(p.getClasslineCode());	
		       				tlist.add(tli);
		       				flag=true;
	       				}else{
	       					carno=tli.getLinname();
	       				}
	       		   }
	        	   if(!flag){
	        	   carnojl.add(carno);
	        	   }	           
	           }
	       }
	       	   int js=tlist.size();//插入成功条数
	       	   int zs=rowLength;//总数
	       	   String cn="";
		       for (int k = 0; k < carnojl.size(); k++) {
		    	   cn=cn+"|"+carnojl.get(k).toString();
			   }
	       	   String rb=zs+"#"+js+"#"+carnojl;
	    	   int i=taskonlineimportServiceImpl.saveimp(tlist);
	    	   if(i==0){
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
	                                value = new SimpleDateFormat("yyyy-MM-dd")
	                                       .format(date);
	                            } else {
	                                value = "";
	                            }
	                         } else {
	                            value = new DecimalFormat("0").format(cell
	                                   .getNumericCellValue());
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
	                  }
	                  if (columnIndex == 0 && value.trim().equals("")) {
	                     break;
	                  }
	                  values[columnIndex] = rightTrim(value);
	                  hasValue = true;
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
