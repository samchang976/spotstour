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
@Table(name="porfoliomsg")
public class Porfolio_MsgBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "portfolioMsgId", unique = true, nullable = false)
	private Integer portfolioMsgId;
	@Column(name = "portfolioId")
	private Integer portfolioId;
	private String msgText;
	private Timestamp pm_createTime;     
	private String pMsg_freeze;
	
	@ManyToOne 
	@JoinColumn(name="portfolioId", nullable=false)  
	private PorfolioBean porfolios;

	public Integer getPortfolioMsgId() {
		return portfolioMsgId;
	}

	public void setPortfolioMsgId(Integer portfolioMsgId) {
		this.portfolioMsgId = portfolioMsgId;
	}

	public Integer getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
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

	public PorfolioBean getPorfolios() {
		return porfolios;
	}

	public void setPorfolios(PorfolioBean porfolios) {
		this.porfolios = porfolios;
	}

	public Porfolio_MsgBean(Integer portfolioMsgId, Integer portfolioId, String msgText, Timestamp pm_createTime,
			String pMsg_freeze, PorfolioBean porfolios) {
		super();
		this.portfolioMsgId = portfolioMsgId;
		this.portfolioId = portfolioId;
		this.msgText = msgText;
		this.pm_createTime = pm_createTime;
		this.pMsg_freeze = pMsg_freeze;
		this.porfolios = porfolios;
	}
	
	
}
