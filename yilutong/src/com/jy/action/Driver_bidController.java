package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.dao.Driver_bidDao;
import com.jy.model.Income;
import com.jy.model.driver_evaluate;
import com.jy.model.waybill_number;

@Controller
@RequestMapping(value = "/driver_bid.do")
public class Driver_bidController {
	@Resource
	private Driver_bidDao bidDao;
	
	@RequestMapping(params = "method=receipt")
	public String receipt(){
		return "invoice/driver_bid";
	}
	
	// 全部查询
		@RequestMapping(params = "method=getwaybill_number")
		public @ResponseBody
		Map getwaybill_number(String rows,String page,String driver_name1,String plate_numbers1,String phone1,String qsstartdate1,String qsenddate1) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			List<waybill_number> list = bidDao.getwaybillnumber((page1 - 1) * rows1, rows1, driver_name1, plate_numbers1, phone1,qsstartdate1,qsenddate1);
			for (waybill_number waybill_number : list) {
				waybill_number.getPhone_number();
			}
			System.out.println(list.size());
			int count = bidDao.getwaybillnumberlist(driver_name1, plate_numbers1, phone1,qsstartdate1,qsenddate1);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		
		// 全部查询
				@RequestMapping(params = "method=getdriver_evaluate")
				public @ResponseBody
				Map getdriver_evaluate(String rows,String page,String driver_name,String plate_numbers,String phone,String qsstartdate,String qsenddate) {
					Integer rows1 = 0;// 当前有几行
					Integer page1 = 1;// 当前有几页
					if (rows != null && !"".equals(rows)) {
						rows1 = Integer.parseInt(rows);
					}
					if (page != null && !"".equals(page)) {
						page1 = Integer.parseInt(page);
					}
					System.out.println(driver_name+""+plate_numbers+""+phone);
					List<driver_evaluate> list = bidDao.getdrivar_evaluate((page1 - 1) * rows1, rows1, driver_name, plate_numbers, phone,qsstartdate,qsenddate);
					System.out.println(list.size());
					for (driver_evaluate driver_evaluate : list) {
						driver_evaluate.getPhone_number();
					}
					int count = bidDao.getdrivar_evaluatelist(driver_name, plate_numbers, phone,qsstartdate,qsenddate);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("total", count);
					map.put("rows", list);
					return map;
				}
}
