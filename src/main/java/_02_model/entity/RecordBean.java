package _02_model.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="record")
public class RecordBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer recordId;

	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "paramId")
	private ParamsBean paramsBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "portfolioId")
	private PortfolioBean portfolioBean;

	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public ParamsBean getParamsBean() {
		return paramsBean;
	}

	public void setParamsBean(ParamsBean paramsBean) {
		this.paramsBean = paramsBean;
	}

	public PortfolioBean getPortfolioBean() {
		return portfolioBean;
	}

	public void setPortfolioBean(PortfolioBean portfolioBean) {
		this.portfolioBean = portfolioBean;
	}




	
}
