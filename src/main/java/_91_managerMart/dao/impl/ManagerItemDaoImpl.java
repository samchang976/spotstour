package _91_managerMart.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _91_managerMart.dao.ManagerItemDao;
import _91_managerMart.dao.ManagerItem_typeDao;


// 本類別使用純JDBC的技術來存取資料庫。
// 所有SQLException都以catch區塊捕捉，然後一律再次丟出RuntimeException。
// 對SQLException而言，即使catch下來，程式依然無法正常執行，所以捕捉SQLException，再次丟出
// RuntimeException。

@Repository
public class ManagerItemDaoImpl implements Serializable, ManagerItemDao {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory factory = null;
	
	@Autowired
	ManagerItem_typeDao managerItem_typeDao;
	
	
	@Override
	public ItemBean getItemByItemId(int itemId) {
		ItemBean itembean = null;
        Session session = factory.getCurrentSession();
        itembean = session.get(ItemBean.class, itemId);
		return itembean;
	}

	@Override
	public boolean saveItem(ItemBean itembean) {
		boolean b = false;
        Session session = factory.getCurrentSession();
        if (itembean.getItem_typeBean() == null) {
        	managerItem_typeDao.setItemId(itembean.getItemId());
            Item_typeBean itb = managerItem_typeDao.getItem_typeById();
            itembean.setItem_typeBean(itb);
        }
        session.save(itembean);
		return b = true;
	}
	
	@Override
	public void freezeItemByItemId(int itemId) {
		String hql= "UPDATE ItemBean SET item_freeze = :freeze WHERE itemId = :id";
		Session session = factory.getCurrentSession();
//		ItemBean itembean = new ItemBean();
//		bookbean.setItemId(itemId);
//		session.delete(itembean);
		int freeze = 1;
		session.createQuery(hql)
		   .setParameter("freeze", freeze)
		   .setParameter("id", itemId)
		   .executeUpdate();
	}
	
	@Override
	public void editItemByItemId(int itemId) {
		String hql= "UPDATE ItemBean SET item_freeze = :freeze WHERE itemId = :id";
		Session session = factory.getCurrentSession();
//		ItemBean bookbean = new ItemBean();
//		bookbean.setItemId(itemId);
//		session.delete(bookbean);
		int freeze = 1;
		session.createQuery(hql)
		   .setParameter("freeze", freeze)
		   .setParameter("id", itemId)
		   .executeUpdate();
	}
	

	@Override
	public boolean updateItem(ItemBean itemBean) {
		Session session = factory.getCurrentSession();
		// TODO Auto-generated method stub
		return false;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ItemBean> getAllItems() {
		String hql = "FROM ItemBean WHERE item_freeze = 0 ORDER BY itemId DESC";
		Session session = factory.getCurrentSession();
		List<ItemBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public void addItem(ItemBean itemBean) {
		Session session = factory.getCurrentSession();
//		Session session = factory.openSession();
		Item_typeBean itb = getItem_TypeById(itemBean.getItId()); 
		CountryBean cb = getCountryById(itemBean.getCountryId());
		itemBean.setItem_typeBean(itb);
		itemBean.setCountryBean(cb);
		session.save(itemBean);
	}

	@Override
	public Item_typeBean getItem_TypeById(int itId) {
		Item_typeBean itb = null;
		Session session = factory.getCurrentSession();
//		Session session = factory.openSession();
		itb = session.get(Item_typeBean.class, itId);
		System.out.println(itb);
		return itb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item_typeBean> getItem_TypeList() {
		String hql = "FROM Item_typeBean";
		Session session = factory.getCurrentSession();
//		Session session = factory.openSession();		
		List<Item_typeBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public CountryBean getCountryById(int countryId) {
		CountryBean cb = null;
		Session session = factory.getCurrentSession();
//		Session session = factory.openSession();
		cb = session.get(CountryBean.class, countryId);
		return cb;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CountryBean> getCountryList() {
		String hql = "FROM CountryBean";
		Session session = factory.getCurrentSession();
//		Session session = factory.openSession();		
		List<CountryBean> list = session.createQuery(hql).getResultList();
		return list;
	}
}