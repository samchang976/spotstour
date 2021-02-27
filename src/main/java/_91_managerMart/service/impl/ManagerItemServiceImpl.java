package _91_managerMart.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _91_managerMart.dao.ManagerItemDao;
import _91_managerMart.service.ManagerItemService;



@Service
public class ManagerItemServiceImpl implements ManagerItemService {

	@Autowired
	ManagerItemDao managetItemDao;
//	@Autowired
//	SessionFactory factory;

	@Transactional
	@Override
	public ItemBean getItemByItemId(int itemId) {
		ItemBean itembean = null;
		itembean = managetItemDao.getItemByItemId(itemId);
		return itembean;
	}

	@Transactional
	@Override
	public void freezeItemByItemId(int itemId) {
		managetItemDao.freezeItemByItemId(itemId);
	}
	
	@Transactional
	@Override
	public void editItemByItemId(int itemId) {
		managetItemDao.editItemByItemId(itemId);
	}

//	@Transactional
//	@Override
//	public int saveItem(ItemBean itembean) {
//		int n = 0;
//		boolean b = managetItemDao.saveItem(itembean);
//		if (b = true) {
//			return n = 1;
//		} else {
//			return n = 0;
//		}
//	}
	
	@Transactional
	@Override
	public List<ItemBean> getAllItems() {
		return managetItemDao.getAllItems();
	}
	

	@Transactional
	@Override
	public void addItem(ItemBean itemBean) {
		managetItemDao.addItem(itemBean);
	}

	@Transactional
	@Override
	public Item_typeBean getItem_TypeById(int itId) {
		return managetItemDao.getItem_TypeById(itId);
	}
	
	@Transactional
	@Override
	public CountryBean getCountryById(int countryId) {
		return managetItemDao.getCountryById(countryId);
	}

	//取得item_type list
	@Transactional
	@Override
	public List<Item_typeBean> getItem_TypeList() {
		return managetItemDao.getItem_TypeList();
	}
	
	//取得country list
	@Transactional
	@Override
	public List<CountryBean> getCountryList() {
		return managetItemDao.getCountryList();
	}
	
	//編輯及更新商品
	@Transactional
	@Override
	public void updateItem(ItemBean itemBean) {
		managetItemDao.updateItem(itemBean);
	}
}
