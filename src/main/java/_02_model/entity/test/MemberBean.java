//package _02_model.entity.test;
//
//import java.io.Serializable;
//import java.sql.Blob;
//import java.sql.Clob;
//import java.sql.Date;
//import java.sql.Timestamp;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
////@Entity
//@Table(name="Member")
//public class MemberBean implements Serializable {
//	private static final long serialVersionUID = 1L;
//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer mId;//編號
//	String memberId;//帳號
//	private String mName;
//	private String mPw;//密碼
//	private String d_mAddress;
//	private String mEmail;
//	private String mPhone;
//	private Timestamp m_createTime;
//	private Blob mPic;//要換成路徑
//	String fileName;//路徑
//	
//	private String mGender;	
//	private String mUid;	
//	private Date mBDay;	
//	
//
//	public MemberBean(Integer mId, String memberId, String mName, String mPw, String d_mAddress, String mEmail,
//			String mPhone, String mGender, Timestamp m_createTime,
//			Blob mPic, String fileName, String mUid, Date mBDay) {
//		this.mId = mId;
//		this.memberId = memberId;
//		this.mPw = mPw;
//		this.mName = mName;
//		this.d_mAddress = d_mAddress;
//		this.mEmail = mEmail;
//		this.mPhone = mPhone;
//		this.m_createTime = m_createTime;
//		this.fileName = fileName;
//		this.mPic = mPic;
//		this.mGender = mGender;
//		this.mUid = mUid;
//		this.mBDay = mBDay;
//	}
//
//	public String getmUid() {
//		return mUid;
//	}
//
//	public void setmUid(String mUid) {
//		this.mUid = mUid;
//	}
//
//	public Date getmBDay() {
//		return mBDay;
//	}
//
//	public void setmBDay(Date mBDay) {
//		this.mBDay = mBDay;
//	}
//
//	public String getmGender() {
//		return mGender;
//	}
//
//	public void setmGender(String mGender) {
//		this.mGender = mGender;
//	}
//
//	public MemberBean() {
//	}
//
//	public Integer getmId() {
//		return mId;
//	}
//	
//	public void setmId(int mId) {
//		this.mId = mId;
//	}
//
//	public Blob getmPic() {
//		return mPic;
//	}
//
//	public void setmPic(Blob mPic) {
//		this.mPic = mPic;
//	}
//
//	public String getFileName() {
//		return fileName;
//	}
//
//	public void setFileName(String fileName) {
//		this.fileName = fileName;
//	}
//
//	public String getd_mAddress() {
//		return d_mAddress;
//	}
//
//	public void setd_mAddress(String d_mAddress) {
//		this.d_mAddress = d_mAddress;
//	}
//
//	public String getmEmail() {
//		return mEmail;
//	}
//
//	public void setmEmail(String mEmail) {
//		this.mEmail = mEmail;
//	}
//
//	public void setm_createTime(Timestamp m_createTime) {
//		this.m_createTime = m_createTime;
//	}
//
//	public String getmName() {
//		return mName;
//	}
//
//	public void setmName(String mName) {
//		this.mName = mName;
//	}
//
//	public String getmPw() {
//		return mPw;
//	}
//
//	public void setmPw(String mPw) {
//		this.mPw = mPw;
//	}
//
//	public String getmPhone() {
//		return mPhone;
//	}
//
//	public void setmPhone(String mPhone) {
//		this.mPhone = mPhone;
//	}
//
//	public String getMemberId() {
//		return memberId;
//	}
//
//	public void setMemberId(String memberId) {
//		this.memberId = memberId;
//	}
//
//	public Timestamp getm_createTime() {
//		return m_createTime;
//	}
//
//	public String toString() {
//		return "userid=" + memberId + "   password=" + mPw;
//	}
//}
