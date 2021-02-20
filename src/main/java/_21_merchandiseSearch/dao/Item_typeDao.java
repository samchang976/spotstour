package _21_merchandiseSearch.dao;

import java.util.List;

import _02_model.entity.test.Item_typeBean;


public interface Item_typeDao {

	List<Item_typeBean> getItem_type() ;

	Item_typeBean getItem_typeById() ;

	int getItemId();
	
	void setItemId(int id);
}