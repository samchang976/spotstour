package _12_login.dao;

import _02_model.entity.MemberBean;

public interface LoginDao {
	MemberBean checkAN(MemberBean memberBean);
	
	MemberBean checkPw(MemberBean memberBean);
}
