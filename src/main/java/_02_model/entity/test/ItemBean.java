package _02_model.entity.test;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

//@Entity
@Table(name="Item")
public class ItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemId;
	private String itemHeader;
	private Integer itemPrice;
	private Integer itemQty;
	private String itemDes;
	
	@Transient
	private Integer item_typeId;
	
	//@ManyToOne(cascade=CascadeType.ALL)
	private String countryId;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="itId")
	private Item_typeBean item_typeBean;

	public ItemBean() {
		super();
	}

	public ItemBean(Integer itemId, String itemHeader, Integer itemPrice, Integer itemQty, String itemDes,
			String countryId, Integer item_typeId) {
		super();
		this.itemId = itemId;
		this.itemHeader = itemHeader;
		this.itemPrice = itemPrice;
		this.itemQty = itemQty;
		this.itemDes = itemDes;
		this.countryId = countryId;
		this.item_typeId = item_typeId;
	}

	
	public Integer getItem_typeId() {
		return item_typeId;
	}

	public void setItem_typeId(Integer item_typeId) {
		this.item_typeId = item_typeId;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemHeader() {
		return itemHeader;
	}

	public void setItemHeader(String itemHeader) {
		this.itemHeader = itemHeader;
	}

	public Integer getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Integer itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Integer getItemQty() {
		return itemQty;
	}

	public void setItemQty(Integer itemQty) {
		this.itemQty = itemQty;
	}

	public String getItemDes() {
		return itemDes;
	}

	public void setItemDes(String itemDes) {
		this.itemDes = itemDes;
	}

	public String getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public Item_typeBean getItem_typeBean() {
		return item_typeBean;
	}

	public void setItem_typeBean(Item_typeBean item_typeBean) {
		this.item_typeBean = item_typeBean;
	}
	
	
}
