package _37_portfolioManage.dao;

import _02_model.entity.PortfolioBean;

public interface PortfolioDao {

	public PortfolioBean queryPortfolioById(Integer portfolioId);
	
	public void addPortfolio(PortfolioBean portfolioBean);
	
	public void updatePortfolio(PortfolioBean portfolioBean);
	
}
