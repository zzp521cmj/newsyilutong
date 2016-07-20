package com.jy.common;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.hssf.record.formula.functions.T;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;


public class ExportUtils {
	/**
	 * 设置sheet表头信息
	 * @param headers
	 * @param title
	 */
	public static HSSFSheet sheet;
	public static void outputHeaders(String[] headers,HSSFWorkbook workbook,String title){
		sheet = workbook.createSheet(title);
		// 生成一个样式
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置这些样式
		style.setFillForegroundColor(HSSFColor.WHITE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		// 生成一个字体
		HSSFFont font = workbook.createFont();
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 把字体应用到当前的样式
		style.setFont(font);
		//在第一行创建表头
		HSSFRow row= sheet.createRow(0);
		for (int i = 0; i < headers.length; i++) {
			//设置列宽
			sheet.setColumnWidth(i,4000);
			//对第一行创建列，对每一列进行赋值
			row.createCell(i).setCellValue(headers[i]);
		}
	}
	/**
	 * 设置每行数据
	 * @param headers
	 * @param colums
	 * @param sheet
	 * @param rowIndex
	 */
	public static void outputColums(String[] headers,List<?> colums,HSSFWorkbook workbook,int rowIndex,String title){
		
		// 生成并设置另一个样式
		HSSFCellStyle style2 = workbook.createCellStyle();
		style2.setFillForegroundColor(HSSFColor.WHITE.index);
		style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		// 生成另一个字体
		HSSFFont font2 = workbook.createFont();
		font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		// 把字体应用到当前的样式
		style2.setFont(font2);
		HSSFRow row;
		int headerSize=headers.length;
		int columnSize=colums.size();
		//循环多少行
		for (int i = 0; i < colums.size(); i++) {
			//从rowIndex行开始创建行
			row=sheet.createRow(rowIndex+i);
			Object obj=colums.get(i);
			//循环多少列
			for (int j = 0; j < headers.length; j++) {
				Object value=getFieldValueByName(headers[j],obj);
				if(value!=null){
					row.createCell(j).setCellValue(value.toString());
				}else{
					row.createCell(j).setCellValue("");
				}
			}
		}
	}
	/**
	 * 根据对象的属性获取值
	 * @param string
	 * @param obj
	 * @return
	 */
	private static Object getFieldValueByName(String fieldName, Object obj) {
		String firstLetter=fieldName.substring(0,1).toUpperCase();
		String getter="get"+firstLetter+fieldName.substring(1);
		try {
			Method method=obj.getClass().getMethod(getter, new Class[]{});
			Object value=method.invoke(obj, new Object[]{});
			return value;
		} catch (Exception e) {
			System.out.println("属性不存在");
			return null;
		}
		
	}
	
}
