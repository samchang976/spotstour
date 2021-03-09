package _37_portfolioManage.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.MemberBean;
import _02_model.entity.Place_TypeBean;
import _37_portfolioManage.dao.Place_TypeDao;

@Repository
public class Place_TypeDaoIml implements Place_TypeDao {
	
	@Autowired
	SessionFactory sessionFactory;

	
	@Override
	public Place_TypeBean getPlace_TypeById(Integer iptId) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Place_TypeBean pt WHERE pt.placeTypeId = :qptId";
		//撈出Place_Type ID對應的整個row
		Place_TypeBean ptId = (Place_TypeBean) session.createQuery(hql).setParameter("qptId", iptId).getSingleResult();
			
		return ptId;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Place_TypeBean> getPlace_TypeList() {
		String hql = "FROM Place_TypeBean";
		Session session = sessionFactory.getCurrentSession();
		List<Place_TypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	
}
