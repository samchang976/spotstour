package _32_portfolioSearch.service;

import java.util.List;
import java.util.Map;

import _32_portfolioSearch.controller.vo.Portfolio_MsgBeanVo;

public interface PortfolioMsgService {

	public List<Map<String, Object>> queryPortfolioMsg(Integer portfolioId);
	
	public void addPortfolioMsg(Portfolio_MsgBeanVo portfolio_MsgBeanVo);
	
	public void deletePortfolioMsg(Portfolio_MsgBeanVo portfolio_MsgBeanVo);
	
}
