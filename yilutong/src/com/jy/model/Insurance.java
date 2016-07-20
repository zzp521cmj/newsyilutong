package com.jy.model;

import java.math.BigDecimal;
/**
 * 保险信息
 *@author lx
 */
public class Insurance {
		private String insuranceId;
		
	 	private String travelCardId;//行驶证ID

	    private String insured;//被保险人
	    
	    private String insurer;//保险人

	    private String insuredCard;//被保险人身份证号码（组织机构代码）

	    private String plateNumber;//被保险机动车号牌号码
	 	
	 	private BigDecimal premiumAmountCompulsory;//保费金额（交强险）
	 	private String jiaoqiangstart;//保费金额（交强险）开始时间
	 	private String jiaoqiangend;//保费金额（交强险）结束时间
	    private String insurancePeriodCompulsory;//保险期间（交强险）

	    private BigDecimal carTax;//代收车船税（交强险）

	    private String insuranceNumberCompulsory;//保险单单号（交强险）

	    private String insuranceCategory;//承保险别（商业险）

	    private BigDecimal premiumAmountBusiness;//保险金额（商业险）

	    private BigDecimal signPremium;//签单保费（商业险）

	    private BigDecimal signPremiumTotal;//签单保费合计（商业险）
	    private String shangyestart;//保险期间（商业险）开始时间
	    private String shangyeend;//保险期间（商业险）结束时间
	    private String insurancePeriodBusiness;//保险期间（商业险）

	    private String insuranceNumberBusiness;//保险单单号（商业险）

	    private BigDecimal premiumAmountCargo;//保费金额（货物险）
	    private String huowustart;//保险期间（货物险）开始时间
	    private String huowuend;//保险期间(货物险) 结束时间
	    private String insurancePeriodCargo;//保险期间（货物险）

	    private String insuranceNumberCargo;//保险单单号（货物险）
	    
	    private String addDate;//新增时间
	    
	    
	    
		public String getJiaoqiangstart() {
			return jiaoqiangstart;
		}

		public void setJiaoqiangstart(String jiaoqiangstart) {
			this.jiaoqiangstart = jiaoqiangstart;
		}

		public String getJiaoqiangend() {
			return jiaoqiangend;
		}

		public void setJiaoqiangend(String jiaoqiangend) {
			this.jiaoqiangend = jiaoqiangend;
		}

		public String getShangyestart() {
			return shangyestart;
		}

		public void setShangyestart(String shangyestart) {
			this.shangyestart = shangyestart;
		}

		public String getShangyeend() {
			return shangyeend;
		}

		public void setShangyeend(String shangyeend) {
			this.shangyeend = shangyeend;
		}

		public String getHuowustart() {
			return huowustart;
		}

		public void setHuowustart(String huowustart) {
			this.huowustart = huowustart;
		}

		public String getHuowuend() {
			return huowuend;
		}

		public void setHuowuend(String huowuend) {
			this.huowuend = huowuend;
		}

		public String getAddDate() {
			if(addDate!=null){
				addDate=addDate.substring(0,19);
			}
			return addDate;
		}

		public void setAddDate(String addDate) {
			this.addDate = addDate;
		}

		public String getInsuranceId() {
			return insuranceId;
		}

		public void setInsuranceId(String insuranceId) {
			this.insuranceId = insuranceId;
		}

		public String getTravelCardId() {
			return travelCardId;
		}

		public void setTravelCardId(String travelCardId) {
			this.travelCardId = travelCardId;
		}

		public String getInsured() {
			return insured;
		}

		public void setInsured(String insured) {
			this.insured = insured;
		}

		public String getInsurer() {
			return insurer;
		}

		public void setInsurer(String insurer) {
			this.insurer = insurer;
		}

		public String getInsuredCard() {
			return insuredCard;
		}

		public void setInsuredCard(String insuredCard) {
			this.insuredCard = insuredCard;
		}

		public String getPlateNumber() {
			return plateNumber;
		}

		public void setPlateNumber(String plateNumber) {
			this.plateNumber = plateNumber;
		}

		public BigDecimal getPremiumAmountCompulsory() {
			return premiumAmountCompulsory;
		}

		public void setPremiumAmountCompulsory(BigDecimal premiumAmountCompulsory) {
			this.premiumAmountCompulsory = premiumAmountCompulsory;
		}

		public String getInsurancePeriodCompulsory() {
			return insurancePeriodCompulsory;
		}

		public void setInsurancePeriodCompulsory(String insurancePeriodCompulsory) {
			this.insurancePeriodCompulsory = insurancePeriodCompulsory;
		}

		public BigDecimal getCarTax() {
			return carTax;
		}

		public void setCarTax(BigDecimal carTax) {
			this.carTax = carTax;
		}

		public String getInsuranceNumberCompulsory() {
			return insuranceNumberCompulsory;
		}

		public void setInsuranceNumberCompulsory(String insuranceNumberCompulsory) {
			this.insuranceNumberCompulsory = insuranceNumberCompulsory;
		}

		public String getInsuranceCategory() {
			return insuranceCategory;
		}

		public void setInsuranceCategory(String insuranceCategory) {
			this.insuranceCategory = insuranceCategory;
		}

		public BigDecimal getPremiumAmountBusiness() {
			return premiumAmountBusiness;
		}

		public void setPremiumAmountBusiness(BigDecimal premiumAmountBusiness) {
			this.premiumAmountBusiness = premiumAmountBusiness;
		}

		public BigDecimal getSignPremium() {
			return signPremium;
		}

		public void setSignPremium(BigDecimal signPremium) {
			this.signPremium = signPremium;
		}

		public BigDecimal getSignPremiumTotal() {
			return signPremiumTotal;
		}

		public void setSignPremiumTotal(BigDecimal signPremiumTotal) {
			this.signPremiumTotal = signPremiumTotal;
		}

		public String getInsurancePeriodBusiness() {
			return insurancePeriodBusiness;
		}

		public void setInsurancePeriodBusiness(String insurancePeriodBusiness) {
			this.insurancePeriodBusiness = insurancePeriodBusiness;
		}

		public String getInsuranceNumberBusiness() {
			return insuranceNumberBusiness;
		}

		public void setInsuranceNumberBusiness(String insuranceNumberBusiness) {
			this.insuranceNumberBusiness = insuranceNumberBusiness;
		}

		public BigDecimal getPremiumAmountCargo() {
			return premiumAmountCargo;
		}

		public void setPremiumAmountCargo(BigDecimal premiumAmountCargo) {
			this.premiumAmountCargo = premiumAmountCargo;
		}

		public String getInsurancePeriodCargo() {
			return insurancePeriodCargo;
		}

		public void setInsurancePeriodCargo(String insurancePeriodCargo) {
			this.insurancePeriodCargo = insurancePeriodCargo;
		}

		public String getInsuranceNumberCargo() {
			return insuranceNumberCargo;
		}

		public void setInsuranceNumberCargo(String insuranceNumberCargo) {
			this.insuranceNumberCargo = insuranceNumberCargo;
		}
	    
}
