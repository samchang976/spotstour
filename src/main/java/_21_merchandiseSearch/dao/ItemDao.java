package _21_merchandiseSearch.dao;

import java.util.List;
import java.util.Set;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;

public interface ItemDao {
	
	ItemBean getItemByItemId(int itemId);
	
	List<ItemBean> getItemByItemType(String itemType);
	
	List<ItemBean> getAllItems();
	
	List<ItemBean> getTopSellItem(int i);
	
	List<ItemBean> getItemByCountry(String countryName);
	
	long getItemCount();
	
//	=======================
	
	List<CountryBean> getAllCountrys();
	
	List<ItemBean> getItemByCountryId(int countryId);
	
	ItemBean getItemById(int itemId);
	
	List<Ship_TypeBean> getShip_TypeList();
	
	List<Receipt_TypeBean> getReceipt_TypeList();
	
//	=======================
	
	Set<ItemBean> getItemBySearchBar(String searchBar);
}