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



@Entity
@Table(name="shoppingcart")
public class ShoppingCartBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer sc_Id;	
	private Integer s_ordQty;
 	@OneToOne(mappedBy = "mId")
 	private MemberBean memberBeans;
 	
 	@OneToMany(cascade= { CascadeType.PERSIST})
    @JoinColumn(name="itemId")    
    private Set<ItemBean> item = new LinkedHashSet<>();

	public Integer getSc_Id() {
		return sc_Id;
	}

	public void setSc_Id(Integer sc_Id) {
		this.sc_Id = sc_Id;
	}

	public Integer getS_ordQty() {
		return s_ordQty;
	}

	public void setS_ordQty(Integer s_ordQty) {
		this.s_ordQty = s_ordQty;
	}

	public MemberBean getMemberBeans() {
		return memberBeans;
	}

	public void setMemberBeans(MemberBean memberBeans) {
		this.memberBeans = memberBeans;
	}

	public Set<ItemBean> getItem() {
		return item;
	}

	public void setItem(Set<ItemBean> item) {
		this.item = item;
	}

 	
}
