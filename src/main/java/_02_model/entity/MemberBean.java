package _02_model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
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

@Entity
@Table(name="member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mId; //編號
	private String mAN;  //帳號
	private String mPw;	 //密碼
	@Transient
	private String mTPw; //確認密碼
	private String mGender;		
	private String mName;	
	private String mUid;	
	private Date mBDay;	
	private String mEmail;	
	private String mPhone;	
	private String d_mAddress;	
	private Timestamp m_createTime;	
	private String mPic;
	//信箱是否驗證
	private Integer m_verify;

	@Transient
	private MultipartFile multipartFile;
	
	@OneToMany(mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<ShoppingCartBean> shoppingCartBeans;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "mPid")
	private Member_permBean memberPermBean;
	
	@OneToMany(mappedBy = "memberBean", cascade = CascadeType.ALL)
	private Set<OrdBean> orderBeans = new LinkedHashSet<>();

	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}) 
	private Set<PortfolioBean> porfolioBeans = new LinkedHashSet<>();

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

	public String getmTPw() {
		return mTPw;
	}

	public void setmTPw(String mTPw) {
		this.mTPw = mTPw;
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

	public String getmPic() {
		return mPic;
	}

	public void setmPic(String mPic) {
		this.mPic = mPic;
	}

	public Integer getM_verify() {
		return m_verify;
	}

	public void setM_verify(Integer m_verify) {
		this.m_verify = m_verify;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public List<ShoppingCartBean> getShoppingCartBeans() {
		return shoppingCartBeans;
	}

	public void setShoppingCartBeans(List<ShoppingCartBean> shoppingCartBeans) {
		this.shoppingCartBeans = shoppingCartBeans;
	}

	public Member_permBean getMemberPermBean() {
		return memberPermBean;
	}

	public void setMemberPermBean(Member_permBean memberPermBean) {
		this.memberPermBean = memberPermBean;
	}

	public Set<OrdBean> getOrderBeans() {
		return orderBeans;
	}

	public void setOrderBeans(Set<OrdBean> orderBeans) {
		this.orderBeans = orderBeans;
	}

	public Set<PortfolioBean> getPorfolioBeans() {
		return porfolioBeans;
	}

	public void setPorfolioBeans(Set<PortfolioBean> porfolioBeans) {
		this.porfolioBeans = porfolioBeans;
	}


}
