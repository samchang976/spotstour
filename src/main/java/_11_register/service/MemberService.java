package _11_register.service;

import _02_model.entity.MemberBean;

public interface MemberService {
	public boolean mANExists(String mAN);
	public int saveMember(MemberBean mb) ;
	public MemberBean queryMember(String mAN);
	public MemberBean checkmANmPw(String mAN, String mPw);
}
