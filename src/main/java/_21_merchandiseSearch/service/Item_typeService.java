package _21_merchandiseSearch.service;

import java.util.List;

import _02_model.entity.Item_typeBean;



public interface Item_typeService {

	List<Item_typeBean> getItem_type();

	Item_typeBean getItem_typeById();

	int getItemId();
	
	void setItemId(int id);

}