package _23_submitOrder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("/myOrderList")
	public String myOrderList() {
		return "_21_shoppingMall/MyOrderList";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		return "_21_shoppingMall/OrderDetail";
	}
	
	@RequestMapping("/purchaseSuccess")
	public String purchaseSuccess() {
		return "_21_shoppingMall/PurchaseSuccess";
	}
	
	@RequestMapping("/selectPayment")
	public String selectPayment() {
		return "_21_shoppingMall/SelectPayment";
	}
	
	
}