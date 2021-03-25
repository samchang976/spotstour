package _32_portfolioSearch.service.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _32_portfolioSearch.dao.PortfolioPlayDao;
import _32_portfolioSearch.dao.QueryItemBySQLDao;
import _32_portfolioSearch.service.PortfolioPlayService;

@Service
public class PortfolioPlayServiceImpl implements PortfolioPlayService {

	@Autowired
	private PortfolioPlayDao portfolioPlayDao;
	@Autowired
	private QueryItemBySQLDao queryItemBySQLDao;
	
	@Override
	@Transactional
	public List<Map<String, Object>> queryPortfolioId(Integer portfolioId) {
		
		return portfolioPlayDao.queryPortfolioId(portfolioId);
	}

	@Override
	@Transactional
	public List<Map<String, Object>> queryHotItems(Integer countryId) {
		return queryItemBySQLDao.queryItemsByCnId(countryId);
	}
	
	

}
