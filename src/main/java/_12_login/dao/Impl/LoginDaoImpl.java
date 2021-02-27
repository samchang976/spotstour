package _12_login.dao.Impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.MemberBean;
import _12_login.dao.LoginDao;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public MemberBean checkAN(MemberBean memberBean) {
		String imAN = memberBean.getmAN();
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM MemberBean mb WHERE mb.mAN = :qmAN";
		MemberBean mAN = (MemberBean) session.createQuery(hql).setParameter("qmAN", imAN).getSingleResult();


		return mAN;
	}

	@Override
	@Transactional
	public MemberBean checkPw(MemberBean memberBean) {
		String imPw = memberBean.getmPw();
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM MemberBean mb WHERE mb.mPw = :qmPw";
		MemberBean mPw = (MemberBean) session.createQuery(hql).setParameter("qmPw", imPw).getSingleResult();


		return mPw;
	}
	
	
}
