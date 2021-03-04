package _22_shoppingCart.service.impl;

import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _22_shoppingCart.dao.shoppingCartDao;

@Service //Service方法:企業邏輯，定義交易
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	shoppingCartDao shoppingCartDao;
	
	public ShoppingCartServiceImpl() {
		
	}

	@Transactional
	@Override
	public int getItemPrice() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Transactional
	@Override
	public String getItemHeader() {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public Blob getItemPic() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getItemQty() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Transactional
	@Override
	public int getOrdQty() {
		// TODO Auto-generated method stub
		return 0;
	}

}
