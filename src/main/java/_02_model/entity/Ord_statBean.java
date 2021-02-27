package _02_model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ord_stat")
public class Ord_statBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "oSid", unique = true, nullable = false)
	private Integer oSid;
	private String ordStat;
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
	public Ord_statBean(Integer oSid, String ordStat) {
		super();
		this.oSid = oSid;
		this.ordStat = ordStat;
	}

}
