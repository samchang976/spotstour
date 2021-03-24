package _31_worldMap.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _31_worldMap.dao.WorldMapDao;
import _31_worldMap.service.WorldMapService;

@Service
public class WorldMapServiceImpl implements WorldMapService {

	@Autowired
	WorldMapDao worldMapDao;
	
	@Override
	@Transactional
	public List<Map<String, Object>> getAllPortfolioList() {
		
		return worldMapDao.queryAllPortfolioList();
	}

	
}
