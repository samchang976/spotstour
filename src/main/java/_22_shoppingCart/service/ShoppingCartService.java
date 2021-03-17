package _22_shoppingCart.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.support.SessionStatus;

import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.vo.SessionShoppingCartVo;

public interface ShoppingCartService {
	
	public void deleteItem(int sc_Id);//刪除購物車中的一筆商品
	
	public  void UpdateQty(ShoppingCartBean cartbean);//修改購物車一筆商品數量
	
	public List<ShoppingCartBean> getShoppingCart(int memberId); //由memberId取得購物車清單:有順序性，先加的要在上面

	public ShoppingCartBean getShoppingCartBysc_Id(int sc_Id);
	
	public void addShoppingCart(ShoppingCartBean cart);//新增一筆商品到購物車

	public String addToCart(Integer memberId, Integer itemId, Integer qty);
	
	public List<SessionShoppingCartVo> getShoppingCartVo(Map<Integer, Integer> cartlist);

	
	public void sessionCartSave(List<SessionShoppingCartVo> sscList,Integer mId);
}
