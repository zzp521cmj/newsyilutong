package com.jy.model;

import java.util.Date;
/**
 * 二级维护卡
 * @author lx
 */
public class CarMaintenance {
    private String secondaryMaintenanceCardId;//二级维护卡ID
    
    private String travelCardId;//行驶证ID

    private String maintenanceDate;//维护日期

    private String nextMaintenanceDate;//下次维护日期
    
    private String departmentSeal;//管理部门章
    

    public String getTravelCardId() {
		return travelCardId;
	}

	public void setTravelCardId(String travelCardId) {
		this.travelCardId = travelCardId;
	}

	public String getSecondaryMaintenanceCardId() {
        return secondaryMaintenanceCardId;
    }

    public void setSecondaryMaintenanceCardId(String secondaryMaintenanceCardId) {
        this.secondaryMaintenanceCardId = secondaryMaintenanceCardId == null ? null : secondaryMaintenanceCardId.trim();
    }


    public String getMaintenanceDate() {
		return maintenanceDate;
	}

	public void setMaintenanceDate(String maintenanceDate) {
		this.maintenanceDate = maintenanceDate;
	}




	public String getNextMaintenanceDate() {
		return nextMaintenanceDate;
	}

	public void setNextMaintenanceDate(String nextMaintenanceDate) {
		this.nextMaintenanceDate = nextMaintenanceDate;
	}

	public String getDepartmentSeal() {
        return departmentSeal;
    }

    public void setDepartmentSeal(String departmentSeal) {
        this.departmentSeal = departmentSeal == null ? null : departmentSeal.trim();
    }
}