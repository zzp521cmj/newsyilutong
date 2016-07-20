package com.jy.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;





import com.jy.common.ExportUtils;
import com.jy.common.OperationExcelForPOI;
import com.jy.common.OrderExcelForPOI;
import com.jy.common.QRCodeEncoderHandler;
import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.User;
import com.jy.service.IncomeInfoService;
import com.jy.service.ShippingOrderInfoService;

/*
 * 收入总汇管理
 * */
@Controller
@RequestMapping(value = "/income.do")
public class IncomerInfoController {
	@Resource
	private IncomeInfoService csi;

	@RequestMapping(params = "method=getIncomeInfo")
	public String gettIncomeInfoMan() {
		return "income/incomeInfo";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditIncomePage")
	public String getEdittIncomePage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "income/EditIncmeInfo";
	}

	@RequestMapping(params = "method=getIncomePage")
	public String gettIncomePage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "shipping_order/SearchShipOrder";
	}

	// 全部查询
	@RequestMapping(params = "method=getIncome")
	public @ResponseBody
	Map getIncomeInfo(String rows, String page, String name,
			String phone_number, String type, String start_date, String end_date) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<Income> list = csi.getIncomeInfo((page1 - 1) * rows1,
				rows1, name, phone_number, type, start_date, end_date);

		int count = csi.getIncome(name, phone_number, type, start_date,
				end_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}
	// 全部查询
		@RequestMapping(params = "method=getIncomeMake")
		public @ResponseBody
		Map getIncomeMake(String rows, String page, String id) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list = csi.getShipOrderInfoMake((page1 - 1) * rows1,
					rows1, id);
			System.out.println(list.size());
			int count = csi.getShipOrderMake(id);
			System.out.println(count);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}

	/*
	 * 批量删除
	 */
	@RequestMapping(params = "method=deleteIncome")
	public @ResponseBody
	Json delIncome(String[] del,String []che) {
		Json json = new Json();
		int i=csi.updateStateship(che);
		int truck = csi.deleteIncome(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addIncome")
	public String addIncome() {
		return "income/addIncmeInfo";
	}
	
	// 保存
	@RequestMapping(params = "method=saveIncome")
	public @ResponseBody
	Json saveIncome(Income d,String id) {
		Json json = new Json();
		d.setTatal_id(UUIDUtils.getUUID());
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		//计算总合计、支出合计、利润
		double total=Double.parseDouble(d.getSends_fee())+Double.parseDouble(d.getChange_total())+Double.parseDouble(d.getLand_total());
		d.setIncome_total(String.valueOf(total));
		double pay=Double.parseDouble(d.getSend_pay())+Double.parseDouble(d.getChanges_pay())+Double.parseDouble(d.getLand_pay());
		d.setPay_total(String.valueOf(pay));
		double sendg=Double.parseDouble(d.getSends_fee())-Double.parseDouble(d.getSend_pay());
		double changsg=Double.parseDouble(d.getChange_total())-Double.parseDouble(d.getChanges_pay());
		double landg=Double.parseDouble(d.getLand_total())-Double.parseDouble(d.getLand_pay());
		double totalg=sendg+changsg+landg;
		d.setGain_send(String.valueOf(sendg));
		d.setGain_change(String.valueOf(changsg));
		d.setGain_land(String.valueOf(landg));
		d.setGain_total(String.valueOf(totalg));
		int truck = csi.saveIncome(d);
		int i=csi.updateStatemake(id);
		if (truck >0&&i>0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
			return json;
		}

	}

	/*
	 * 订单信息总汇表制作查询
	 */
	@RequestMapping(params = "method=getUpdateShipOrder")
	public @ResponseBody
	ShippingOrder getUpdateShipOrder(String id) {
		ShippingOrder der = csi.getUpdateShipOrder(id);
		return der;
	}
	//修改查询
	@RequestMapping(params = "method=getUpdateIncome")
	public @ResponseBody
	Income getUpdateIncome(String id) {
		Income der = csi.getUpdateIncome(id);
		return der;
	}
	// 导入页面
	@RequestMapping(params = "method=inputIncome")
	public String inputIncome() {
		return "driver/InputDriver";
	}

	// 修改
	@RequestMapping(params = "method=updateIncome")
	public @ResponseBody
	Json updateIncome(Income d) {
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		//计算总合计、支出合计、利润
		double total=Double.parseDouble(d.getSends_fee())+Double.parseDouble(d.getChange_total())+Double.parseDouble(d.getLand_total());
		d.setIncome_total(String.valueOf(total));
		double pay=Double.parseDouble(d.getSend_pay())+Double.parseDouble(d.getChanges_pay())+Double.parseDouble(d.getLand_pay());
		d.setPay_total(String.valueOf(pay));
		double sendg=Double.parseDouble(d.getSends_fee())-Double.parseDouble(d.getSend_pay());
		double changsg=Double.parseDouble(d.getChange_total())-Double.parseDouble(d.getChanges_pay());
		double landg=Double.parseDouble(d.getLand_total())-Double.parseDouble(d.getLand_pay());
		double totalg=sendg+changsg+landg;
		d.setGain_send(String.valueOf(sendg));
		d.setGain_change(String.valueOf(changsg));
		d.setGain_land(String.valueOf(landg));
		d.setGain_total(String.valueOf(totalg));
		Json json = new Json();
		d.setIncome_style(1);
		int i = csi.updateIncome(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 车牌检索
	@RequestMapping(params = "method=getPlateNumber")
	public @ResponseBody
	String getPlateNumberLength(String id) {
		List<Income> list = csi.getPlateNumber(id);
		JSONObject jb = null;
		JSONArray jsons = new JSONArray();
		for (Income d : list) {
			jb = new JSONObject();
			jb.put("id", d.getTravel_card_id());
			jb.put("name", d.getPlate_number());
			jsons.add(jb);
		}
		return jsons.toString();
	}
	
	// 汇总表车牌检索
		@RequestMapping(params = "method=IncemCarid")
		public @ResponseBody
		String IncemCarid(String id) {
			List<Income> list = csi.IncemCarid(id);
			JSONObject jb = null;
			JSONArray jsons = new JSONArray();
			for (Income d : list) {
				jb = new JSONObject();
				jb.put("id", d.getCar_id());
				jb.put("name", d.getCar_number());
				jsons.add(jb);
			}
			return jsons.toString();
		}
	// 导出信息
	@RequestMapping(params = "method=outIncome")
	public @ResponseBody
	String outIncome(String datas, String[] headtitle, String[] fieldName,
			HttpServletResponse response, String name, String plate_number,
			String type, String start_date, String end_date) {
		String filename = "汇总表信息导出";
		List<Income> list = csi.getIncomeAll(name, plate_number,
				type, start_date, end_date);
		// ExportExcel<Agreement> esx= new ExportExcel<Agreement>();
		try {
			// 声明一个工作薄
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 生成一个表格
			response.setContentType("application/vnd.ms-excel;");
			response.setHeader("Content-Disposition", "attachment;filename=\""
					+ new String(filename.getBytes("gbk"), "iso-8859-1")
					+ ".xls\"");
			OutputStream ouputStream = response.getOutputStream();
			// 调用工具类创建表头
			ExportUtils.outputHeaders(headtitle, workbook, "汇总表信息导出");
			// 调用工具类生成内容
			ExportUtils.outputColums(fieldName, list, workbook, 1, "汇总表信息导出");
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//协议制作订单查询
		@RequestMapping(params="method=getShipOrderCAM")
		public @ResponseBody Map getShipOrderCAM(String rows, String page, String[] pid){
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<ShippingOrder> list=csi.getShipOrderCAM((page1 - 1) * rows1,rows1,pid);//当前页
			int count=pid.length;
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
}
