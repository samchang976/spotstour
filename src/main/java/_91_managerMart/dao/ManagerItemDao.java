package _91_managerMart.dao;

import _02_model.entity.ItemBean;

public interface ManagerItemDao {
	
	ItemBean getItemByItemId(int itemId);
	
	// 新增一筆記錄
	boolean saveItem(ItemBean itembean);
	
	// 依itemId來刪除單筆記錄
	boolean deleteItem(int itemId);
	
	boolean updateItem(ItemBean itemBean);
}