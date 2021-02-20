package _11_register.dao;

import java.sql.Connection;

import _02_model.entity.test.MemberBean;



public interface MemberDao {
	
	public boolean mANExists(String id);

	public int saveMember(MemberBean mb) ;
	
	public MemberBean queryMember(String id);
	
	public MemberBean checkIdPassword(String userId, String password);	
	
//	void updateUnpaidOrderAmount(OrderBean ob);

	public void setConnection(Connection con);
}