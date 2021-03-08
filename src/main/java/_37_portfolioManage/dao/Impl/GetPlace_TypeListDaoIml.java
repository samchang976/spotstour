package _37_portfolioManage.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.Place_TypeBean;
import _37_portfolioManage.dao.GetPlace_TypeListDao;

@Repository
public class GetPlace_TypeListDaoIml implements GetPlace_TypeListDao {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Place_TypeBean> getPlace_TypeList() {
		String hql = "FROM Place_TypeBean";
		Session session = factory.getCurrentSession();
		List<Place_TypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	
}
