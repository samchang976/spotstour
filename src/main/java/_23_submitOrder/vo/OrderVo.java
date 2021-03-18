package _23_submitOrder.vo;

import java.sql.Timestamp;

public class OrderVo {
	
	//接取畫面表單準備的Bean
	private Integer mId;
	private String mName;	
	private String d_mAddress;	
	private String mEmail;	
	private String mUid;
	private String mPhone;
	private String s_mAddress;
	private String mGender;
	
	private Integer ord_Id;	
	private Integer ord_dId;
	private Integer ordQty; 
	private Integer oSid = 1;
	private String ordStat;
	private Integer receiptTypeId;
 	private String receiptType;
 	private Integer shipTypeId;
	private String shipType;
	private Integer paymentTypeId;
	private String paymentType;
	
	private int countryId;
	private String countryName;
	private Integer itemId;
	private String itemHeader;
	private Integer itemPrice;
	private Integer sc_Id;
	private Integer s_ordQty;
	private Timestamp s_createTime;
	private Timestamp o_createTime;
//	private Integer shipTypeTId;
//	private Integer receiptTypeTId;
//	private Integer oSTid;
	
	
	
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public Integer getPaymentTypeId() {
		return paymentTypeId;
	}
	public void setPaymentTypeId(Integer paymentTypeId) {
		if(paymentTypeId == 1) {
			this.paymentType = "貨到付款";
		}else if(paymentTypeId == 2) {
			this.paymentType = "超商取貨付款";
		}
		this.paymentTypeId = paymentTypeId;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
//	public Integer getShipTypeTId() {
//		return shipTypeTId;
//	}
//	public void setShipTypeTId(Integer shipTypeTId) {
//		this.shipTypeTId = shipTypeTId;
//	}
//	public Integer getReceiptTypeTId() {
//		return receiptTypeTId;
//	}
//	public void setReceiptTypeTId(Integer receiptTypeTId) {
//		this.receiptTypeTId = receiptTypeTId;
//	}
//	public Integer getoSTid() {
//		return oSTid;
//	}
//	public void setoSTid(Integer oSTid) {
//		this.oSTid = oSTid;
//	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getD_mAddress() {
		return d_mAddress;
	}
	public void setD_mAddress(String d_mAddress) {
		this.d_mAddress = d_mAddress;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmUid() {
		return mUid;
	}
	public void setmUid(String mUid) {
		this.mUid = mUid;
	}
	public String getS_mAddress() {
		return s_mAddress;
	}
	public void setS_mAddress(String s_mAddress) {
		this.s_mAddress = s_mAddress;
	}
	public Integer getOrd_Id() {
		return ord_Id;
	}
	public void setOrd_Id(Integer ord_Id) {
		this.ord_Id = ord_Id;
	}
	public Integer getOrd_dId() {
		return ord_dId;
	}
	public void setOrd_dId(Integer ord_dId) {
		this.ord_dId = ord_dId;
	}
	public Integer getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(Integer ordQty) {
		this.ordQty = ordQty;
	}
	public Integer getoSid() {
		return oSid;
	}
	public void setoSid(Integer oSid) {
		this.oSid = oSid;
	}
	public String getOrdStat() {
		return ordStat;
	}
	public void setOrdStat(String ordStat) {
		this.ordStat = ordStat;
	}
	public Integer getReceiptTypeId() {
		return receiptTypeId;
	}
	public void setReceiptTypeId(Integer receiptTypeId) {
		this.receiptTypeId = receiptTypeId;
	}
	public String getReceiptType() {
		return receiptType;
	}
	public void setReceiptType(String receiptType) {
		this.receiptType = receiptType;
	}
	public Integer getShipTypeId() {
		return shipTypeId;
	}
	public void setShipTypeId(Integer shipTypeId) {
		this.shipTypeId = shipTypeId;
	}
	public String getShipType() {
		return shipType;
	}
	public void setShipType(String shipType) {
		this.shipType = shipType;
	}
	public int getCountryId() {
		return countryId;
	}
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemHeader() {
		return itemHeader;
	}
	public void setItemHeader(String itemHeader) {
		this.itemHeader = itemHeader;
	}
	public Integer getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Integer getSc_Id() {
		return sc_Id;
	}
	public void setSc_Id(Integer sc_Id) {
		this.sc_Id = sc_Id;
	}
	public Integer getS_ordQty() {
		return s_ordQty;
	}
	public void setS_ordQty(Integer s_ordQty) {
		this.s_ordQty = s_ordQty;
	}
	public Timestamp getS_createTime() {
		return s_createTime;
	}
	public void setS_createTime(Timestamp s_createTime) {
		this.s_createTime = s_createTime;
	}
	public Timestamp getO_createTime() {
		return o_createTime;
	}
	public void setO_createTime(Timestamp o_createTime) {
		this.o_createTime = o_createTime;
	}
}
