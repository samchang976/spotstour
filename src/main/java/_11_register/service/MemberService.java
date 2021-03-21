package _11_register.service;


import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;

public interface MemberService {
	public boolean mANExists(String mAN);
	public int saveMember(MemberBean mb) ;
	public MemberBean queryMember(String mAN);
	public MemberBean checkmANmPw(String mAN, String mPw);
	public Member_permBean selectdata(int mPid);
	public void updateVerify(Integer mId);
}
