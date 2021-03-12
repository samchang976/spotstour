package _22_shoppingCart.dao;

import java.util.List;

import _02_model.entity.ItemBean;
import _02_model.entity.MemberBean;
import _02_model.entity.ShoppingCartBean;

public interface shoppingCartDao {
//	public void saveShoppingCart(ShoppingCartBean cart);
	
	public void deleteItem(int sc_Id);//刪除購物車中的一筆商品
	
	
	public List<ShoppingCartBean> getShoppingCart(int memberId); //由memberId取得購物車清單:有順序性，先加的要在上面

	//=======================================================================================
	public void updateItem(ShoppingCartBean cartbean);//修改購物車一筆商品數量
	
	public ShoppingCartBean getShoppingCartBysc_Id(int sc_Id);
	
	//以mId取得MemberBean
	public MemberBean getMemberBeanBymId(int memberId);
	
	//itemId取得itemBean
	public ItemBean getItemBeanByItemId(int itemId);
	
	//=======================================================================================
	void addShoppingCart(ShoppingCartBean shoppingCartBean);//新增一筆商品到購物車


	//判斷
	public ShoppingCartBean hasCart(Integer memberId, Integer itemId);
}
