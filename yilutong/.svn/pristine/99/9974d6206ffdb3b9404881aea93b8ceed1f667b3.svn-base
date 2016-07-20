package com.jy.quartz;

import javax.annotation.Resource;

import com.jy.service.DataSetService;

public class CheckData {
	@Resource
	private DataSetService dataSetService;

	public void checkdata() {
		try {
			int weeknum = dataSetService.checkweekdata();
			if (weeknum > 1000000) {// 100w
				int imnum = dataSetService.insertmon();// 复制week表数据到mon表
				if (imnum > 0) {// 复制成功
					System.out.println("复制了" + imnum);
					int dwmnum = dataSetService.deleteweek();// 删除操作
					System.out.println("删除了" + dwmnum);
				} else {
					System.out.println("复制week到mon失败，数据未删除");
				}
			}

			int monnum = dataSetService.checkmondata();
			if (monnum > 1000000) {// 100w
				int omnum = dataSetService.insertold();// 复制week表数据到mon表
				if (omnum > 0) {// 复制成功
					System.out.println("复制了" + omnum);
					int dmmnum = dataSetService.deletemon();// 删除操作
					System.out.println("删除了" + dmmnum);
				} else {
					System.out.println("复制week到old失败，数据未删除");
				}
			}
			// int oldnum=dataSetService.checkolddata();//查询old表的数据量
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("系统异常！CheckData触发器！");
		}
	}
}
