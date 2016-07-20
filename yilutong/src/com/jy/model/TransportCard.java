package com.jy.model;

import java.util.Date;
/**
 * 道路运输证
 * @author lx
 */
public class TransportCard {
    private String roadTransportCardId;//道路运输证ID

    private String travelCardId;//行驶证ID
    
    private String roadTransportCardNumber;//道路运输证证号

    private String roadOwner;//业户名称

    private String roadAddress;//地址
    
    private String operatingLicenseNumber;//经营许可证号

    private String tonnage;//吨（座）位

    private Double carLength;//车长

    private Double carWidth;//车宽

    private Double carHeight;//车高

    private String businessScope;//经营范围

    private String transportCertificateDate;//发证日期

    private String issuingAuthorities;//核发机关

    private String records;//车辆审验及技术等级记录

    private String validityTerm;//有效期限

    public String getRoadTransportCardId() {
        return roadTransportCardId;
    }

    public void setRoadTransportCardId(String roadTransportCardId) {
        this.roadTransportCardId = roadTransportCardId == null ? null : roadTransportCardId.trim();
    }

    public String getRoadTransportCardNumber() {
        return roadTransportCardNumber;
    }

    public void setRoadTransportCardNumber(String roadTransportCardNumber) {
        this.roadTransportCardNumber = roadTransportCardNumber == null ? null : roadTransportCardNumber.trim();
    }

    public String getRoadOwner() {
        return roadOwner;
    }

    public void setRoadOwner(String roadOwner) {
        this.roadOwner = roadOwner == null ? null : roadOwner.trim();
    }

    public String getRoadAddress() {
        return roadAddress;
    }

    public void setRoadAddress(String roadAddress) {
        this.roadAddress = roadAddress == null ? null : roadAddress.trim();
    }

    public String getOperatingLicenseNumber() {
        return operatingLicenseNumber;
    }

    public void setOperatingLicenseNumber(String operatingLicenseNumber) {
        this.operatingLicenseNumber = operatingLicenseNumber == null ? null : operatingLicenseNumber.trim();
    }

    public String getTonnage() {
        return tonnage;
    }

    public void setTonnage(String tonnage) {
        this.tonnage = tonnage == null ? null : tonnage.trim();
    }

    public Double getCarLength() {
        return carLength;
    }

    public void setCarLength(Double carLength) {
        this.carLength = carLength;
    }

    public Double getCarWidth() {
        return carWidth;
    }

    public void setCarWidth(Double carWidth) {
        this.carWidth = carWidth;
    }

    public Double getCarHeight() {
        return carHeight;
    }

    public void setCarHeight(Double carHeight) {
        this.carHeight = carHeight;
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope == null ? null : businessScope.trim();
    }


    public String getTravelCardId() {
		return travelCardId;
	}

	public void setTravelCardId(String travelCardId) {
		this.travelCardId = travelCardId;
	}

	public String getTransportCertificateDate() {
		return transportCertificateDate;
	}

	public void setTransportCertificateDate(String transportCertificateDate) {
		this.transportCertificateDate = transportCertificateDate;
	}

	public String getIssuingAuthorities() {
        return issuingAuthorities;
    }

    public void setIssuingAuthorities(String issuingAuthorities) {
        this.issuingAuthorities = issuingAuthorities == null ? null : issuingAuthorities.trim();
    }

    public String getRecords() {
        return records;
    }

    public void setRecords(String records) {
        this.records = records == null ? null : records.trim();
    }

    public String getValidityTerm() {
        return validityTerm;
    }

    public void setValidityTerm(String validityTerm) {
        this.validityTerm = validityTerm == null ? null : validityTerm.trim();
    }
}