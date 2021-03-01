package _91_managerMart.service;

import java.util.List;

import _02_model.entity.CountryBean;
import _02_model.entity.FeedbackBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;

public interface ManagerItemService {
	// 依itemId來刪除單筆記錄
	void freezeItemByItemId(int itemId);
	
	void editItemByItemId(int itemId);

	// 依itemId來查詢單筆記錄
	ItemBean getItemByItemId(int itemId);

//	// 新增一筆記錄
//	int saveItem(ItemBean itembean);
	
	//陳列商品
	public List<ItemBean> getAllItems();
	
	//陳列全部商品留言
	public List<FeedbackBean> getAllFeedbacks();
	
	//陳列商品留言
	public List<FeedbackBean> getAllFeedbacksById(int itemId);

	public void addItem(ItemBean itemBean);

	public Item_typeBean getItem_TypeById(int itId);
	
	public CountryBean getCountryById(int countryId);

	List<Item_typeBean> getItem_TypeList();
	
	List<CountryBean> getCountryList();
	
	public void updateItem(ItemBean itemBean);

}
