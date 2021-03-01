package _21_merchandiseSearch.service;

import java.util.List;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;

public interface ItemService {
	
	// 依itemId來查詢單筆記錄
	ItemBean getItem(int itemId);
	
//	=======================
	
	List<CountryBean> getAllCountrys();
	
	List<ItemBean> getItemByCountryId(int countryId);
	
	ItemBean getItemById(int itemId);
	
	List<Ship_TypeBean> getShip_TypeList();
	
	List<Receipt_TypeBean> getReceipt_TypeList();
	
}
