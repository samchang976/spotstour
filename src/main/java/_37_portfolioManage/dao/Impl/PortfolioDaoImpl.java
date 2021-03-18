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
	
	//新增作品影片
	@Override
	public void addPortfolio(PortfolioBean portfolioBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(portfolioBean);
		
	}

	
	//編輯作品影片
	@Override
	public void updatePortfolio(PortfolioBean portfolioBean) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(portfolioBean);
	}
	
	
}
