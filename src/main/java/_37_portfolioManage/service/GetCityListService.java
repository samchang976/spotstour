package _37_portfolioManage.service;

import java.util.List;

import _02_model.entity.CityBean;

public interface GetCityListService {

	public CityBean getCityById(int cityId);
	public List<CityBean> getCityList();
}
