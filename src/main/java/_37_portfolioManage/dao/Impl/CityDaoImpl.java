package _37_portfolioManage.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CityBean;
import _02_model.entity.Place_TypeBean;
import _37_portfolioManage.dao.CityDao;

@Repository
public class CityDaoImpl implements CityDao {
//	private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	
	@Override
	public CityBean getCityById(Integer icId) {
		Session session = sessionFactory.getCurrentSession();		
		String hql = "FROM CityBean cb WHERE cb.cityId = :qcId";
		//撈出City ID對應的整個row
		CityBean cId = (CityBean) session.createQuery(hql).setParameter("qcId", icId).getSingleResult();
			
		return cId;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<CityBean> getCityList() {
		String hql = "FROM CityBean";
		Session session = sessionFactory.getCurrentSession();
		List<CityBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
