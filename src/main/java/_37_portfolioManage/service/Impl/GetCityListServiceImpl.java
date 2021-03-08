package _37_portfolioManage.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CityBean;
import _37_portfolioManage.dao.GetCityListDao;
import _37_portfolioManage.service.GetCityListService;

@Service
public class GetCityListServiceImpl implements GetCityListService {

	@Autowired
	private GetCityListDao getCityListDao;
	
	
	@Transactional
	@Override
	public CityBean getCityById(int cityId) {
		return getCityListDao.getCityById(cityId);
	}


	@Transactional
	@Override
	public List<CityBean> getCityList(){
		return getCityListDao.getCityList();
	}
}
