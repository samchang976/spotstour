package _02_model.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="shoppingcart")
public class ShoppingCartBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	//主鍵是自動增加的數值
	private Integer sc_Id;	 //購物車編號
	private Integer s_ordQty;//購物數量
 	
	@OneToOne
 	@JoinColumn(name = "mId")//外鍵
 	private MemberBean memberBean;//會員編號
 	
 	@ManyToOne 
    @JoinColumn(name="itemId")//外鍵
 	private ItemBean itemBean;//商品編號
 	
//============================================================================
 	//加入購物車用
 	public ShoppingCartBean( ItemBean itemBean) {
 		super();
 		this.itemBean = itemBean;
 	}
	
//============================================================================ 	
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

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public ItemBean getItemBean() {
		return itemBean;
	}

	public void setItemBean(ItemBean itemBean) {
		this.itemBean = itemBean;
	}


 	
}
