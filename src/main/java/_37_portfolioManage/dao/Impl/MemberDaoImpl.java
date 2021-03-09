package _37_portfolioManage.dao.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.MemberBean;
import _37_portfolioManage.dao.MemberDao;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory sessionFactory;
	public MemberBean getMemberById(Integer imId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM MemberBean mb WHERE mb.mId = :qmId";
		//撈出會員ID對應的整個row
		MemberBean mId = (MemberBean) session.createQuery(hql).setParameter("qmId", imId).getSingleResult();
		
		
		return mId;
	}

}
