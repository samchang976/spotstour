package _32_portfolioSearch.dao;

import java.util.List;
import java.util.Map;

public interface QueryItemBySQLDao {

	public List<Map<String, Object>> queryItemsByCnId(Integer countryId);
}
