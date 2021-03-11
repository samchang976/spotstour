package _23_submitOrder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _21_merchandiseSearch.service.ItemService;
import _23_submitOrder.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	ItemService itemService;

	// 陳列所有訂單
	@RequestMapping("/myOrderList")
	public String myOrderList(Model model) {
		List<OrdBean> list = orderService.getAllOrders();
		model.addAttribute("orders", list);
		return "_21_shoppingMall/MyOrderList";
	}

	@RequestMapping({"/orderDetail/Id={ord_Id}"})
	public String orderDetail(@ModelAttribute("ord_Id") @PathVariable("ord_Id") Integer ord_Id, Model model) {
		List<Ord_detailBean> list = orderService.getAllOrd_detailsByOrd_Id(ord_Id);
		model.addAttribute("ord_details", list);
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

	@RequestMapping("/submitOrderInfo/Id={ord_Id}")
	public String getsubmitOrderInfo(@ModelAttribute("ord_Id") @PathVariable("ord_Id") Integer ord_Id, Model model) {
		List<Ord_detailBean> list = orderService.getAllOrd_detailsByOrd_Id(ord_Id);
		model.addAttribute("ord_details", list);
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
	
	// 取得Ship_TypeBean
	@ModelAttribute
	public Ship_TypeBean getShip_TypeBean(Model model) {
		Ship_TypeBean ship_TypeBean = new Ship_TypeBean();
		model.addAttribute("ship_TypeBean", ship_TypeBean);
		return ship_TypeBean;
	}
	
	// 取得配送方式
	@ModelAttribute("ship_TypeMap")
	public Map<Integer, String> getShip_TypeMap() {
		Map<Integer, String> ship_TypeMap = new HashMap<>();
		List<Ship_TypeBean> list = itemService.getShip_TypeList();
		for (Ship_TypeBean stb : list) {
			ship_TypeMap.put(stb.getShipTypeId(), stb.getShipType());
		}
		return ship_TypeMap;
	}
	
	// 取得發票領取方式
	@ModelAttribute("receipt_TypeMap")
	public Map<Integer, String> getReceipt_TypeMap() {
		Map<Integer, String> receipt_TypeMap = new HashMap<>();
		List<Receipt_TypeBean> list = itemService.getReceipt_TypeList();
		for (Receipt_TypeBean rtb : list) {
			receipt_TypeMap.put(rtb.getReceiptTypeId(), rtb.getReceiptType());
		}
		return receipt_TypeMap;
	}

}