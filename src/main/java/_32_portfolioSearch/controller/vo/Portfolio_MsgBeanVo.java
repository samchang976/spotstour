package _32_portfolioSearch.controller.vo;

import java.sql.Timestamp;

public class Portfolio_MsgBeanVo {
	private Integer portfolioMsgId;
	private String msgText;
	private Timestamp pm_createTime;     
	private String pMsg_freeze;
 	private Integer portfolioId;
	private Integer mId;
	private String portfolioName;
 	
	public Integer getPortfolioMsgId() {
		return portfolioMsgId;
	}
	public void setPortfolioMsgId(Integer portfolioMsgId) {
		this.portfolioMsgId = portfolioMsgId;
	}
	public String getMsgText() {
		return msgText;
	}
	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}
	public Timestamp getPm_createTime() {
		return pm_createTime;
	}
	public void setPm_createTime(Timestamp pm_createTime) {
		this.pm_createTime = pm_createTime;
	}
	public String getpMsg_freeze() {
		return pMsg_freeze;
	}
	public void setpMsg_freeze(String pMsg_freeze) {
		this.pMsg_freeze = pMsg_freeze;
	}
	public Integer getPortfolioId() {
		return portfolioId;
	}
	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public String getPortfolioName() {
		return portfolioName;
	}
	public void setPortfolioName(String portfolioName) {
		this.portfolioName = portfolioName;
	}
 	
 	
}
