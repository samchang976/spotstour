package _32_portfolioSearch.service.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _32_portfolioSearch.dao.PortfolioSearchDao;
import _32_portfolioSearch.service.PortfolioSearchService;


@Service
public class PortfolioSearchServiceImpl implements PortfolioSearchService {

	@Autowired
	private PortfolioSearchDao portfolioSearchDao;

	@Override
	@Transactional
	public List<Map<String, Object>> queryKeyword(String keyword) {
		
		return portfolioSearchDao.queryKeyword(keyword);
	}
	

}
