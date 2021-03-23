package _02_model.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="portfoliomsg")
public class Portfolio_MsgBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private Integer portfolioMsgId;
	private String msgText;
	private Timestamp pm_createTime;     
	private Integer pmsg_freeze;
	private Integer mId;
	
	@ManyToOne 
	@JoinColumn(name="portfolioId", nullable=false)  
	private PortfolioBean portfolioBean;
	
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

	public Integer getPmsg_freeze() {
		return pmsg_freeze;
	}

	public void setPmsg_freeze(Integer pmsg_freeze) {
		this.pmsg_freeze = pmsg_freeze;
	}

	public PortfolioBean getPortfolioBean() {
		return portfolioBean;
	}

	public void setPortfolioBean(PortfolioBean portfolioBean) {
		this.portfolioBean = portfolioBean;
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}


	
}
