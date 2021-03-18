package _14_modifyMember.dao;

import java.util.List;
import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;


public interface ModifyDao {
	void save(MemberBean mb);
	void delete(Integer mId);
	MemberBean get(Integer mId);
	Member_permBean getperm(Integer mPid);
	void update(MemberBean mb);
	List<MemberBean> getAll();

}
