package _22_shoppingCart.service.impl;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import _02_model.entity.ItemBean;
import _02_model.entity.MemberBean;
import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;
import _22_shoppingCart.service.ShoppingCartService;
import _22_shoppingCart.vo.SessionShoppingCartVo;

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

//===========================================
	@Transactional
	@Override
	public String addToCart(Integer memberId, Integer itemId, Integer qty) {
//		try {
		System.out.println("addcart-Service 開始==================");
		// 判斷購物車某會員是否已經加入某商品至購物車
		ShoppingCartBean shoppingCartBean = shoppingCartDao.hasCart(memberId, itemId);
		if (shoppingCartBean == null) {

			shoppingCartBean = new ShoppingCartBean();
			shoppingCartBean.setS_ordQty(qty);
			shoppingCartBean.setItemBean(shoppingCartDao.getItemBeanByItemId(itemId));
			shoppingCartBean.setMemberBean(shoppingCartDao.getMemberBeanBymId(memberId));

			shoppingCartDao.addShoppingCart(shoppingCartBean);
			return "0";

		} else { // 購物車裡面已經存在會員id 與 產品id
			shoppingCartBean.setS_ordQty(shoppingCartBean.getS_ordQty() + qty); // 傳來的數量加上最原本的
			System.out.println("addcart-Service 完成==================");
			return "1";
		}
//
//			// 創建購物車
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

	}

	@Transactional
	@SuppressWarnings("null")
	@Override
	public List<SessionShoppingCartVo> getShoppingCartVo(Map<Integer, Integer> cartlist) {

//		// 如果找不到ShoppingCart清單
//		if (cartlist == null) {
//			cartlist = new LinkedHashMap<>();
//			if (itemQty == null) {
//				cartlist.put(itemId, 1);
//			} else {
//				cartlist.put(itemId, itemQty);
//			}
//		} else {
//			if (itemQty == null) {
//				cartlist.put(itemId, 1);
//			} else {
//				cartlist.put(itemId, itemQty);
//			}
//		}

		
		 Integer key = null;
		 List<SessionShoppingCartVo> sscList = new LinkedList<>();
		
		 Iterator<Integer> iter = cartlist.keySet().iterator();
		  while(iter.hasNext()){
			  key=iter.next();
			  Integer value = cartlist.get(key);
		   System.out.println("keyvalue==========="+key+" : "+value);
		
		
//		int i;

//		for (i = 0; i < (cartlist.size() - 1); i++) {
			SessionShoppingCartVo ssc = new SessionShoppingCartVo();
			ItemBean newItemBean = shoppingCartDao.getItemBeanByItemId(key);

			System.out.println("newItemBean=========" + newItemBean);
			ssc.setItemHeader(newItemBean.getItemHeader());
			ssc.setItemPrice(newItemBean.getItemPrice());
			ssc.setItemPic1(newItemBean.getItemPic1());
			ssc.setScQty(value);

			sscList.add(ssc);
//		}
		  }
		System.out.println("cartlistSE===================="+cartlist);
		System.out.println("sscListSE================="+sscList);
		
		return sscList;
		
//		return null;
	}

}
