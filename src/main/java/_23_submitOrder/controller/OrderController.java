package _23_submitOrder.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Ord_detailBean;
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

	@RequestMapping("/orderDetail/Id={ord_Id}")
	public String orderDetail(@ModelAttribute("ord_Id") @PathVariable("ord_Id") Integer ord_Id, Model model) {
		List<Ord_detailBean> list = orderService.getAllOrd_detailsByOrd_Id(ord_Id);
//		Iterator iterator = list.iterator();
//		int a = list.size();
//		int counts = 0;
//		while (iterator.hasNext()) {
//			System.out.println(iterator.next());
//			Ord_detailBean s = (Ord_detailBean) iterator.next();
//			counts += (s.getOrdQty() * s.getItemBean().getItemPrice());
//		}
		model.addAttribute("ord_details", list);
//		model.addAttribute("counts", counts);
//		model.addAttribute("a", a);
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

	// ====================

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