package _02_model.entity;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//@Entity
@Table(name="member_perm")
public class Member_permBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "mPid", unique = true, nullable = false)
	Integer mPid;
 	String mPermissions;
 	
 	@OneToMany(mappedBy = "member_perm", cascade = CascadeType.ALL)
 	Set<MemberBean> memberBeans = new LinkedHashSet<>();
 	
	public Integer getmPid() {
		return mPid;
	}
	
	public Member_permBean() {
		super();
	}

	public Member_permBean(Integer mPid, String mPermissions, Set<MemberBean> memberBeans) {
		super();
		this.mPid = mPid;
		this.mPermissions = mPermissions;
		this.memberBeans = memberBeans;
	}
	
	public void setmPid(Integer mPid) {
		this.mPid = mPid;
	}
	
	public String getmPermissions() {
		return mPermissions;
	}
	
	public void setmPermissions(String mPermissions) {
		this.mPermissions = mPermissions;
	}

	public Set<MemberBean> getMemberBeans() {
		return memberBeans;
	}

	public void setMemberBeans(Set<MemberBean> memberBeans) {
		this.memberBeans = memberBeans;
	}
}
