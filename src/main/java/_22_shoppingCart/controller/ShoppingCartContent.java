package _22_shoppingCart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.entity.MemberBean;
import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;
import _22_shoppingCart.service.ShoppingCartService;

@Controller
@SessionAttributes({"LoginOK","Login","mId","hasItem"})
public class ShoppingCartContent {

	public ShoppingCartContent() {

	}

	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	shoppingCartDao shoppingCartDao;
//查詢購物車內容====================================================================================
	@GetMapping("shoppingCart")
	public String list(Model model) {
		List<ShoppingCartBean> list = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); //先從service拿資料
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
	
//修改購物車商品數量
//	@PostMapping("/shoppingCart/put")
//	public String updateQty(
//			@ModelAttribute("sc_Id") Integer sc_Id,
//			@ModelAttribute("cartBean") ShoppingCartBean cartbean,
//			Model model
//			) {
//		System.out.println("Put===================================================");
//		System.out.println("sc_Id="+sc_Id);
//		System.out.println("s_ordQty="+cartbean);
//		shoppingCartService.UpdateQty(sc_Id, cartbean);
//		System.out.println("Put===================================================");
//		return "redirect:/shoppingCart";
//		
//	}
//=======================================================================================	
//取得購物車單項商品內容
//	@ModelAttribute
//	public ShoppingCartBean getShoppingCartBean(
//			@PathVariable(value = "sc_Id", required = false) Integer sc_Id, 
//			Model model) {
//		ShoppingCartBean shoppingCartBean = null;
//		//有sc_Id
//		if (sc_Id != null) {
//			shoppingCartBean = shoppingCartService.getShoppingCartBysc_Id(sc_Id);
//			model.addAttribute("shoppingCartBean", shoppingCartBean);
//		} else {
//		//沒有sc_Id
//			 shoppingCartBean = new ShoppingCartBean();
//			model.addAttribute("ShoppingCartBean", shoppingCartBean);
//		}
//		return shoppingCartBean;
//	}
	
	//編輯及更新
//	@PostMapping("/shoppingCart/{sc_Id}/{itemPrice}/{itemQty}/{mId}")
//	public String updateItem(@ModelAttribute(value = "sc_Id") Integer sc_Id,
//			@ModelAttribute("shoppingCartBean") ShoppingCartBean shoppingCartBean, Model model) {
//		shoppingCartService.UpdateQty(shoppingCartBean);
//		return "redirect:/shoppingCart";
//	}
	@Transactional
	@PostMapping("shoppingCart/updateQty")
	public String updateItem(
			@RequestParam("sc_Id") Integer sc_Id,
			@RequestParam("s_ordQty") Integer s_ordQty,
			@RequestParam("mId")Integer mId,
			@RequestParam("itemId")Integer itemId,
			Model model) {
		System.out.println("更新controller============================");
		ShoppingCartBean shoppingCartBean = new ShoppingCartBean();
//		sc_Id=(String) model.getAttribute(sc_Id);
//		s_ordQty=(String) model.getAttribute(s_ordQty);
		shoppingCartBean.setSc_Id(sc_Id);
//		System.out.println(sc_Id);
		shoppingCartBean.setS_ordQty(s_ordQty);
		shoppingCartBean.setMemberBean(shoppingCartDao.getMemberBeanBymId(mId));
		shoppingCartBean.setItemBean(shoppingCartDao.getItemBeanByItemId(itemId));
		shoppingCartService.UpdateQty(shoppingCartBean);
		System.out.println("更新controller============================");
		return "redirect:/shoppingCart";
	}
	
	//加入購物車
	@Transactional
	@PostMapping({"shoppingCart/add/{itemId}","/merchandiseSearchResult/shoppingCart/add/{itemId}"})
	public String addShoppingCart(
			@PathVariable("itemId")Integer itemId,
			Model model) {
		//1.判斷用戶是否存在
				Integer member = (Integer) model.getAttribute("mId");
				System.out.println(member);
				if( member == null) { //1:管理員 2:會員
					return "redirect:/login";
					
				}
//		Integer a = (Integer) model.getAttribute("mId");
//		System.out.println("ABCDE"+a);
		ShoppingCartBean shoppingCartBean = new ShoppingCartBean();
		shoppingCartBean.setS_ordQty(1);
		shoppingCartBean.setItemBean(shoppingCartDao.getItemBeanByItemId(itemId));
		shoppingCartBean.setMemberBean(shoppingCartDao.getMemberBeanBymId((Integer) model.getAttribute("mId")));
		shoppingCartService.addShoppingCart(shoppingCartBean);
		return "redirect:/shoppingCart";
	}
	
	
	//加入購物車有傳數量的===>商品詳細資訊那邊
	@PostMapping("/shoppingCart/addQty/{itemId}")
	public String creatCart(
			Model model,
			@PathVariable("itemId") Integer itemId,
			@RequestParam("qty") Integer qty
			) throws ServletException, IOException {
		System.out.println("addcart============================");
		//1.判斷用戶是否存在
		Integer member = (Integer) model.getAttribute("mId");
		System.out.println(member);
		if( member == null) { //1:管理員 2:會員
			return "redirect:/login";
			
		}

		//創建購物車(傳入會員編號, 產品編號, 數量)
		String hasItem = shoppingCartService.addToCart(member, itemId, qty);
		model.addAttribute("hasItem", hasItem);
		System.out.println(member);
		System.out.println("addcart============================");
		return "redirect:/shoppingCart";
		
	
}
}