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

//@Entity
@Table(name="watchtimes")
public class Watch_timesBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer viewsId;
	private Integer portfolioId;
	private Timestamp wt_createTime;
	
	@ManyToOne  
	@JoinColumn(name="portfolioId")  
	private PorfolioBean porfolio;

	public Integer getViewsId() {
		return viewsId;
	}

	public void setViewsId(Integer viewsId) {
		this.viewsId = viewsId;
	}

	public Integer getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}

	public Timestamp getWt_createTime() {
		return wt_createTime;
	}

	public void setWt_createTime(Timestamp wt_createTime) {
		this.wt_createTime = wt_createTime;
	}

	public PorfolioBean getPorfolio() {
		return porfolio;
	}

	public void setPorfolio(PorfolioBean porfolio) {
		this.porfolio = porfolio;
	}

	public Watch_timesBean(Integer viewsId, Integer portfolioId, Timestamp wt_createTime, PorfolioBean porfolio) {
		super();
		this.viewsId = viewsId;
		this.portfolioId = portfolioId;
		this.wt_createTime = wt_createTime;
		this.porfolio = porfolio;
	}
	
	
}
