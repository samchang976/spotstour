package _23_submitOrder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.ItemBean;
import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
import _23_submitOrder.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;

	// 陳列所有訂單
	@RequestMapping("/myOrderList")
	public String myOrderList(Model model) {
		List<OrdBean> list = orderService.getAllOrders();
		model.addAttribute("orders", list);
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
	
	@RequestMapping("/submitOrderInfo")
	public String getsubmitOrderInfo() {
		return "_21_shoppingMall/SubmitOrderInfo";
	}
	
	@RequestMapping("/checkPayment")
	public String getCheckPayment() {
		return "_21_shoppingMall/CheckPayment";
	}
	
	@RequestMapping("/testRequestBody")
	public String test(@RequestBody String body) {
		return "_21_shoppingMall/CheckPayment";
	}

	
	//====================
	
	// 取得OrdBean
	@ModelAttribute
	public OrdBean getOrdBean(Model model) {
		OrdBean ordBean = new OrdBean();
		model.addAttribute("ordBean", ordBean);
		return ordBean;
	}
	
	// 取得MemberBean
	@ModelAttribute
	public MemberBean getMemberBean(Model model) {
		MemberBean memberBean = new MemberBean();
		model.addAttribute("memberBean", memberBean);
		return memberBean;
	}
	
}