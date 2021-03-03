package _11_register.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;
import _11_register.dao.MemberDao;
import _11_register.service.MemberService;

@Transactional
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Autowired
	SessionFactory factory;

	public MemberServiceImpl() {
	}
	
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
		dao.saveMember(mb);
		n++;
		return n;
	}	
	
	@Override
	public boolean mANExists(String mAN) {
		boolean exist = false;
		exist = dao.mANExists(mAN);
		return exist;
	}
	
	@Override
	public MemberBean queryMember(String mAN) {
		MemberBean mb = null;
		mb = dao.queryMember(mAN);
		return mb;
	}
	@Override
	public MemberBean checkmANmPw(String mAN, String mPw) {
		MemberBean mb = null;
		mb = dao.checkmANmPw(mAN, mPw);
		return mb;
	}


	@Override
	public Member_permBean selectdata(int mPid) {
		Member_permBean mpb = null;
		mpb = dao.selectdata(mPid);
		return mpb;
	}
}
