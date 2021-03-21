package _11_register.dao.impl;

import java.util.List;
import javax.persistence.NoResultException;

import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;
import _11_register.dao.MemberDao;

@Repository
public class MemberDaoImpl_Hibernate implements MemberDao {
	
	@Autowired
	SessionFactory factory;
	
	public MemberDaoImpl_Hibernate() {
	}
	
	public int saveMember(MemberBean mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		n++;
		return n;
	}
	

	@Override
	public boolean mANExists(String mAN) {
		
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.mAN = :mAN";
		@SuppressWarnings("unchecked")
		List<MemberBean> beans = (List<MemberBean>) session.createQuery(hql)
										.setParameter("mAN", mAN)
										.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}
		return exist;
	}
	

	@Override
	public MemberBean queryMember(String mAN) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.mAN = :mAN";
		@SuppressWarnings("unchecked")
		List<MemberBean> beans = (List<MemberBean>) session.createQuery(hql)
										.setParameter("mAN", mAN)
										.getResultList();
		if (beans.size() > 0) {
			mb = beans.get(0);
		}
		return mb;
	}

	@Override
	public MemberBean checkmANmPw(String mAN, String mPw) {
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.mAN = :mAN and m.mPw = :mPw";
		Session session = factory.getCurrentSession();
		try {
			mb = (MemberBean) session.createQuery(hql)
									 .setParameter("mAN", mAN)
									 .setParameter("mPw", mPw)
									 .getSingleResult();
		} catch(NoResultException ex) {
			;
		} catch(NonUniqueResultException ex) {
			throw new RuntimeException("帳號資料有誤(NonUnique)，應重建初始資料");
		} 	
		return mb;
	}
	

		@Override
		public Member_permBean selectdata(int mPid) {
			Member_permBean mpb = null;
			String hql = "FROM Member_permBean mpb WHERE mpb.mPid = :mPid";
			Session session = factory.getCurrentSession();
			mpb = (Member_permBean) session.createQuery(hql)
					 .setParameter("mPid", mPid)
					 .getSingleResult();
			
			return mpb;
		}
		
		@Override
		public void updateVerify(Integer mId) {
			String hql = "UPDATE MemberBean m SET m.m_verify = 1 WHERE m.mId = :mId";
			Session session = factory.getCurrentSession();
			session.createQuery(hql).setParameter("mId", mId).executeUpdate();
		}
}
