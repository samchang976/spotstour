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
import javax.persistence.Transient;

@Entity
@Table(name="ord")
public class OrdBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer ord_Id;	
	private Timestamp s_createTime;
	private Timestamp o_createTime;
	private String s_mAddress;
	
	@OneToMany(mappedBy = "ordBean", cascade = CascadeType.ALL)
	private Set<Ord_detailBean> ord_detailBeans = new LinkedHashSet<>();
	
	@Transient
	private Integer mTId;
	
	@Transient
	private Integer shipTypeTId;
	
	@Transient
	private Integer receiptTypeTId;
	
	@Transient
	private Integer oSTid;
	
	@ManyToOne
	@JoinColumn(name="mId")
	private MemberBean memberBean;
	
	@ManyToOne(cascade = CascadeType.ALL)	
	@JoinColumn(name = "receiptTypeId")
	private Receipt_TypeBean receiptTypeBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "shipTypeId")
	private Ship_TypeBean shipTypeBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "oSid")
	private Ord_statBean ordStatBean;

	public Integer getOrd_Id() {
		return ord_Id;
	}

	public void setOrd_Id(Integer ord_Id) {
		this.ord_Id = ord_Id;
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

	public Set<Ord_detailBean> getOrd_detailBeans() {
		return ord_detailBeans;
	}

	public void setOrd_detailBeans(Set<Ord_detailBean> ord_detailBeans) {
		this.ord_detailBeans = ord_detailBeans;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public Receipt_TypeBean getReceiptTypeBean() {
		return receiptTypeBean;
	}

	public void setReceiptTypeBean(Receipt_TypeBean receiptTypeBean) {
		this.receiptTypeBean = receiptTypeBean;
	}

	public Ship_TypeBean getShipTypeBean() {
		return shipTypeBean;
	}

	public void setShipTypeBean(Ship_TypeBean shipTypeBean) {
		this.shipTypeBean = shipTypeBean;
	}

	public Ord_statBean getOrdStatBean() {
		return ordStatBean;
	}

	public void setOrdStatBean(Ord_statBean ordStatBean) {
		this.ordStatBean = ordStatBean;
	}

	public Integer getShipTypeTId() {
		return shipTypeTId;
	}

	public void setShipTypeTId(Integer shipTypeTId) {
		this.shipTypeTId = shipTypeTId;
	}

	public Integer getReceiptTypeTId() {
		return receiptTypeTId;
	}

	public void setReceiptTypeTId(Integer receiptTypeTId) {
		this.receiptTypeTId = receiptTypeTId;
	}

	public Integer getmTId() {
		return mTId;
	}

	public void setmTId(Integer mTId) {
		this.mTId = mTId;
	}

	public Integer getoSTid() {
		return oSTid;
	}

	public void setoSTid(Integer oSTid) {
		this.oSTid = oSTid;
	}


	

}
