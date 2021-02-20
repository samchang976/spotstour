package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@Entity
@Table(name="item_type")
public class Item_typeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer itId ;
	private String itemType;
	
	@OneToMany(mappedBy = "item_typeBean", cascade = CascadeType.ALL)
	private Set<ItemBean> items = new LinkedHashSet<>();
	
	public Item_typeBean() {
	}

	public Item_typeBean(Integer itId, String itemType) {
		this.itId = itId;
		this.itemType = itemType;
	}

	public Integer getItId() {
		return itId;
	}

	public void setItId(Integer itId) {
		this.itId = itId;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public Set<ItemBean> getItems() {
		return items;
	}

	public void setItems(Set<ItemBean> items) {
		this.items = items;
	}
}