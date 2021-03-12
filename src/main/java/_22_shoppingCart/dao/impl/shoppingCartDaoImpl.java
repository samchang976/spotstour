package _22_shoppingCart.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.CartBean;
import _02_model.entity.ItemBean;
import _02_model.entity.MemberBean;
import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;

@Repository //讀取資料的dao
public class shoppingCartDaoImpl implements shoppingCartDao {
	@Autowired
	SessionFactory factory;
	shoppingCartDaoImpl() {
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
	
//以sc_Id取的shoppingBean======================================================================
	@Override
	public ShoppingCartBean getShoppingCartBysc_Id(int sc_Id) {
		String	hql = "FROM ShoppingCartBean WHERE sc_Id = :sc_Id";
		Session session = factory.getCurrentSession();
		ShoppingCartBean cart = (ShoppingCartBean) session.createQuery(hql)
	        		.setParameter("sc_Id", sc_Id)//設定參數名稱，參數值
	        		.getSingleResult();
		return cart;
	}
//以mId取得MemberBean

	@Override
	public MemberBean getMemberBeanBymId(int memberId) {
		 Session session = factory.getCurrentSession();
		 MemberBean memberBean = session.get(MemberBean.class, memberId);
		return memberBean;
	}

//itemId取得itemBean
	
	@Override
	public ItemBean getItemBeanByItemId(int itemId) {
		 Session session = factory.getCurrentSession();
		 ItemBean itembean = session.get(ItemBean.class, itemId);
		return itembean;
	}
	

	@Override
	public void updateItem(ShoppingCartBean shoppingCartBean) {
		System.out.println("更新的dao=========================================");
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(shoppingCartBean);
		System.out.println("更新的dao=========================================");
		
	}
	

	// 儲存ShoppingCartBean物件，將參數saveCart新增到ShoppingCartBean表格內。=============================
		public void addShoppingCart(ShoppingCartBean cart) {
			Session session = factory.getCurrentSession();
			session.save(cart);
		}
	
		@Override
		//判斷某會員是某要加入同樣商品到購物車
		public ShoppingCartBean hasCart(Integer memberId, Integer itemId) {
			Session session = factory.getCurrentSession();
			String hql =  " FROM ShoppingCartBean c "
//						+ " JOIN ProductBean p "
//						+ " ON c.productBean.product_id = p.product_id "
						+ " WHERE c.memberBean.memberId = :memberId  "
						+ " AND c.productBean.product_id = :productId " ;
			
//			可能得到0或1筆，故不能使用getSingleResult()，否則會丟出例外
			@SuppressWarnings("unchecked")
			List<ShoppingCartBean> result = session.createQuery(hql)
										 .setParameter("memberId", memberId)
										 .setParameter("itemId", itemId)
										 .getResultList();
			
//			System.out.println("================");
//			System.out.println(result.get(0).getCart_id());
//			System.out.println("================");
			
			if(result == null || result.isEmpty()) {
				return null;
			}
			
			return result.get(0); //0==>取得list的index=1的值
		}

}

