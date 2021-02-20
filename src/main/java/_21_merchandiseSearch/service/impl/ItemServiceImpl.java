package _21_merchandiseSearch.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.test.ItemBean;
import _21_merchandiseSearch.dao.ItemDao;
import _21_merchandiseSearch.service.ItemService;



@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemDao dao;
	@Autowired
	SessionFactory factory;

	@Transactional
	@Override
	public ItemBean getItem(int itemId) {
		ItemBean itembean = null;
		itembean = dao.getItem(itemId);
		return itembean;
	}

	@Transactional
	@Override
	public int deleteItem(int itemId) {
		int n = 0;
		boolean b = dao.deleteItem(itemId);
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
		boolean b = dao.saveItem(itembean);
		if(b = true) {
			return n = 1;
		}else {
			return n = 0;
		}
	}

}
