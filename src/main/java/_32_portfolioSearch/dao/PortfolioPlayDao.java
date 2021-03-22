package _32_portfolioSearch.dao;

import java.util.List;
import java.util.Map;

public interface PortfolioPlayDao {

	public List<Map<String, Object>> queryPortfolioId(Integer portfolioId);
}
