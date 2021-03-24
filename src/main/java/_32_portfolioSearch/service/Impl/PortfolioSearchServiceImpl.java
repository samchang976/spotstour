package _32_portfolioSearch.service.Impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.protobuf.Empty;

import _32_portfolioSearch.dao.PortfolioSearchDao;
import _32_portfolioSearch.service.PortfolioSearchService;


@Service
public class PortfolioSearchServiceImpl implements PortfolioSearchService {

	@Autowired
	private PortfolioSearchDao portfolioSearchDao;

	@Override
	@Transactional
	public List<Map<String, Object>> queryKeyword(String keyword,String param) {
		if(param == null) {
			System.out.println("000");
			return portfolioSearchDao.queryKeyword(keyword);
		}else if(param.equals("1")) {
			System.out.println("111");
			return portfolioSearchDao.queryKeywordDESC(keyword);
		}else if(param.equals("2")) {
			System.out.println("222");
			return portfolioSearchDao.queryKeywordASC(keyword);
		}
		System.out.println("444");
		return portfolioSearchDao.queryKeyword(keyword);
	}

	@Override
	@Transactional
	public List<Map<String, Object>> queryPersonalKeyword(String keyword, Integer mId) {
		return portfolioSearchDao.queryPersonalKeyword(keyword, mId);
	}
	

}
