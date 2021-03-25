package _22_shoppingCart.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import _02_model.entity.ItemBean;
import _02_model.entity.ShoppingCartBean;
import _21_merchandiseSearch.dao.ItemDao;
import _22_shoppingCart.dao.shoppingCartDao;
import _22_shoppingCart.service.ShoppingCartService;
import _22_shoppingCart.vo.SessionShoppingCartVo;

@Controller
@SessionAttributes({ "LoginOK", "Login", "mId", "hasItem", "sessionShoppingCart","sessionShoppingCartList" })
public class ShoppingCartContent {

	public ShoppingCartContent() {

	}

	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	shoppingCartDao shoppingCartDao;

	@Autowired
	ItemDao itemDao;

//查詢購物車內容====================================================================================
	@GetMapping("shoppingCart")
	public String list(Model model) {
		List<ShoppingCartBean> list = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); // 先從service拿資料
		model.addAttribute("cart", list); // 放到model內
		model.addAttribute("cartSize", list.size()); // 放到model內
//		System.out.println("controller================================================");
//		System.out.println(list);
//		System.out.println("controller================================================");

		return "_21_shoppingMall/ShoppingCart";
	}

//刪除購物車內一項商品

	@PostMapping("/shoppingCart/delete/Id={sc_Id}")
	public String deleteCartItem(@PathVariable("sc_Id") Integer sc_Id) {
//		System.out.println("Delete===================================================");
		System.out.println(sc_Id);
		shoppingCartService.deleteItem(sc_Id);
//		System.out.println("Delete===================================================");
		return "redirect:/shoppingCart";
	}

	//多選刪除
//	@PostMapping("/shoppingCart/delete/Id={sc_Id}")
//	public String deleteCartMore(@PathVariable("sc_Id") Integer[] sc_Id) {
//		未完成
//		return "redirect:/shoppingCart";
//	}
//	
	//側邊購物車刪除========================================================================
	@GetMapping("/shoppingCart/delete/Id={sc_Id}")
	public String memberdeleteCartItemInSideCart(@PathVariable("sc_Id") Integer sc_Id) {
//		System.out.println(sc_Id);
		shoppingCartService.deleteItem(sc_Id);
		return "redirect:/merchandiseSearchResult";
	}

//=======================================================================================	
	@Transactional
	@PostMapping("shoppingCart/updateQty")
	public String updateItem(@RequestParam("sc_Id") Integer sc_Id, @RequestParam("s_ordQty") Integer s_ordQty,
			@RequestParam("mId") Integer mId, @RequestParam("itemId") Integer itemId, Model model) {
//		System.out.println("更新controller============================");
		ShoppingCartBean shoppingCartBean = new ShoppingCartBean();
//		sc_Id=(String) model.getAttribute(sc_Id);
//		s_ordQty=(String) model.getAttribute(s_ordQty);
		shoppingCartBean.setSc_Id(sc_Id);
//		System.out.println(sc_Id);
		shoppingCartBean.setS_ordQty(s_ordQty);
		shoppingCartBean.setMemberBean(shoppingCartDao.getMemberBeanBymId(mId));
		shoppingCartBean.setItemBean(shoppingCartDao.getItemBeanByItemId(itemId));
		shoppingCartService.UpdateQty(shoppingCartBean);
//		System.out.println("更新controller============================");
		return "redirect:/shoppingCart";
	}

	// 加入購物車:加入會員才能購物
	@Transactional
	@PostMapping({ "shoppingCart/add/{itemId}", "/merchandiseSearchResult/shoppingCart/add/{itemId}" })
	public String addShoppingCart(@PathVariable("itemId") Integer itemId, Model model) throws InterruptedException {
		// 1.判斷用戶是否存在
		Integer member = (Integer) model.getAttribute("mId");
		System.out.println(member);
		if (member == null) { // 1:管理員 2:會員
			return "redirect:/login";
		}
//		Integer a = (Integer) model.getAttribute("mId");
//		System.out.println("ABCDE"+a);
//		ShoppingCartBean shoppingCartBean = new ShoppingCartBean();
//		shoppingCartBean.setS_ordQty(1);
//		shoppingCartBean.setItemBean(shoppingCartDao.getItemBeanByItemId(itemId));
//		shoppingCartBean.setMemberBean(shoppingCartDao.getMemberBeanBymId((Integer) model.getAttribute("mId")));
//		
		String hasItem = shoppingCartService.addToCart(member, itemId, 1);
//		model.addAttribute("hasItem", hasItem); // 存入session

//		shoppingCartService.addShoppingCart(shoppingCartBean);
//		return "redirect:/shoppingCart";
//		Thread.sleep(2000);
		return "redirect:/merchandiseSearchResult";

	}

	// 加入購物車有傳數量的===>商品詳細資訊那邊:加入會員才能購物
	@PostMapping("/shoppingCart/addQty/{itemId}")
	public String addShoppingCartHaveQty(Model model, @PathVariable("itemId") Integer itemId,
			@RequestParam("itemQty") Integer itemQty) throws ServletException, IOException {
		System.out.println("addcart============================");
		// 1.判斷用戶是否存在
		Integer member = (Integer) model.getAttribute("mId");
		System.out.println(member);
		if (member == null) { // 1:管理員 2:會員
			return "redirect:/login";

		}

		// 2.創建購物車(傳入會員編號, 產品編號, 數量)
		String hasItem = shoppingCartService.addToCart(member, itemId, itemQty);
		model.addAttribute("hasItem", hasItem);
//		System.out.println(member);
//		System.out.println("addcart============================");
		return "redirect:/shoppingCart";

	}

	//訪客購物車=========================================================================================
	@SuppressWarnings("unchecked")
	@PostMapping("/shoppingCart/visitor/{cmd}") /// {cmd}判斷
	public String VisitorAdd(Model model, 
			@RequestParam("itemId") Integer itemId,
			@RequestParam(value="itemQty" ,required=false) Integer itemQty,
			@PathVariable("cmd") String cmd
	) {
		System.out.println("訪客加入購物車開始===================================");
		// Session內的購物車商品id清單
		Map<Integer, Integer> cartlist = (Map<Integer, Integer>) model.getAttribute("sessionShoppingCart");
		
		//刪除
		if(cmd.equalsIgnoreCase("del")) {
//			System.out.println("這是刪除的=========");
			if ( cartlist.get(itemId) != null ) {
				cartlist.remove(itemId);  // Map介面的remove()方法}
			}
			
			model.addAttribute("sessionShoppingCart", cartlist);
//			System.out.println("移除後的cartlist===================================="+cartlist);
		}
		//========================================================================================
		//新增
		if(cmd.equalsIgnoreCase("add")) {
		// 如果找不到ShoppingCart清單
		if (cartlist == null) {
			cartlist = new LinkedHashMap<>();
			System.out.println(itemQty);
			if (itemQty == null) {
				cartlist.put(itemId, 1);
			} else {
				cartlist.put(itemId, itemQty);
			}
			model.addAttribute("sessionShoppingCart", cartlist);
			System.out.println(cartlist);
			System.out.println(itemQty);
		//有:加上商品
		} else {
			if (itemQty == null) {
				cartlist.put(itemId, 1);
			} else {
				cartlist.put(itemId, itemQty);
				model.addAttribute("sessionShoppingCart", cartlist);
			}
		}
		}
//		int i;
//		List<SessionShoppingCartVo> sscList = null;
//		SessionShoppingCartVo ssc = null;
//		
//		for(i= 0;i<(cartlist.size()-1);i++) {
//		ItemBean newItemBean = shoppingCartDao.getItemBeanByItemId(itemId);
//		
//		ssc.setItemHeader(newItemBean.getItemHeader());
//		ssc.setItemPrice(newItemBean.getItemPrice());
//		ssc.setItemPic1(newItemBean.getItemPic1());
//		ssc.setScQty(itemQty);
//		
//		sscList.add(ssc);
//		}

		List<SessionShoppingCartVo> sscList = shoppingCartService.getShoppingCartVo(cartlist);
//		model.addAttribute("sessionShoppingCart", cartlist);
//		System.out.println("cartlist===================="+cartlist);
		model.addAttribute("sessionShoppingCartList", sscList);
//		System.out.println("sscList================="+sscList);
		
		System.out.println("訪客加入購物車結束===================================");
		return "redirect:/merchandiseSearchResult";
	}
	
	//多選刪除
	@PostMapping("/shoppingCart/MultipleDelete}") 
		public String MultipleDelete(
			@RequestParam("deleteItems") Integer[] deleteItems){
		for(int i=0;i<deleteItems.length;i++) {
			shoppingCartService.deleteItem(i);
		}
		return null;
		
	}
}