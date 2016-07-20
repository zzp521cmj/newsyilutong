package com.jy.action;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.dao.Json;
import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.service.ConfluenceService;

@Controller
@RequestMapping(value = "/conf.do")
public class ConfluenceController {
	@Resource
	private ConfluenceService cs;

	@RequestMapping(params = "method=get")
	public String getCompanyQuery() {
		return "conf/confuence";
	}

	// 全部查询
	@RequestMapping(params = "method=getConfluence")
	public @ResponseBody
	Map getCompany(String rows, String page, String direction, String fee_date,
			String dd

	) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}

		List<Confluence> list = cs.getConfluence((page1 - 1) * rows1, rows1,
				direction, fee_date, dd);

		int count = cs.getConfluenceInfo(direction, fee_date, dd);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	/**
	 * 
	 * 明细表
	 */
	@RequestMapping(params = "method=gets")
	public String getDetaileds() {
		return "conf/mingxi";
	}

	@RequestMapping(params = "method=deleteCompany")
	public @ResponseBody
	Json deleteCompany(String[] del) {
		Json json = new Json();
		//System.out.println(del + "==================");
		int truck = cs.deleteMingxi(del);
		if (truck > 0) {
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}

	// 全部查询
	@RequestMapping(params = "method=getMingxi")
	public @ResponseBody
	Map getDetailedsInfo(String rows, String page, String direction ) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		System.out.println(direction +"sdsdsf");
		List<Mingxi> list = cs.getMingxi((page1 - 1) * rows1, rows1, direction );
		for (Mingxi mingxi : list) {
		    if ("应付中转费核销".equals(mingxi.getSubject())) {
		    	mingxi.setCom_car_name(mingxi.getCompany_name());
		    	//System.out.println("应付中转费核销");
			} else if ("应付送货费核销".equals(mingxi.getSubject())) {
				mingxi.setCom_car_name(mingxi.getCar_name());
				//System.out.println("司机姓名");
			}else if ("收入".equals(direction)) {
				mingxi.setCom_car_name("");
			}
		}
		int count = cs.getMingxiInfo(direction );
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 全部查询
	@RequestMapping(params = "method=selectConf")
	public @ResponseBody
	Map selectConf(String rows, String page, String direction) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 10;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		if(direction.equals("1") ) {
			direction ="支出";
		} else if (direction.equals("2")){
			direction ="收入";
		}
		List<Mingxi> list = cs.selectConf((page1 - 1) * rows1, rows1, direction);
		for (Mingxi mingxi : list) {
		    if ("应付中转费核销".equals(mingxi.getSubject())) {
		    	mingxi.setCom_car_name(mingxi.getCompany_name());
		    	//System.out.println("应付中转费核销");
			} else if ("应付送货费核销".equals(mingxi.getSubject())) {
				mingxi.setCom_car_name(mingxi.getCar_name());
				//System.out.println("司机姓名");
			}else if ("收入".equals(direction)) {
				mingxi.setCom_car_name("");
			}
		}
		int count = cs.selectConfInfo(direction);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	
	
	// 全部查询
		@RequestMapping(params = "method=selectSour")
		public @ResponseBody
		Map selectSour(String rows, String page, String source) {
			Integer rows1 = 0;// 当前有几行
			Integer page1 = 10;// 当前有几页
			
			if (rows != null && !"".equals(rows)) {
				rows1 = Integer.parseInt(rows);
			}
			if (page != null && !"".equals(page)) {
				page1 = Integer.parseInt(page);
			}
			if(source.equals("1") ) {
				source ="支出";
			} else if (source.equals("2")){
				source ="收入";
			}
		
			List<Mingxi> list = cs.selectSour((page1 - 1) * rows1, rows1, source);
			for (Mingxi mingxi : list) {
			    if ("应付中转费核销".equals(mingxi.getSubject())) {
			    	mingxi.setCom_car_name(mingxi.getCompany_name());
			    	//、、System.out.println("应付中转费核销");
				} else if ("应付送货费核销".equals(mingxi.getSubject())) {
					mingxi.setCom_car_name(mingxi.getCar_name());
					//System.out.println("司机姓名");
				}else if ("收入".equals(source)) {
					mingxi.setCom_car_name("");
				}
			}
			int count = cs.selectSourInfo(source);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("total", count);
			map.put("rows", list);
			return map;
		}
	
	

		// 全部查询
			@RequestMapping(params = "method=moneyxianjin")
			public @ResponseBody
			Map moneyxianjin(String rows, String page, String subject_three) {
				Integer rows1 = 0;// 当前有几行
				Integer page1 = 10;// 当前有几页
				
				if (rows != null && !"".equals(rows)) {
					rows1 = Integer.parseInt(rows);
				}
				if (page != null && !"".equals(page)) {
					page1 = Integer.parseInt(page);
				}
				
				if(subject_three.equals("1") ) {
					subject_three ="支出";
				} else if (subject_three.equals("2")){
					subject_three ="收入";
				}
				//System.out.println(subject_three+"==========================");
				List<Mingxi> list = cs.moneyxianjin((page1 - 1) * rows1, rows1, subject_three);
				for (Mingxi mingxi : list) {
				    if ("应付中转费核销".equals(mingxi.getSubject())) {
				    	mingxi.setCom_car_name(mingxi.getCompany_name());
				    	//System.out.println("应付中转费核销");
					} else if ("应付送货费核销".equals(mingxi.getSubject())) {
						mingxi.setCom_car_name(mingxi.getCar_name());
						//System.out.println("司机姓名");
					}else if ("收入".equals(subject_three)) {
						mingxi.setCom_car_name("");
					}
				}
				int count = cs.moneyxianjinInfo(subject_three);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total", count);
				map.put("rows", list);
				return map;
			}
			// 全部查询
			@RequestMapping(params = "method=moneydaka")
			public @ResponseBody
			Map moneydaka(String rows, String page, String subject_three) {
				Integer rows1 = 0;// 当前有几行
				Integer page1 = 10;// 当前有几页
				
				if (rows != null && !"".equals(rows)) {
					rows1 = Integer.parseInt(rows);
				}
				if (page != null && !"".equals(page)) {
					page1 = Integer.parseInt(page);
				}
				if(subject_three.equals("1") ) {
					subject_three ="支出";
				} else if (subject_three.equals("2")){
					subject_three ="收入";
				}
				List<Mingxi> list = cs.moneydaka((page1 - 1) * rows1, rows1, subject_three);
				for (Mingxi mingxi : list) {
				    if ("应付中转费核销".equals(mingxi.getSubject())) {
				    	mingxi.setCom_car_name(mingxi.getCompany_name());
				    	//System.out.println("应付中转费核销");
					} else if ("应付送货费核销".equals(mingxi.getSubject())) {
						mingxi.setCom_car_name(mingxi.getCar_name());
						//System.out.println("司机姓名");
					}else if ("收入".equals(subject_three)) {
						mingxi.setCom_car_name("");
					}
				}
				int count = cs.moneydakaInfo(subject_three);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("total", count);
				map.put("rows", list);
				return map;
			}
			
			
			// 全部查询
						@RequestMapping(params = "method=shoudong")
						public @ResponseBody
						Map shoudong(String rows, String page, String subject_three) {
							Integer rows1 = 0;// 当前有几行
							Integer page1 = 10;// 当前有几页
							
							if (rows != null && !"".equals(rows)) {
								rows1 = Integer.parseInt(rows);
							}
							if (page != null && !"".equals(page)) {
								page1 = Integer.parseInt(page);
							}
							if(subject_three.equals("1") ) {
								subject_three ="支出";
							} else if (subject_three.equals("2")){
								subject_three ="收入";
							}
							List<Mingxi> list = cs.shoudong((page1 - 1) * rows1, rows1, subject_three);
							for (Mingxi mingxi : list) {
							    if ("应付中转费核销".equals(mingxi.getSubject())) {
							    	mingxi.setCom_car_name(mingxi.getCompany_name());
							    	//System.out.println("应付中转费核销");
								} else if ("应付送货费核销".equals(mingxi.getSubject())) {
									mingxi.setCom_car_name(mingxi.getCar_name());
									//System.out.println("司机姓名");
								}else if ("收入".equals(subject_three)) {
									mingxi.setCom_car_name("");
								}
							}
							int count = cs.shoudongInfo(subject_three);
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("total", count);
							map.put("rows", list);
							return map;
						}
}