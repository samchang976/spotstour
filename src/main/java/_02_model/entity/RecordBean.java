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
	private Integer mId;

	
	@ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH})
	@JoinColumn(name = "paramId")
	private ParamsBean paramsBean;
	
	@ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH})
	@JoinColumn(name = "portfolioId")
	private PortfolioBean portfolioBean;

	
	
	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}

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
