package _91_managerMart.service;

import java.util.List;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;

public interface ManagerItemService {
	// 依itemId來刪除單筆記錄
	int deleteItem(int itemId);

	// 依itemId來查詢單筆記錄
	ItemBean getItem(int itemId);

	// 新增一筆記錄
	int saveItem(ItemBean itembean);

	public void addItem(ItemBean itemBean);

	public Item_typeBean getItem_TypeById(int itId);
	
	public CountryBean getCountryById(int countryId);

	List<Item_typeBean> getItem_TypeList();
	
	List<CountryBean> getCountryList();

}
