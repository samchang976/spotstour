package _22_shoppingCart.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _22_shoppingCart.dao.shoppingCartDao;

@Repository //讀取資料的dao
public class shoppingCartDaoImpl implements shoppingCartDao {
	@Autowired
	SessionFactory factory = null;

//查詢購物車===================================================================================	
	@SuppressWarnings("unchecked")
	@Override
	//查詢標的為多性質
	public List<Object> getShoppingCart(int memberId) {
			String hql = "SELECT i.itemPrice,i.itemHeader,i.itemPrice,i.itemQty,s.s_ordQty"
					+ "	FROM ShoppingCartBean s JOIN ItemBean i"
					+ "	ON i.itemId=s.itemId"
					+ "WHERE mId = :memberId";
	        Session session = factory.getCurrentSession();
	        List<Object> cart = session.createQuery(hql)
	        		.setParameter("memberId", memberId)//設定參數名稱，參數值
	        		.getResultList();//查詢0或多筆物件
			return cart;
	}

}
