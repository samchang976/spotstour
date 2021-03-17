package _22_shoppingCart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import _02_model.entity.ShoppingCartBean;
import _22_shoppingCart.dao.shoppingCartDao;
import _22_shoppingCart.service.ShoppingCartService;
import _22_shoppingCart.vo.SessionShoppingCartVo;

@Controller
@SessionAttributes({ "sessionShoppingCart", "sessionShoppingCartList" })

public class SessionShoppingCartSaveController {

	public SessionShoppingCartSaveController() {
	}

	@Autowired
	ShoppingCartService shoppingCartService;

//	@Autowired
//	shoppingCartDao shoppingCartDao;

	// 存session===================================================================================
	@SuppressWarnings("unchecked")
	@Transactional
	@GetMapping("/shoppingCart/sessionCartSave")
	public String sessionCartSave(Model model, HttpSession session, SessionStatus status) {
		// 訪客=>導向登入頁面
		Integer member = (Integer) session.getAttribute("mPid");
		System.out.println(member);

		if (member == null) { // 1:管理員 2:會員
			return "redirect:/login";
		}
		// 會員
		if (member == 2) { // 1:管理員 2:會員
//			List<SessionShoppingCartVo> sscList = (List<SessionShoppingCartVo>) model
//					.getAttribute("sessionShoppingCartList");
//			if (sscList != null) {
//				for (int i = 0; i < sscList.size(); i++) {
//					SessionShoppingCartVo vo = sscList.get(i);
//					ShoppingCartBean shoppingCartBean = new ShoppingCartBean();
//					shoppingCartBean.setItemBean(shoppingCartDao.getItemBeanByItemId(vo.getItemId()));
//					shoppingCartBean.setS_ordQty(vo.getScQty());
//					shoppingCartBean
//							.setMemberBean(shoppingCartDao.getMemberBeanBymId((int) session.getAttribute("mId")));
					
//					shoppingCartService.addShoppingCart(shoppingCartBean);

//				}
				// 存進資料庫後，把sessionCart清單清空
//			shoppingCartService.sessionCartSave(sscList, (int) session.getAttribute("mId"));
//			status.setComplete(); 
			
//session跟model控管的session好像不太一樣=========================================================================			
//			session.removeAttribute("sessionShoppingCartList");
//			session.removeAttribute("cartlist");
				
//好像不能直接涉null值===========================================================================================				
//			sscList = null;
//			model.addAttribute("sessionShoppingCartList",sscList);
//								
//			Map<Integer, Integer> cartlist = (Map<Integer, Integer>) model.getAttribute("sessionShoppingCart");
//			cartlist = null;
//			model.addAttribute("sessionShoppingCart",cartlist);
//			
//			System.out.println("sscList=============="+sscList+"cartlist================"+cartlist);
//		}
			return "redirect:/shoppingCart";
		}
		return null;

	}
}