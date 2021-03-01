package _91_managerMart.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.Item_typeBean;
import _91_managerMart.dao.ManagerItem_typeDao;



@Repository
public class ManagerItem_typeDaoImpl implements Serializable, ManagerItem_typeDao {
	private static final long serialVersionUID = 1L;
	
	private int itId = 0;

	@Autowired
	SessionFactory factory = null;

//	@Override
//	public Item_typeBean getItem_typeById() {
//        Session session = factory.getCurrentSession();
//        Item_typeBean cb = session.get(Item_typeBean.class, itId);
//		return cb;
//	}
//
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Item_typeBean> getItem_type() {
//		String hql = "FROM Item_typeBean";
//		Session session = factory.getCurrentSession();
//		List<Item_typeBean> list = session.createQuery(hql).getResultList();
//		return list;
//	}
	
	@Override
	public int getItId() {
		return itId;
	}

	@Override
	public void setItId(int itId) {
		this.itId = itId;
	}
	
	
}