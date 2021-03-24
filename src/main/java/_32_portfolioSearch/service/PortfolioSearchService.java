package _32_portfolioSearch.service;

import java.util.List;
import java.util.Map;


public interface PortfolioSearchService {
	
	public List<Map<String, Object>> queryHotPortfolio();
	
	public List<Map<String, Object>> queryKeyword(String keyword,String param);

	public List<Map<String, Object>> queryPersonalKeyword(String keyword , Integer mId);
	
}
