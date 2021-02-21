package _21_merchandiseSearch.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
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
	public boolean saveItem(ItemBean itembean) {
		boolean b = false;
        Session session = factory.getCurrentSession();
        if (itembean.getItem_typeBean() == null) {
        	item_typeDao.setItemId(itembean.getItemId());
            Item_typeBean itb = item_typeDao.getItem_typeById();
            itembean.setItem_typeBean(itb);
        }
        session.save(itembean);
		return b = true;
	}
	
	@Override
	public boolean deleteItem(int itemId) {
		boolean b = false;
		Session session = factory.getCurrentSession();
		ItemBean bookbean = new ItemBean();
		bookbean.setItemId(itemId);
		session.delete(bookbean);
		return b = true;
	}

	@Override
	public List<ItemBean> getAllItem() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemBean> getTopSellItem(int i) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ItemBean> getItemByCountry(String countryName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getItemCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean updateItem(ItemBean itemBean) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ItemBean> getItemByItemType(String itemType) {
		// TODO Auto-generated method stub
		return null;
	}

}