package _37_portfolioManage.service;

import java.io.IOException;

import _37_portfolioManage.controller.vo.PortfolioBeanVo;


public interface CreatePortfolioService {
	public void addPortfolio(PortfolioBeanVo portfolioBeanVo) throws IOException;
	
	public void editPortfolio(PortfolioBeanVo portfolioBeanVo) throws IOException;

}
