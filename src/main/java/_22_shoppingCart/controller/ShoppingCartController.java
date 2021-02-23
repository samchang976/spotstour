package _22_shoppingCart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShoppingCartController {

	@RequestMapping("/shoppingCart")
	public String shoppingCart() {
		return "_21_shoppingMall/ShoppingCart";
	}
	
	@RequestMapping("/ActivityDetail")
	public String getActivityDetail() {
		return "_21_shoppingMall/ActivityDetail";
	}
	
	@RequestMapping("MerchandiseSearchResult")
	public String getSearchResult() {
		return "_21_shoppingMall/MerchandiseSearchResult";
	}
	
	@RequestMapping("MerchandiseDetail")
	public String getMerchandiseDetail() {
		return "_21_shoppingMall/MerchandiseDetail";
	}
	
	@RequestMapping("ShoppingCart")
	public String getShoppingCart() {
		return "_21_shoppingMall/ShoppingCart";
	}
	
	@RequestMapping("SelectPayment")
	public String getSelectPayment() {
		return "_21_shoppingMall/SelectPayment";
	}
	
	@RequestMapping("PurchaseSuccess")
	public String getPurchaseSuccess() {
		return "_21_shoppingMall/PurchaseSuccess";
	}
	
	@RequestMapping("MyOrderList")
	public String getMyOrderList() {
		return "_21_shoppingMall/MyOrderList";
	}
	
	@RequestMapping("MerchandiseIndex")
	public String getMerchandiseIndex() {
		return "_21_shoppingMall/MerchandiseIndex";
	}
	
}