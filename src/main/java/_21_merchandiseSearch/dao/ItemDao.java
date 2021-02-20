package _21_merchandiseSearch.dao;

import _02_model.entity.test.ItemBean;

public interface ItemDao {
	
	// 依itemId來查詢單筆記錄
	ItemBean getItem(int itemId);
	
	// 新增一筆記錄
	boolean saveItem(ItemBean itembean);
	
	// 依itemId來刪除單筆記錄
	boolean deleteItem(int itemId);
}