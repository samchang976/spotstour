package _02_model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ship_Type")
public class Ship_TypeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "shipTypeId", unique = true, nullable = false)
	private Integer shipTypeId;
	private String shipType;
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
	public Ship_TypeBean(Integer shipTypeId, String shipType) {
		super();
		this.shipTypeId = shipTypeId;
		this.shipType = shipType;
	}
	
 	
}
