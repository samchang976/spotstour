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

//@Entity
@Table(name="orddetail")
public class Ord_detailBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ord_dId;
	Integer ordQty; 
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "itemId")
	private ItemBean itemBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ordId")
	private OrdBean ordBean;

	public Ord_detailBean() {
		super();
	}

	public Ord_detailBean(Integer ord_dId, Integer ordQty, ItemBean itemBean, OrdBean ordBean) {
		super();
		this.ord_dId = ord_dId;
		this.ordQty = ordQty;
		this.itemBean = itemBean;
		this.ordBean = ordBean;
	}

	public ItemBean getItemBean() {
		return itemBean;
	}

	public void setItemBean(ItemBean itemBean) {
		this.itemBean = itemBean;
	}

	public OrdBean getOrdBean() {
		return ordBean;
	}

	public void setOrdBean(OrdBean ordBean) {
		this.ordBean = ordBean;
	}

	public Integer getOrd_dId() {
		return ord_dId;
	}

	public void setOrd_dId(Integer ord_dId) {
		this.ord_dId = ord_dId;
	}


	public Integer getOrdQty() {
		return ordQty;
	}

	public void setOrdQty(Integer ordQty) {
		this.ordQty = ordQty;
	}

}
