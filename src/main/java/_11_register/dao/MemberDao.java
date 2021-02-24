package _11_register.dao;

import _02_model.entity.test.MemberBean;

public interface MemberDao {
	
	public boolean mANExists(String mAN);
	public int saveMember(MemberBean mb) ;
	public MemberBean queryMember(String mAN);
	public MemberBean checkmANmPw(String mAN, String mPw);	
	
}