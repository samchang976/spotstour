package _32_portfolioSearch.dao;

import java.util.List;
import java.util.Map;

import _02_model.entity.ContinentBean;

public interface PortfolioSearchDao {
	
	public ContinentBean queryContinentName(String continentName);
	
	public List<Map<String, Object>> queryHotPortfolio();
	
	public List<Map<String, Object>> queryKeyword(String keyword);
	
	public List<Map<String, Object>> queryKeywordASC(String keyword);
	
	public List<Map<String, Object>> queryKeywordDESC(String keyword);
	
	public List<Map<String, Object>> queryKeywordByV(String keyword);
	
	public List<Map<String, Object>> queryKeywordByG(String keyword);
	
	public List<Map<String, Object>> queryPersonalKeyword(String keyword,Integer mId);
	
}
