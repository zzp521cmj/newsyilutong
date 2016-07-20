package com.jy.action;

import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ExportUtils;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.Income;
import com.jy.model.ShippingOrder;
import com.jy.service.IncomeDpInfoService;

@Controller
@RequestMapping(value = "/incomedp.do")
public class IncomeDpController {
	@Resource
	private IncomeDpInfoService iis;

	@RequestMapping(params = "method=getIncomeQuery")
	public String getIncomeQuery() {
		return "incomedp/IncomeInof";
	}

	// 跳转到添加页面
	@RequestMapping(params = "method=addIncome")
	public String addIncome() {
		return "incomedp/AddIncome";
	}

	// 跳转编辑页面并且获取合同的id 返回到页面
	@RequestMapping(params = "method=getEditIncomePage")
	public String getEdittIncomePage(String pid, HttpServletRequest request) {
		request.setAttribute("flg", pid);
		return "incomedp/EditIncmeInfo";
	}

	// 全部查询
	@RequestMapping(params = "method=getIncomeInfo")
	public @ResponseBody
	Map getIncomeInfo(String rows, String page, 
			String receipt, String goods_name, String start_address,
			String car_number) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<Income> list = iis.getIncomeInfo((page1 - 1) * rows1, rows1,
				receipt, goods_name, start_address, car_number);

		int count = iis.getIncome(receipt, goods_name, start_address, car_number);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/*
	 * 订单重复查询
	 */
	@RequestMapping(params = "method=getNumber")
	public @ResponseBody
	Income getIncome(String number) {
		Income der = iis.getNumber(number);
		return der;
	}

	// 保存
	@RequestMapping(params = "method=saveIncome")
	public @ResponseBody
	Json saveIncome(Income d, String id) {
		Json json = new Json();
		d.setTatal_id(UUIDUtils.getUUID());
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		
		int truck = iis.saveIncome(d);
		int i = iis.updateStatemake(id);
		if (truck >0&&i>0) {
			json.setFlag(true);
			return json;
		} else {
			json.setFlag(false);
			return json;
		}

	}

	/**
	 * 
	 * 删除
	 * 
	 * @param del
	 * @return
	 */
	@RequestMapping(params = "method=deleteIncome")
	public @ResponseBody
	Json deleteIncome(String[] del, String[] deletn )  {
		Json json = new Json();
		int i = iis.updateStateship(deletn);
		int truck = iis.deleteIncome(del);
		if (truck > 0 ) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	/*
	 * 订单信息总汇表制作查询
	 */
	@RequestMapping(params = "method=getUpdateShipOrder")
	public @ResponseBody
	ShippingOrder getUpdateShipOrder(String id) {
		ShippingOrder der = iis.getUpdateShipOrder(id);
		return der;
	}

	// 修改查询
	@RequestMapping(params = "method=getUpdateIncome")
	public @ResponseBody
	Income getUpdateIncome(String id) {
		Income der = iis.getUpdateIncome(id);
		return der;
	}

	// 修改
	@RequestMapping(params = "method=updateIncome")
	public @ResponseBody
	Json updateIncome(Income d) {
		// 修改
		d.setUpdatetime(DateFormat.getDateTimeInstance().format(new Date()));
		Json json = new Json();
		d.setIncome_style(2);
		int i = iis.updateIncome(d);
		if (i > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 汇总表车牌检索
			@RequestMapping(params = "method=IncemCarid")
			public @ResponseBody
			String IncemCarid(String id) {
				List<Income> list = iis.IncemCarid(id);
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
			// 车牌检索
			@RequestMapping(params = "method=getPlateNumber")
			public @ResponseBody
			String getPlateNumberLength(String id) {
				List<Income> list = iis.getPlateNumber(id);
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
			// 导出信息
			@RequestMapping(params = "method=outIncome")
			public @ResponseBody
			String outIncome(String datas, String[] headtitle, String[] fieldName,
					HttpServletResponse response, String name, String plate_number,
					String type, String start_date, String end_date) {
				String filename = "单票表信息导出";
				List<Income> list = iis.getIncomeAll(name, plate_number,
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
					ExportUtils.outputHeaders(headtitle, workbook, "单票表信息导出");
					// 调用工具类生成内容
					ExportUtils.outputColums(fieldName, list, workbook, 1, "单票表信息导出");
					workbook.write(ouputStream);
					ouputStream.flush();
					ouputStream.close();

				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
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
				List<ShippingOrder> list = iis.getShipOrderInfoMake((page1 - 1) * rows1,
						rows1, id);
				int count = iis.getShipOrderMake(id);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total", count);
				map.put("rows", list);
				return map;
			}
}