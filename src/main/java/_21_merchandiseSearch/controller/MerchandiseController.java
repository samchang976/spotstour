package _21_merchandiseSearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MerchandiseController {

	@RequestMapping("/merchandiseIndex")
	public String AddMerchandise() {
		return "_21_shoppingMall/MerchandiseIndex";
	}
	
}
