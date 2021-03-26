package _31_worldMap.dao;

import java.util.List;
import java.util.Map;

public interface WorldMapDao {
	
	public List<Map<String, Object>> queryAllPortfolioList();
	
	public List<Map<String, Object>> queryRtPortfolioList();
	
	public List<Map<String, Object>> queryAtPortfolioList();
	
	public List<Map<String, Object>> queryHtPortfolioList();
	
}
