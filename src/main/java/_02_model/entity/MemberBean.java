package _02_model.entity;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

//@Entity
@Table(name="member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mId;//編號
	private String mAN;//帳號
	private String mPw;	//密碼
	@Transient
	private String mPw1;//確認密碼
	private String mGender;		
	private String mName;	
	private String mUid;	
	private Date mBDay;	
	private String mEmail;	
	private String mPhone;	
	private String d_mAddress;	
	private Timestamp m_createTime;	
<<<<<<< HEAD
//	private String mPic;
	private String mPic;
=======
	private String mPic;
//	private Blob mPic;
>>>>>>> main
	
	@Transient
	String fileName;
	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Transient
	MultipartFile mMultipartFile;
	
	
	public String getmPic() {
		return mPic;
	}


	public void setmPic(String mPic) {
		this.mPic = mPic;
	}

	private Integer mPid;
	//新增該項的get&set&constructor
	//信箱是否驗證
	private Integer m_verify;
	
	
	@OneToMany(mappedBy = "memberBean", cascade = CascadeType.ALL)
	private Set<ShoppingCartBean> shoppingCartBeans = new LinkedHashSet<>();
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "mPid")
	private Member_permBean member_perm;
	
	
	@OneToMany(mappedBy = "memberBean", cascade = CascadeType.ALL)
	private Set<OrdBean> orderBeans = new LinkedHashSet<>();

	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}) 
	private Set<PorfolioBean> porfolioBeans = new LinkedHashSet<>();

	public MemberBean() {
	}


	public MemberBean(Integer mId, String mAN, String mPw, String mGender, String mName, String mUid, Date mBDay,
			String mEmail, String mPhone, String d_mAddress, Timestamp m_createTime, String mPic, Integer mPid,
			Set<ShoppingCartBean> shoppingCartBeans, Member_permBean member_perm, Set<OrdBean> orderBeans,
			Set<PorfolioBean> porfolioBeans) {
		super();
		this.mId = mId;
		this.mAN = mAN;
		this.mPw = mPw;
		this.mGender = mGender;
		this.mName = mName;
		this.mUid = mUid;
		this.mBDay = mBDay;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.d_mAddress = d_mAddress;
		this.m_createTime = m_createTime;
		this.mPic = mPic;
		this.mPid = mPid;
		this.shoppingCartBeans = shoppingCartBeans;
		this.member_perm = member_perm;
	}

	public Integer getmId() {
		return mId;
	}

	public void setmId(Integer mId) {
		this.mId = mId;
	}

	public String getmAN() {
		return mAN;
	}

	public void setmAN(String mAN) {
		this.mAN = mAN;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmUid() {
		return mUid;
	}

	public void setmUid(String mUid) {
		this.mUid = mUid;
	}

	public Date getmBDay() {
		return mBDay;
	}

	public void setmBDay(Date mBDay) {
		this.mBDay = mBDay;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getD_mAddress() {
		return d_mAddress;
	}

	public void setD_mAddress(String d_mAddress) {
		this.d_mAddress = d_mAddress;
	}

	public Timestamp getM_createTime() {
		return m_createTime;
	}

	public void setM_createTime(Timestamp m_createTime) {
		this.m_createTime = m_createTime;
	}

//	public String getmPic() {
//		return mPic;
//	}
//
//	public void setmPic(String mPic) {
//		this.mPic = mPic;
//	}

	public Integer getmPid() {
		return mPid;
	}

	public void setmPid(Integer mPid) {
		this.mPid = mPid;
	}

	public Integer getM_verify() {
		return m_verify;
	}

	public void setM_verify(Integer m_verify) {
		this.m_verify = m_verify;
	}

	public Set<ShoppingCartBean> getShoppingCartBeans() {
		return shoppingCartBeans;
	}

	public void setShoppingCartBeans(Set<ShoppingCartBean> shoppingCartBeans) {
		this.shoppingCartBeans = shoppingCartBeans;
	}

	public Member_permBean getMember_perm() {
		return member_perm;
	}

	public void setMember_perm(Member_permBean member_perm) {
		this.member_perm = member_perm;
	}

	public Set<OrdBean> getOrderBeans() {
		return orderBeans;
	}

	public void setOrderBeans(Set<OrdBean> orderBeans) {
		this.orderBeans = orderBeans;
	}

	public Set<PorfolioBean> getPorfolioBeans() {
		return porfolioBeans;
	}

	public void setPorfolioBeans(Set<PorfolioBean> porfolioBeans) {
		this.porfolioBeans = porfolioBeans;
	}
}
