package _91_managerMart.service;

import _02_model.entity.ItemBean;

public interface ManagerItemService {
	// 依itemId來刪除單筆記錄
	int deleteItem(int itemId);
	
	// 依itemId來查詢單筆記錄
	ItemBean getItem(int itemId);
	
	// 新增一筆記錄
	int saveItem(ItemBean itembean);

}
