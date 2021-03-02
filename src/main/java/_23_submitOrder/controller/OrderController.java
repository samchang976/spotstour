package _23_submitOrder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.OrdBean;

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
	
	@RequestMapping("submitOrderInfo")
	public String getsubmitOrderInfo() {
		return "_21_shoppingMall/SubmitOrderInfo";
	}
	
	// 取得OrdBean
	@ModelAttribute
	public OrdBean getOrdBean(Model model) {
		OrdBean ordBean = new OrdBean();
		model.addAttribute("ordBean", ordBean);
		return ordBean;
	}
	
}