package _32_portfolioSearch.dao.Impl;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ContinentBean;
import _32_portfolioSearch.dao.GetAreaDao;
@Repository
public class GetAreaDaoImpl implements GetAreaDao {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public ContinentBean queryContinentName(String continentName) {
		ContinentBean cnb = null;
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ContinentBean cnb WHERE cnb.continentName like :continentName";
//		Transaction tx = session.getTransaction();
		try {
//			tx.begin();
			cnb = (ContinentBean) session.createQuery(hql)
									 .setParameter("continentName","%"+ continentName +"%")
									 .getSingleResult();
//			tx.commit();
		} catch (NoResultException ex) {
//			tx.rollback();
			System.out.println("err : " + ex.getMessage());
		}
//		System.out.println(cnb.getCountryList().size());
//		System.out.println(cnb.getCountryList().get(0).getCityList().size());
		return cnb;
	}}