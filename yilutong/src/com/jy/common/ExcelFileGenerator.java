package com.jy.common;

import java.io.OutputStream;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

public class ExcelFileGenerator {
	private final int SPLIT_COUNT = 15; //Excel每个工作表的行数
	 
    private ArrayList fieldName = null; //excel数据的抬头栏，即名称栏
 
    private ArrayList fieldData = null; //excel导出的实际数据 
 
    private HSSFWorkbook workBook = null;//一个excel文件
 
    //有参构造器，限定了使用此类时，必须首先构建好两个list参数，并将所需数据放入上述两个list。
    //其中fieldName这个list可以使用泛型约束List<String>
    //fieldData这个可以使用泛型约束List<List<Object>>
    public ExcelFileGenerator(ArrayList fieldName, ArrayList fieldData) {
        this.fieldName = fieldName;
        this.fieldData = fieldData;
    }
    /**
     * @return HSSFWorkbook
     */
    public HSSFWorkbook createWorkbook() {
        workBook = new HSSFWorkbook();//创建一个工作簿
        int rows = fieldData.size();//清点出输入数据的行数
        int sheetNum = 0;//将工作表个数清零
        //根据数据的行数与每个工作表所能容纳的行数，求出需要创建工作表的个数
        if (rows % SPLIT_COUNT == 0) {
            sheetNum = rows / SPLIT_COUNT;
        } else {
            sheetNum = rows / SPLIT_COUNT + 1;
        }
 
        for (int i = 1; i <= sheetNum; i++) {
            HSSFSheet sheet = workBook.createSheet("Page " + i);//创建工作表
            HSSFRow headRow = sheet.createRow(0); //创建第一栏，抬头栏
            for (int j = 0; j < fieldName.size(); j++) {
                HSSFCell cell = headRow.createCell(j);//创建抬头栏单元格
                //设置单元格格式
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                sheet.setColumnWidth(j, 6000);
                HSSFCellStyle style = workBook.createCellStyle();
                HSSFFont font = workBook.createFont();
                font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
                short color = HSSFColor.RED.index;
                font.setColor(color);
                style.setFont(font);
                //将数据填入单元格
                if(fieldName.get(j) != null){
                    cell.setCellStyle(style);
                    cell.setCellValue((String) fieldName.get(j));
                }else{
                    cell.setCellStyle(style);
                    cell.setCellValue("-");
                }
            }
            //创建数据栏单元格并填入数据
            for (int k = 0; k < (rows < SPLIT_COUNT ? rows : SPLIT_COUNT); k++) {
                if (((i - 1) * SPLIT_COUNT + k) >= rows)
                    break;
                HSSFRow row = sheet.createRow(k + 1);
                ArrayList rowList = (ArrayList) fieldData.get((i - 1)
                        * SPLIT_COUNT + k);
                for (int n = 0; n < rowList.size(); n++) {
                    HSSFCell cell = row.createCell( n);
                    if(rowList.get(n) != null){
                        cell.setCellValue((String) rowList.get(n).toString());
                    }else{
                        cell.setCellValue("");
                    }
                }
            }
        }
        return workBook;
    }
    //将信息写入输出流的方法。
    public void exportExcel(OutputStream os) throws Exception {
        workBook = createWorkbook();
        workBook.write(os);
        os.close();
    }
}
