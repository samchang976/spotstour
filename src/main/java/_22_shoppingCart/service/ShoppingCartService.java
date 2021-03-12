package _22_shoppingCart.service;

import java.util.List;

import _02_model.entity.ShoppingCartBean;

public interface ShoppingCartService {
	public void saveShoppingCart(ShoppingCartBean cart);//新增一筆商品到購物車
	
	public void deleteItem(int sc_Id);//刪除購物車中的一筆商品
	
	public  void UpdateQty(ShoppingCartBean cartbean);//修改購物車一筆商品數量
	
	public List<ShoppingCartBean> getShoppingCart(int memberId); //由memberId取得購物車清單:有順序性，先加的要在上面

	public ShoppingCartBean getShoppingCartBysc_Id(int sc_Id);
	
}
