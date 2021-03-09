package _22_shoppingCart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.service.ShoppingCartService;

@Controller
public class ShoppingCartContent {

	public ShoppingCartContent() {

	}

	@Autowired
	ShoppingCartService shoppingCartService;
//查詢購物車內容====================================================================================
	@GetMapping("shoppingCart")
	public String list(Model model) {
		List<ShoppingCartBean> list = shoppingCartService.getShoppingCart(1); //先從service拿資料
		model.addAttribute("cart", list); //放到model內
		model.addAttribute("cartSize", list.size()); //放到model內
		
		System.out.println("controller================================================");
		System.out.println(list);
		System.out.println("controller================================================");
		
		
		return "_21_shoppingMall/ShoppingCart";
	}
	
//刪除購物車內一項商品
	@PostMapping("/shoppingCart/delete/Id={sc_Id}")
	public String deleteCartItem(@PathVariable("sc_Id") Integer sc_Id) {
		System.out.println("Delete===================================================");
		System.out.println(sc_Id);
		shoppingCartService.deleteItem(sc_Id);
		System.out.println("Delete===================================================");
		return "redirect:/shoppingCart";
	}
}
