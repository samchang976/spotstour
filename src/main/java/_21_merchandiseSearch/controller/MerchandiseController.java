package _21_merchandiseSearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MerchandiseController {

	@RequestMapping("/merchandiseIndex")
	public String searchMerchandise() {
		return "_21_shoppingMall/MerchandiseIndex";
	}

	@RequestMapping("/aboutMerchandise")
	public String aboutMerchandise() {
		return "_21_shoppingMall/AboutMerchandise";
	}
	
	@RequestMapping("/activityDetail")
	public String activityDetail() {
		return "_21_shoppingMall/ActivityDetail";
	}
	
	@RequestMapping("merchandiseDetail")
	public String merchandiseDetail() {
		return "_21_shoppingMall/MerchandiseDetail";
	}
	
	@RequestMapping("merchandiseSearchResult")
	public String merchandiseSearchResult() {
		return "_21_shoppingMall/MerchandiseSearchResult";
	}
	
}
