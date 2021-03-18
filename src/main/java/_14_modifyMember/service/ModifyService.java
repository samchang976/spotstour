package _14_modifyMember.service;

import java.util.List;

import _02_model.entity.MemberBean;

public interface ModifyService {

	void save(MemberBean mb);
	void delete(Integer mId);
	MemberBean get(Integer mId);
	void update(MemberBean mb, Integer mId, Integer mPid);
	List<MemberBean> getAll();
}
