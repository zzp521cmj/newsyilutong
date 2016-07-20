package com.jy.service;

import java.util.List;

import com.jy.model.Monitor;
import com.jy.model.Truck;
/**
 * 2015年7月13日 11:39:23
 * 
 * @author hqh
 * 数据操作service
 * 
 */
public interface DataHandlingService {
  List<Monitor>getData();//获取所有临时表的数据--表数据来自接口（九通）
  List<Truck>getcarlist();//获取所有车辆的车牌号和id
  String getcaridfromno(String carno);//未使用
  int savecarsinfo(List<Monitor>mlist);//保存临时表数据到全图监控的week表中
  int deletelscarsinfo();//删除临时表数据
  int selectcarsinfocount();//查询week数据量
  int deletelmdcarsinfo(List<String> carnos);//删除jy_monitor_data表数据
  int savecarlminfo(List<Monitor>monitorList);//保存临时表数据到全图监控的表中
}
