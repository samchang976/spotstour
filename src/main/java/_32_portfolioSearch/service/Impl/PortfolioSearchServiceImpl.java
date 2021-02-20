package _32_portfolioSearch.service.Impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.ContinentBean;
import _32_portfolioSearch.dao.GetAreaDao;
import _32_portfolioSearch.service.PortfolioSearchService;





@Service
public class PortfolioSearchServiceImpl implements PortfolioSearchService {

	@Autowired
	private GetAreaDao dao;
	
	@Override
//	@Transactional
//	public ContinentBean queryContinent(int id) {
//	
//		return dao.queryContinent(id);
//	}
	
	public ContinentBean queryContinentName(String name) {
		
		return dao.queryContinentName(name);
	}
	
//	public CountryBean queryCountryName(String name) {
//		
//		return dao.queryCountryName(name);
//	}
	

}
