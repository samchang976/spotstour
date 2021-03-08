package _22_shoppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;
import _22_shoppingCart.service.ShoppingCartService;
@Transactional
@Service //Service方法:企業邏輯，定義交易
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	shoppingCartDao shoppingCartDao;
	
	public ShoppingCartServiceImpl() {
		
	}

	@Override
	public void saveShoppingCart(ShoppingCartBean cart) {
		shoppingCartDao.saveShoppingCart(cart);
	}

	@Override
	public void deleteItem(int sc_Id) {
		shoppingCartDao.deleteItem(sc_Id);
		
	}

	@Override
	public void UpdateQty(ShoppingCartBean cart) {
		shoppingCartDao.UpdateQty(cart);
		
	}

	@Override
	public List<ShoppingCartBean> getShoppingCart(int memberId) {
		System.out.println("service=================================");
		
		System.out.println(memberId);
		
		System.out.println("service=================================");
		
		return shoppingCartDao.getShoppingCart(memberId);
	}

}
