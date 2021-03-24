package _32_portfolioSearch.dao.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ParamsBean;
import _32_portfolioSearch.dao.ParamsDao;

@Repository
public class ParamsDaoImpl implements ParamsDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public ParamsBean queryParamsById(Integer params) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ParamsBean pb WHERE pb.paramId = :qparamId ";
		ParamsBean pb = (ParamsBean) session.createQuery(hql).setParameter("qparamId", params).getSingleResult();
		return pb;
	}

	
}
