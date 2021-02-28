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
@Table(name="watch_times")
public class Watch_timesBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer viewsId;
	private Timestamp wt_createTime;
	
	@ManyToOne  
	@JoinColumn(name="portfolioId")  
	private PortfolioBean portfolioBean;

	public Integer getViewsId() {
		return viewsId;
	}

	public void setViewsId(Integer viewsId) {
		this.viewsId = viewsId;
	}

	public Timestamp getWt_createTime() {
		return wt_createTime;
	}

	public void setWt_createTime(Timestamp wt_createTime) {
		this.wt_createTime = wt_createTime;
	}

	public PortfolioBean getPortfolioBean() {
		return portfolioBean;
	}

	public void setPortfolioBean(PortfolioBean portfolioBean) {
		this.portfolioBean = portfolioBean;
	}

		
	
}
