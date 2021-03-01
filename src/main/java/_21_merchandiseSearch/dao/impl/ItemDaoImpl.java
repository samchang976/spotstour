package _21_merchandiseSearch.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _02_model.entity.Ship_TypeBean;
import _21_merchandiseSearch.dao.ItemDao;
import _21_merchandiseSearch.dao.Item_typeDao;


// 本類別使用純JDBC的技術來存取資料庫。
// 所有SQLException都以catch區塊捕捉，然後一律再次丟出RuntimeException。
// 對SQLException而言，即使catch下來，程式依然無法正常執行，所以捕捉SQLException，再次丟出
// RuntimeException。

@Repository
public class ItemDaoImpl implements Serializable, ItemDao {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory factory = null;
	
	@Autowired
	Item_typeDao item_typeDao;
	
	
	@Override
	public ItemBean getItemByItemId(int itemId) {
		ItemBean itembean = null;
        Session session = factory.getCurrentSession();
        itembean = session.get(ItemBean.class, itemId);
		return itembean;
	}

	

	@Override
	public List<ItemBean> getAllItem() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemBean> getTopSellItem(int i) {
		return null;
	}

	@Override
	public List<ItemBean> getItemByCountry(String countryName) {
		return null;
	}

	@Override
	public long getItemCount() {
		return 0;
	}

	@Override
	public List<ItemBean> getItemByItemType(String itemType) {
		return null;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<CountryBean> getAllCountrys() {
		String hql = "FROM CountryBean";
		Session session = factory.getCurrentSession();
		List<CountryBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ItemBean> getItemByCountryId(int countryId) {
		String hql = "FROM ItemBean WHERE countryId = :id";
		Session session = factory.getCurrentSession();
		List<ItemBean> list = session.createQuery(hql)
				.setParameter("id", countryId)
				.getResultList();
		return list;
	}
	
	@Override
	public ItemBean getItemById(int itemId) {
		Session session = factory.getCurrentSession();
		ItemBean itemBean = session.get(ItemBean.class, itemId);
		return itemBean;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Ship_TypeBean> getShip_TypeList() {
		String hql = "FROM Ship_TypeBean";
		Session session = factory.getCurrentSession();
		List<Ship_TypeBean> list = session.createQuery(hql).getResultList();
		return list;
	}

}