package _14_modifyMember.dao;

import java.util.List;
import _02_model.entity.MemberBean;


public interface ModifyDao {
	void save(MemberBean mb);
	void delete(Integer mId);
	MemberBean get(Integer mId);
	void update(MemberBean mb);
	List<MemberBean> getAll();

}
