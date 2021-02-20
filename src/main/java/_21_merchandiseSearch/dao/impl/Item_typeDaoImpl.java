package _21_merchandiseSearch.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.test.Item_typeBean;
import _21_merchandiseSearch.dao.Item_typeDao;



@Repository
public class Item_typeDaoImpl implements Serializable, Item_typeDao {
	private static final long serialVersionUID = 1L;
	
	private int itemId = 0;

	@Autowired
	SessionFactory factory = null;

	@Override
	public Item_typeBean getItem_typeById() {
        Session session = factory.getCurrentSession();
        Item_typeBean cb = session.get(Item_typeBean.class, itemId);
		return cb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item_typeBean> getItem_type() {
		String hql = "FROM Item_typeBean";
		Session session = factory.getCurrentSession();
		List<Item_typeBean> list = session.createQuery(hql)
										.getResultList();
		return list;
	}
	
	@Override
	public int getItemId() {
		return itemId;
	}

	@Override
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	
}