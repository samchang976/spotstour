package _37_portfolioManage.dao;

import java.util.List;

import _02_model.entity.Place_TypeBean;

public interface Place_TypeDao {
	
	public Place_TypeBean getPlace_TypeById(Integer iptId);
	
	public List<Place_TypeBean> getPlace_TypeList();
}
