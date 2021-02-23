package _02_model.entity;

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

@Entity
@Table(name="item")
public class ItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itemId;
	private String itemHeader;
	private Integer itemPrice;
	private Integer itemQty;
	private String itemDes;
	private String itemPic1;
	private String itemPic2;
	private String itemPic3;
	
	@Transient
	private Integer itId;
	
	@Transient
	private Integer countryId;
	
//	@ManyToOne(cascade = CascadeType.PERSIST)
//	@JoinColumn(name = "countryId")
	private CountryBean countryBean;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "itId")
	private Item_typeBean item_typeBean;

	public ItemBean() {
		super();
	}

	public ItemBean(Integer itemId, String itemHeader, Integer itemPrice, Integer itemQty, String itemDes,
			String itemPic1, String itemPic2, String itemPic3, Integer itId, Integer countryId, CountryBean countryBean,
			Item_typeBean item_typeBean) {
		super();
		this.itemId = itemId;
		this.itemHeader = itemHeader;
		this.itemPrice = itemPrice;
		this.itemQty = itemQty;
		this.itemDes = itemDes;
		this.itemPic1 = itemPic1;
		this.itemPic2 = itemPic2;
		this.itemPic3 = itemPic3;
		this.itId = itId;
		this.countryId = countryId;
		this.countryBean = countryBean;
		this.item_typeBean = item_typeBean;
	}

	public String getItemPic1() {
		return itemPic1;
	}

	public void setItemPic1(String itemPic1) {
		this.itemPic1 = itemPic1;
	}
	public String getItemPic2() {
		return itemPic2;
	}

	public void setItemPic2(String itemPic2) {
		this.itemPic2 = itemPic2;
	}

	public String getItemPic3() {
		return itemPic3;
	}

	public void setItemPic3(String itemPic3) {
		this.itemPic3 = itemPic3;
	}

	public Integer getItId() {
		return itId;
	}

	public void setItId(Integer itId) {
		this.itId = itId;
	}

	public Integer getCountryId() {
		return countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	public CountryBean getCountryBean() {
		return countryBean;
	}

	public void setCountryBean(CountryBean countryBean) {
		this.countryBean = countryBean;
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

	public Item_typeBean getItem_typeBean() {
		return item_typeBean;
	}

	public void setItem_typeBean(Item_typeBean item_typeBean) {
		this.item_typeBean = item_typeBean;
	}
}
