package _21_merchandiseSearch.service;

import java.util.List;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;

public interface ItemService {
	
	// 依itemId來查詢單筆記錄
	ItemBean getItem(int itemId);
	
	List<CountryBean> getAllCountrys();
	
}
