package _37_portfolioManage.dao.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.PortfolioBean;
import _37_portfolioManage.dao.PortfolioDao;


@Repository
public class PortfolioDaoImpl implements PortfolioDao {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public void addPortfolio(PortfolioBean portfolioBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(portfolioBean);
		
	}

	
}
