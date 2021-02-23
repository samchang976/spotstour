package _91_managerMart.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public ItemBean getItem(int itemId) {
		ItemBean itembean = null;
		itembean = managetItemDao.getItemByItemId(itemId);
		return itembean;
	}

	@Transactional
	@Override
	public int deleteItem(int itemId) {
		int n = 0;
		boolean b = managetItemDao.deleteItem(itemId);
		if(b = true) {
			return n = 1;
		}else {
			return n = 0;
		}

	}

	@Transactional
	@Override
	public int saveItem(ItemBean itembean) {
		int n = 0;
		boolean b = managetItemDao.saveItem(itembean);
		if(b = true) {
			return n = 1;
		}else {
			return n = 0;
		}
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
	public List<Item_typeBean> getItem_TypeList() {
		return managetItemDao.getItem_TypeList();
	}
}
