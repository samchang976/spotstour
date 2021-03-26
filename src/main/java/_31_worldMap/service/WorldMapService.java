package _31_worldMap.service;

import java.util.List;
import java.util.Map;


public interface WorldMapService {

	public List<Map<String, Object>> getAllPortfolioList();
	
	public List<Map<String, Object>> queryRtPortfolioList();
	
	public List<Map<String, Object>> queryAtPortfolioList();
	
	public List<Map<String, Object>> queryHtPortfolioList();
	
}
