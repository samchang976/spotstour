package _21_merchandiseSearch.dao;

import java.util.List;

import _02_model.entity.ItemBean;

public interface ItemDao {
	
	ItemBean getItemByItemId(int itemId);
	
	List<ItemBean> getItemByItemType(String itemType);
	
	List<ItemBean> getAllItem();
	
	List<ItemBean> getTopSellItem(int i);
	
	List<ItemBean> getItemByCountry(String countryName);
	
	long getItemCount();
	
	// 新增一筆記錄
	boolean saveItem(ItemBean itembean);
	
	// 依itemId來刪除單筆記錄
	boolean deleteItem(int itemId);
	
	boolean updateItem(ItemBean itemBean);
}