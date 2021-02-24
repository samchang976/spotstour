package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;



//@Entity
@Table(name="shoppingcart")
public class ShoppingCartBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer scId;	
	private String mId;
	private Integer itemid;
	private Integer sOrdQty;
 	@OneToOne(mappedBy = "shoppingCart")
 	private MemberBean member;
 	
 	@OneToMany(cascade= { CascadeType.PERSIST})
    @JoinColumn(name="itemId", referencedColumnName="scId", nullable = true)    
    private Set<ItemBean> item = new LinkedHashSet<>();

	public Integer getScId() {
		return scId;
	}

	public void setScId(Integer scId) {
		this.scId = scId;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public Integer getsOrdQty() {
		return sOrdQty;
	}

	public void setsOrdQty(Integer sOrdQty) {
		this.sOrdQty = sOrdQty;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public Set<ItemBean> getItem() {
		return item;
	}

	public void setItem(Set<ItemBean> item) {
		this.item = item;
	}

	public ShoppingCartBean(Integer scId, String mId, Integer itemid, Integer sOrdQty, MemberBean member,
			Set<ItemBean> item) {
		super();
		this.scId = scId;
		this.mId = mId;
		this.itemid = itemid;
		this.sOrdQty = sOrdQty;
		this.member = member;
		this.item = item;
	}
	
 	
}
