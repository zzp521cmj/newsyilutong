package com.jy.model;

import java.util.Date;
/**
 * 道路运输证
 * @author lx
 */
public class Registration {
    private String registrationCardId;//登记证ID

    private String travelCardId;//行驶证ID
    
    private String carOwner;//

    private String registrationAuthority;//登记机关

    private String registration_Date;//登记日期

    private String registrationNumber;//机动车登记编号

    private String carColor;//车身颜色

    private Integer made;//国产/进口

    private String engineModel;//发动机型号

    private String fuelType;//燃料种类

    private String carPower;//排量/功率

    private String manufacturerName;//制造厂名称

    private String turnForm;//转向形式

    private Double trackWidth;//轮距

    private Integer tiresNumber;//轮胎数

    private String tiresSpecifications;//轮胎规格

    private Integer steelSpringNumber;//钢板弹簧片数

    private Double wheelbase;//轴距

    private Integer hubNumber;//轴数

    private String carAccess;//车辆获得方式

    private String carManufacturedDate;//车辆出厂日期

    private String issuanceDate;//发证日期（注册登记）

    private String issuanceAuthority;//发证机关

    public String getRegistrationCardId() {
        return registrationCardId;
    }

    public void setRegistrationCardId(String registrationCardId) {
        this.registrationCardId = registrationCardId == null ? null : registrationCardId.trim();
    }

    public String getCarOwner() {
        return carOwner;
    }

    public void setCarOwner(String carOwner) {
        this.carOwner = carOwner == null ? null : carOwner.trim();
    }

    public String getRegistrationAuthority() {
        return registrationAuthority;
    }

    public void setRegistrationAuthority(String registrationAuthority) {
        this.registrationAuthority = registrationAuthority == null ? null : registrationAuthority.trim();
    }


    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber == null ? null : registrationNumber.trim();
    }

    public String getCarColor() {
        return carColor;
    }

    public void setCarColor(String carColor) {
        this.carColor = carColor == null ? null : carColor.trim();
    }

    public Integer getMade() {
        return made;
    }

    public void setMade(Integer made) {
        this.made = made;
    }

    public String getEngineModel() {
        return engineModel;
    }

    public void setEngineModel(String engineModel) {
        this.engineModel = engineModel == null ? null : engineModel.trim();
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType == null ? null : fuelType.trim();
    }

    public String getCarPower() {
        return carPower;
    }

    public void setCarPower(String carPower) {
        this.carPower = carPower == null ? null : carPower.trim();
    }

    public String getManufacturerName() {
        return manufacturerName;
    }

    public void setManufacturerName(String manufacturerName) {
        this.manufacturerName = manufacturerName == null ? null : manufacturerName.trim();
    }

    public String getTurnForm() {
        return turnForm;
    }

    public void setTurnForm(String turnForm) {
        this.turnForm = turnForm == null ? null : turnForm.trim();
    }

    public Double getTrackWidth() {
        return trackWidth;
    }

    public void setTrackWidth(Double trackWidth) {
        this.trackWidth = trackWidth;
    }

    public Integer getTiresNumber() {
        return tiresNumber;
    }

    public void setTiresNumber(Integer tiresNumber) {
        this.tiresNumber = tiresNumber;
    }

    public String getTiresSpecifications() {
        return tiresSpecifications;
    }

    public void setTiresSpecifications(String tiresSpecifications) {
        this.tiresSpecifications = tiresSpecifications == null ? null : tiresSpecifications.trim();
    }

    public Integer getSteelSpringNumber() {
        return steelSpringNumber;
    }

    public void setSteelSpringNumber(Integer steelSpringNumber) {
        this.steelSpringNumber = steelSpringNumber;
    }

    public Double getWheelbase() {
        return wheelbase;
    }

    public void setWheelbase(Double wheelbase) {
        this.wheelbase = wheelbase;
    }

    public Integer getHubNumber() {
        return hubNumber;
    }

    public void setHubNumber(Integer hubNumber) {
        this.hubNumber = hubNumber;
    }

    public String getCarAccess() {
        return carAccess;
    }

    public void setCarAccess(String carAccess) {
        this.carAccess = carAccess == null ? null : carAccess.trim();
    }

    public String getTravelCardId() {
		return travelCardId;
	}

	public void setTravelCardId(String travelCardId) {
		this.travelCardId = travelCardId;
	}



	public String getRegistration_Date() {
		return registration_Date;
	}

	public void setRegistration_Date(String registration_Date) {
		this.registration_Date = registration_Date;
	}

	public String getCarManufacturedDate() {
		return carManufacturedDate;
	}

	public void setCarManufacturedDate(String carManufacturedDate) {
		this.carManufacturedDate = carManufacturedDate;
	}

	public String getIssuanceDate() {
		return issuanceDate;
	}

	public void setIssuanceDate(String issuanceDate) {
		this.issuanceDate = issuanceDate;
	}

	public String getIssuanceAuthority() {
        return issuanceAuthority;
    }

    public void setIssuanceAuthority(String issuanceAuthority) {
        this.issuanceAuthority = issuanceAuthority == null ? null : issuanceAuthority.trim();
    }
}