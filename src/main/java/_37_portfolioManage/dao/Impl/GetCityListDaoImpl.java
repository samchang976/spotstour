package _37_portfolioManage.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CityBean;
import _37_portfolioManage.dao.GetCityListDao;

@Repository
public class GetCityListDaoImpl implements GetCityListDao {
//	private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory factory;
	
	
	
	@Override
	public CityBean getCityById(int cityId) {
		CityBean cb = null;
		Session session = factory.getCurrentSession();		
		cb = session.get(CityBean.class, cityId);
		return cb;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<CityBean> getCityList() {
		String hql = "FROM CityBean";
		Session session = factory.getCurrentSession();
		List<CityBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}
