package _91_managerMart.dao;

import java.util.List;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;

public interface ManagerItemDao {
	
	ItemBean getItemByItemId(int itemId);
	
	// 新增一筆記錄
	boolean saveItem(ItemBean itembean);
	
	// 依itemId來刪除單筆記錄
	boolean deleteItem(int itemId);
	
	boolean updateItem(ItemBean itemBean);
	
	public void addItem(ItemBean itemBean);
	
	public Item_typeBean getItem_TypeById(int itId); 
	
	List<Item_typeBean> getItem_TypeList();
	
	List<CountryBean> getCountryList();
	
}