package _02_model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ship_Type")
public class Ship_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shipTypeId;
	private String shipType;
	
	@OneToMany(mappedBy = "shipTypeBean" , cascade = CascadeType.ALL)
	private List<OrdBean> ordBeans;

	public Integer getShipTypeId() {
		return shipTypeId;
	}

	public void setShipTypeId(Integer shipTypeId) {
		this.shipTypeId = shipTypeId;
	}

	public String getShipType() {
		return shipType;
	}

	public void setShipType(String shipType) {
		this.shipType = shipType;
	}

	public List<OrdBean> getOrdBeans() {
		return ordBeans;
	}

	public void setOrdBeans(List<OrdBean> ordBeans) {
		this.ordBeans = ordBeans;
	}
	
}
