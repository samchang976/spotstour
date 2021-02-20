package _11_register.service;

import _02_model.entity.test.MemberBean;

public interface MemberService {
	boolean mANExists(String id);
	int saveMember(MemberBean mb);
	MemberBean queryMember(String id);
	MemberBean checkIdPassword(String userId, String password) ;
}
