package _22_shoppingCart.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;

@Repository //讀取資料的dao
public class shoppingCartDaoImpl implements shoppingCartDao {
	@Autowired
	SessionFactory factory;
	shoppingCartDaoImpl() {
	}
	
// 儲存ShoppingCartBean物件，將參數saveCart新增到ShoppingCartBean表格內。=============================
	public void saveShoppingCart(ShoppingCartBean cart) {
		Session session = factory.getCurrentSession();
		session.save(cart);

	}
//刪除一筆商品資料，依sc_Id刪除	=================================================================
	public void deleteItem(int sc_Id) {
        Session session = factory.getCurrentSession();
        ShoppingCartBean sb = new ShoppingCartBean();
        sb.setSc_Id(sc_Id);
        session.delete(sb);

	}	
	
//購物車，由memberId取得==========================================================================	
	@SuppressWarnings("unchecked")
	@Override

	public List<ShoppingCartBean> getShoppingCart(int memberId) {
			List<ShoppingCartBean> cart = new LinkedList<ShoppingCartBean>(); //如果找不到就回傳null
			String hql = "FROM ShoppingCartBean WHERE mId = :memberId" ; 
			
	
	        Session session = factory.getCurrentSession();
	         cart = session.createQuery(hql)
	        		.setParameter("memberId", memberId)//設定參數名稱，參數值
	        		.getResultList();//查詢0或多筆物件
	         
	         System.out.println("Dao================================");
	         System.out.println(cart);
	         System.out.println("Dao================================");

			return cart;
			
	}
	
//=============================================================================================
	@Override
	public void UpdateQty(ShoppingCartBean cart) {
		Session session = factory.getCurrentSession();
		session.update(cart);
		
	}

	

}
