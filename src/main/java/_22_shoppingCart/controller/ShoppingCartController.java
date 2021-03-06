package _22_shoppingCart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import _02_model.entity.MemberBean;
import _02_model.entity.OrdBean;

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
	
	@RequestMapping("MerchandiseDetail")
	public String getMerchandiseDetail() {
		return "_21_shoppingMall/MerchandiseDetail";
	}
	
	@RequestMapping("ShoppingCart")
	public String getShoppingCart() {
		return "_21_shoppingMall/ShoppingCart";
	}
	
	@RequestMapping("SelectPayment")
	public String getSelectPayment() {
		return "_21_shoppingMall/SelectPayment";
	}
	
	@RequestMapping("PurchaseSuccess")
	public String getPurchaseSuccess() {
		return "_21_shoppingMall/PurchaseSuccess";
	}
	
	@RequestMapping("MyOrderList")
	public String getMyOrderList() {
		return "_21_shoppingMall/MyOrderList";
	}
	
	@RequestMapping("MerchandiseIndex")
	public String getMerchandiseIndex() {
		return "_21_shoppingMall/MerchandiseIndex";
	}
	
	
	
	// 取得OrdBean
	@ModelAttribute
	public OrdBean getOrdBean(Model model) {
		OrdBean ordBean = new OrdBean();
		model.addAttribute("ordBean", ordBean);
		return ordBean;
	}
	//=====================================================================
	
	@GetMapping("ShowCartContent") //會員才有存在資料庫的購物車內容
	protected String showCartContent(Model model, SessionStatus status) {
		MemberBean memberBean = (MemberBean) model.getAttribute("mPid"); //會員權限 2:會員
		if (memberBean == null) {
			//使用 @SessionAttributes，Spring 無法知道什麼時候要清掉 @SessionAttributes 存進去的資料
			//告知spring什麼時候要清掉session
			status.setComplete();
			return "redirect:/login"; //通知瀏覽器發出新請求
		}
		return  "_21_shoppingMall/ShoppingCart";
	}
	
}