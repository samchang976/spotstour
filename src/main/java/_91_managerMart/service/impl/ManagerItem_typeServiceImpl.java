package _91_managerMart.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.Item_typeBean;
import _91_managerMart.dao.ManagerItem_typeDao;
import _91_managerMart.service.ManagerItem_typeService;


// 本類別負責讀取資料庫內eBookCompany表格內的紀錄
// 
@Service
public class ManagerItem_typeServiceImpl implements Serializable, ManagerItem_typeService {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	ManagerItem_typeDao dao;
	@Autowired
	SessionFactory factory;

	@Transactional
	public List<Item_typeBean> getItem_type() {
		List<Item_typeBean> list = null;
			list = dao.getItem_type();
		return list;
	}

	@Transactional
	public Item_typeBean getItem_typeById() {
		Item_typeBean bean = null;
			bean = dao.getItem_typeById();
		return bean;
	}

	public int getItemId() {
		return dao.getItemId();
	}

	public void setItemId(int itemId) {
		dao.setItemId(itemId);
	}

}