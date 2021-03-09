package _37_portfolioManage.dao;

import java.util.List;

import _02_model.entity.CityBean;

public interface CityDao {
	public CityBean getCityById(Integer icId);
	
	public List<CityBean> getCityList();
}
