package _32_portfolioSearch.dao;

import java.util.List;
import java.util.Map;

import _02_model.entity.Portfolio_MsgBean;

public interface PortfolioMsgDao {

	public List<Map<String, Object>> getPortfolioMsgList(Integer portfolioId);
	
	public void addPortfolioMsg(Portfolio_MsgBean portfolio_MsgBean);
	
	public void updatePortfolioMsg(Portfolio_MsgBean portfolio_MsgBean);
	
}
