package _11_register.dao;


import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;

public interface MemberDao {
	
	public boolean mANExists(String mAN);
	public int saveMember(MemberBean mb) ;
	public MemberBean queryMember(String mAN);
	public MemberBean checkmANmPw(String mAN, String mPw);	
	public Member_permBean selectdata(int mPid);
}