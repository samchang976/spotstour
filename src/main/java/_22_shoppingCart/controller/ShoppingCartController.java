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
	
}