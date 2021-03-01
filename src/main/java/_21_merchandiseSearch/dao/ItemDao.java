package _21_merchandiseSearch.dao;

import java.util.List;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;

public interface ItemDao {
	
	ItemBean getItemByItemId(int itemId);
	
	List<ItemBean> getItemByItemType(String itemType);
	
	List<ItemBean> getAllItem();
	
	List<ItemBean> getTopSellItem(int i);
	
	List<ItemBean> getItemByCountry(String countryName);
	
	long getItemCount();
	
//	=======================
	
	List<CountryBean> getAllCountrys();
	
	List<CountryBean> getCountryById(int countryId);
}