package _23_submitOrder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Ord_detailBean;
import _02_model.entity.Ord_statBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _02_model.entity.ShoppingCartBean;
import _21_merchandiseSearch.service.ItemService;
import _22_shoppingCart.service.ShoppingCartService;
import _23_submitOrder.mail.SendingOrderSuccessEmail;
import _23_submitOrder.service.OrderService;
import _23_submitOrder.vo.OrderVo;

@Controller
@SessionAttributes("orderVoNew")
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	ShoppingCartService shoppingCartService;

	// 陳列所有訂單
	@RequestMapping("/myOrderList")
	public String myOrderList(Model model, HttpSession session) {
		Integer mId = (Integer) session.getAttribute("mId");
		Integer mPid = (Integer) session.getAttribute("mPid");
		List<OrdBean> list = null;
		if(mPid == 1) {
			list = orderService.getAllOrders();
		}else {
			list = orderService.getAllOrdersByMemberId(mId);
		}
		model.addAttribute("orders", list);
		return "_21_shoppingMall/MyOrderList";
	}
	
	// 陳列訂單依出貨分類
//	@RequestMapping("/myOrderList/Id={0}")
//	public String myOrderListByOrderStat(Model model, HttpSession session) {
//		Integer mId = (Integer) session.getAttribute("mId");
//		Integer mPid = (Integer) session.getAttribute("mPid");
//		List<OrdBean> list = null;
//		if(mPid == 1) {
//			list = orderService.getAllOrders();
//		}else {
//			list = orderService.getAllOrdersByMemberId(mId);
//		}
//		model.addAttribute("orders", list);
//		return "_21_shoppingMall/MyOrderList";
//	}

	@RequestMapping({"/orderDetail/Id={ord_Id}"})
	public String orderDetail(@ModelAttribute("ord_Id") @PathVariable("ord_Id") Integer ord_Id, Model model) {
		List<Ord_detailBean> list = orderService.getAllOrd_detailsByOrd_Id(ord_Id);
		model.addAttribute("ord_details", list);
		return "_21_shoppingMall/OrderDetail";
	}

	// 立即結帳按鈕
	@RequestMapping("/selectPayment")
	public String selectPayment(Model model, HttpSession session){
		return "_21_shoppingMall/SelectPayment";
	}

	@RequestMapping("/submitOrderInfo")
	public String getsubmitOrderInfo(@ModelAttribute OrderVo orderVo, Model model, HttpSession session) {
		
		Integer memberId = (Integer)session.getAttribute("mId");
		
		orderVo.setmId(memberId);
		
		model.addAttribute("orderVoNew", orderVo);
		
		List<ShoppingCartBean> list = shoppingCartService.getShoppingCart(memberId);
		model.addAttribute("cart", list);
		
		
		SendingOrderSuccessEmail sendingOrderSuccessEmail = new SendingOrderSuccessEmail(orderVo.getmEmail(), orderVo.getmName(), memberId ,orderVo);
		sendingOrderSuccessEmail.sendAcceptMail();
		
		
		
		return "_21_shoppingMall/SubmitOrderInfo";
	}

	@RequestMapping("/purchaseSuccess")
	public String purchaseSuccess(@ModelAttribute OrderVo orderVoNew, Model model, HttpSession session) {
		
//		OrderVo orderVoNew = (OrderVo) model.getAttribute("orderVo");
//		orderVo.setmId((Integer)session.getAttribute("mId"));
		
//		orderVo.setmId((Integer)session.getAttribute("mId"));
//		orderService.addOrder(orderVo);
		
//		orderVoNew.setmId((Integer)session.getAttribute("mId"));
		orderService.addOrderVo((OrderVo) session.getAttribute("orderVoNew"));
		
		return "_21_shoppingMall/PurchaseSuccess";
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

	// 取得OrderVo
	@ModelAttribute
	public OrderVo getOrderVo(Model model) {
		OrderVo orderVo = new OrderVo();
		model.addAttribute("orderVo", orderVo);
		return orderVo;
	}
	
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
	
	// 取得訂單狀態
	@ModelAttribute("ordStatMap")
	public Map<Integer, String> getOrdStatMap() {
		Map<Integer, String> ordStatMap = new HashMap<>();
		List<Ord_statBean> list = orderService.getOrd_statList();
		for (Ord_statBean osb : list) {
			ordStatMap.put(osb.getoSid(), osb.getOrdStat());
		}
		return ordStatMap;
	}

}