package _32_portfolioSearch.dao.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.RecordBean;
import _32_portfolioSearch.dao.RecordDao;

@Repository
public class RecordDaoImpl implements RecordDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addRecord(RecordBean recordBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(recordBean);
	}


	
	
}
