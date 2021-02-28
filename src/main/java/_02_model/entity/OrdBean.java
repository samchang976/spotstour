package _02_model.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@Entity
@Table(name="ord")
public class OrdBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer ord_id;	
	private Timestamp s_createTime;
	private Timestamp o_createTime;
	private String s_mAddress;
	
	@OneToMany(mappedBy = "ordBean", cascade = CascadeType.ALL)
	Set<Ord_detailBean> ord_details = new LinkedHashSet<>();
	
//	@ManyToOne
//	@JoinColumn(name="mId")
//	private MemberBean memberBean;
	
	@ManyToOne(cascade = CascadeType.ALL)	
	@JoinColumn(name = "receiptTypeId")
	private Receipt_TypeBean receipt_TypeBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "shipTypeId")
	private Ship_TypeBean ship_TypeBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ordSid")
	private Ord_statBean ord_statBean;

	public OrdBean() {
		super();
	}

	public OrdBean(Integer ord_id, Timestamp s_createTime, Timestamp o_createTime, String s_mAddress,
			Set<Ord_detailBean> ord_details, Receipt_TypeBean receipt_TypeBean,
			Ship_TypeBean ship_TypeBean, Ord_statBean ord_statBean) {
		super();
		this.ord_id = ord_id;
		this.s_createTime = s_createTime;
		this.o_createTime = o_createTime;
		this.s_mAddress = s_mAddress;
		this.ord_details = ord_details;
//		this.memberBean = memberBean;
		this.receipt_TypeBean = receipt_TypeBean;
		this.ship_TypeBean = ship_TypeBean;
		this.ord_statBean = ord_statBean;
	}

	public Integer getOrd_id() {
		return ord_id;
	}

	public void setOrd_id(Integer ord_id) {
		this.ord_id = ord_id;
	}

	public Timestamp getS_createTime() {
		return s_createTime;
	}

	public void setS_createTime(Timestamp s_createTime) {
		this.s_createTime = s_createTime;
	}


	public Timestamp getO_createTime() {
		return o_createTime;
	}

	public void setO_createTime(Timestamp o_createTime) {
		this.o_createTime = o_createTime;
	}

	public String getS_mAddress() {
		return s_mAddress;
	}

	public void setS_mAddress(String s_mAddress) {
		this.s_mAddress = s_mAddress;
	}

	public Set<Ord_detailBean> getOrd_details() {
		return ord_details;
	}

	public void setOrd_details(Set<Ord_detailBean> ord_details) {
		this.ord_details = ord_details;
	}

//	public MemberBean getMemberBean() {
//		return memberBean;
//	}
//
//	public void setMemberBean(MemberBean memberBean) {
//		this.memberBean = memberBean;
//	}

	public Receipt_TypeBean getReceipt_TypeBean() {
		return receipt_TypeBean;
	}

	public void setReceipt_TypeBean(Receipt_TypeBean receipt_TypeBean) {
		this.receipt_TypeBean = receipt_TypeBean;
	}

	public Ship_TypeBean getShip_TypeBean() {
		return ship_TypeBean;
	}

	public void setShip_TypeBean(Ship_TypeBean ship_TypeBean) {
		this.ship_TypeBean = ship_TypeBean;
	}

	public Ord_statBean getOrd_statBean() {
		return ord_statBean;
	}

	public void setOrd_statBean(Ord_statBean ord_statBean) {
		this.ord_statBean = ord_statBean;
	}
}
