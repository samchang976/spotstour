package _11_register.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.test.MemberBean;
import _11_register.dao.MemberDao;
import _11_register.service.MemberService;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;

	public MemberServiceImpl() {
	}

	@Transactional
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
			dao.saveMember(mb);
			n++;
		return n;
	}
	
	@Transactional
	@Override
	public boolean mANExists(String id) {
		boolean exist = false;
			exist = dao.mANExists(id);
		return exist;
	}

	@Transactional
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
			mb = dao.queryMember(id);
		return mb;
	}

	@Transactional
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
			mb = dao.checkIdPassword(userId, password);
		return mb;
	}
}
