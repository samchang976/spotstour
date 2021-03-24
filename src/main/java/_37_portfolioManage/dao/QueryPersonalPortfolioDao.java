package _37_portfolioManage.dao;

import java.util.List;
import java.util.Map;


public interface QueryPersonalPortfolioDao {

	public List<Map<String, Object>> getMemberPortfolio(Integer mId);
	
	public List<Map<String, Object>> getMemberPortfolioASC(Integer mId);
	
	public List<Map<String, Object>> getMemberPortfolioDESC(Integer mId);
	
}
