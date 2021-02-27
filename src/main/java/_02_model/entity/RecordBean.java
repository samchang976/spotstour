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
	@Column(name = "recordId", unique = true, nullable = false)	
	private Integer recordId;
	@Column(name = "portfolioId")
	private Integer portfolioId;
	@Column(name = "type")
	private String type;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "type")
	private ParamsBean paramsBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "portfolioId")
	private PorfolioBean porfolio;

	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public Integer getPortfolioId() {
		return portfolioId;
	}

	public void setPortfolioId(Integer portfolioId) {
		this.portfolioId = portfolioId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public ParamsBean getParams() {
		return paramsBean;
	}

	public void setParams(ParamsBean paramsBean) {
		this.paramsBean = paramsBean;
	}

	public PorfolioBean getPorfolio() {
		return porfolio;
	}

	public void setPorfolio(PorfolioBean porfolio) {
		this.porfolio = porfolio;
	}

	public RecordBean(Integer recordId, Integer portfolioId, String type, ParamsBean paramsBean, PorfolioBean porfolio) {
		super();
		this.recordId = recordId;
		this.portfolioId = portfolioId;
		this.type = type;
		this.paramsBean = paramsBean;
		this.porfolio = porfolio;
	}
	
	
}
