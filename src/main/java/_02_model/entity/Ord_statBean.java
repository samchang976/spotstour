package _02_model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ord_stat")
public class Ord_statBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer oSid;
	private String ordStat;

	@OneToMany(mappedBy = "ordStatBean" , cascade = CascadeType.ALL)
	private List<OrdBean> ordBeans;

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

	public List<OrdBean> getOrdBeans() {
		return ordBeans;
	}

	public void setOrdBeans(List<OrdBean> ordBeans) {
		this.ordBeans = ordBeans;
	}
	
}
