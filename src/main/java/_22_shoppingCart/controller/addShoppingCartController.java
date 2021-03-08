//package _22_shoppingCart.controller;
//
//import java.io.IOException;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//import _02_model.entity.ItemBean;
//import _02_model.entity.MemberBean;
//import _02_model.entity.ShoppingCartBean;
//
////當使用者按下『加入購物車』時，瀏覽器會送出請求到本程式
//@Controller
//@SessionAttributes({ "LoginOK", "ItemId" })
//public class addShoppingCartController {
//
//	@PostMapping("/addShoppingCart.do") // 按下加入購物車
//	String addCart(Model model, // 傳遞資料用
//			@RequestParam("ItemId") Integer ItemId, // 讀取前端送來的資料
//			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
////如果是登入中的會員==>購物車清單存到資料庫
////如果未登入	   ==>購物車清單存到session
//
////		從session取出
//		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");// 如何判斷會員權限??
//		if (memberBean == null) {
//
//		}
//		// 只要舊的session物件
//		HttpSession session = request.getSession(false);
//		if (session == null) {}
////===========================================================================================		
//		// 取出存放在session物件內的ShoppingCart物件
//		ShoppingCartBean shoppingcart = (ShoppingCartBean) model.getAttribute("ShoppingCart");
//		// 如果找不到ShoppingCart物件
//		if (shoppingcart == null) {
//			// 就新建ShoppingCart物件
//			shoppingcart = new ShoppingCartBean(shoppingcart.getItemBean());
//			// 並將此新建ShoppingCart的物件放到session物件內，成為它的屬性物件
//			model.addAttribute("ShoppingCart", shoppingcart);
//		}
////===========================================================================================
//	
//		Map<Integer, ItemBean> itemMap = (Map<Integer, ItemBean>) model.getAttribute("ItemId"); 
//		
//		ItemBean itemBean = itemMap.get(ItemId);
//		
//		shoppingcart.setItemBean(itemBean);
//	
//		return null;
//	}
//}
