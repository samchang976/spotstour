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
	
	
	//新增作品
	@Override
	public void addPortfolio(PortfolioBean portfolioBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(portfolioBean);
	}

	
	//編輯作品
	@Override
	public void updatePortfolio(PortfolioBean portfolioBean) {
		Session session = sessionFactory.getCurrentSession();
		//擁有相同的資料庫標識符(代表資料庫中的同一條紀錄),但具有不同的永續標識符
		session.merge(portfolioBean);
	}

	
}
