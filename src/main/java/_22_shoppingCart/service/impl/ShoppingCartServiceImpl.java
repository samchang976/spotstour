package _22_shoppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ItemBean;
import _02_model.entity.MemberBean;
import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;
import _22_shoppingCart.dao.impl.shoppingCartDaoImpl;
import _22_shoppingCart.service.ShoppingCartService;

@Transactional
@Service // Service方法:企業邏輯，定義交易
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	shoppingCartDao shoppingCartDao;

	public ShoppingCartServiceImpl() {

	}

	@Override
	public void deleteItem(int sc_Id) {
		shoppingCartDao.deleteItem(sc_Id);

	}

	@Override
	public List<ShoppingCartBean> getShoppingCart(int memberId) {
		System.out.println("service=================================");
		System.out.println(memberId);
		System.out.println("service=================================");

		return shoppingCartDao.getShoppingCart(memberId);
	}

	@Override
	public ShoppingCartBean getShoppingCartBysc_Id(int sc_Id) {
		System.out.println("service=================================");
		System.out.println(sc_Id);
		System.out.println("service=================================");

		return shoppingCartDao.getShoppingCartBysc_Id(sc_Id);
	}

//更新購物車數量
	@Transactional
	@Override
	public void UpdateQty(ShoppingCartBean shoppingCartBean) {
		System.out.println("更新的service============================");
		ShoppingCartBean cart0 = shoppingCartDao.getShoppingCartBysc_Id(shoppingCartBean.getSc_Id());
		MemberBean member0 = shoppingCartDao.getMemberBeanBymId(shoppingCartBean.getMemberBean().getmId());
		ItemBean item0 = shoppingCartDao.getItemBeanByItemId(shoppingCartBean.getItemBean().getItemId());

		cart0.setS_ordQty(shoppingCartBean.getS_ordQty());
		cart0.setSc_Id(shoppingCartBean.getSc_Id());

		cart0.setMemberBean(member0);
		cart0.setItemBean(item0);

		shoppingCartDao.updateItem(cart0);
		System.out.println("更新的service============================");

	}
//加入購物車=========================================================================
	@Override
	public void addShoppingCart(ShoppingCartBean cart) {
		shoppingCartDao.addShoppingCart(cart);
	}

}
