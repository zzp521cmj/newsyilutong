package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.model.DeparturePlan;
import com.jy.model.MonitorPoshytip;
import com.jy.service.ClassLineMonitorService;

@Controller
@RequestMapping(value="/clm.do")
public class ClassLineMonitorController {
	@Resource
	private ClassLineMonitorService clms;
	@RequestMapping(params = "method=getMonitor")
	public String getMonitor() {
		return "DeparturePlan/monitor";
	}
	// 全部查询
		@RequestMapping(params = "method=getMonitorPage")
		public @ResponseBody
		Map getMonitorPage(String rows, String page) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 1;// 当前有几页
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			
			List<DeparturePlan> list = clms.getDeparturePlans((page1 - 1) * rows1, rows1);
			System.out.println(list.size());
			int count = clms.getCount();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
		@RequestMapping(params = "method=getPoshytip")
		public @ResponseBody List<MonitorPoshytip> getPoshytip(String id){
			List<MonitorPoshytip> list =clms.getPoshytip(id);
			return list;
		}
		
}
