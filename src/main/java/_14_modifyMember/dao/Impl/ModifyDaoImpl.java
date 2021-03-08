package _14_modifyMember.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.MemberBean;
import _14_modifyMember.dao.ModifyDao;

@Repository
public class ModifyDaoImpl implements ModifyDao{

	@Autowired
	SessionFactory factory;
	
	@Override
	public void save(MemberBean mb) {
		Session session = factory.getCurrentSession();
		session.save(mb);
	}

	@Override
	public void delete(Integer mId) {
		Session session = factory.getCurrentSession();
		MemberBean mb = get(mId);
		if (mb != null) {
			session.delete(mb);
		}
	}

	@Override
	public MemberBean get(Integer mId) {
		return factory.getCurrentSession().get(MemberBean.class, mId);
	}

	@Override
	public void update(MemberBean mb) {
		if(mb != null && mb.getmId() != null) {
			Session session = factory.getCurrentSession();
			session.saveOrUpdate(mb);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getAll() {
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	
	
}
