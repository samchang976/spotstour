package _37_portfolioManage.dao;

import java.util.List;

import _02_model.entity.CityBean;

public interface GetCityListDao {
	public CityBean getCityById(int cityId);
	
	public List<CityBean> getCityList();
}
