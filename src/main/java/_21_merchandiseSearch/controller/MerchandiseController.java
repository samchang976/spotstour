package _21_merchandiseSearch.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_model.entity.ActivityBean;
import _02_model.entity.CountryBean;
import _02_model.entity.FeedbackBean;
import _02_model.entity.ItemBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
import _02_model.entity.ShoppingCartBean;
import _21_merchandiseSearch.service.ItemService;
import _22_shoppingCart.service.ShoppingCartService;
import _91_managerMart.service.ManagerActivityService;
import _91_managerMart.service.ManagerItemService;

@Controller
@SessionAttributes("mId")
public class MerchandiseController {

	@Autowired
	ItemService itemService;

	@Autowired
	ManagerItemService managerItemService;

	@Autowired
	ManagerActivityService managerActivityService;
	
	@Autowired
	ShoppingCartService shoppingCartService;

	@GetMapping("/merchandiseIndex")
	public String getAllCountry(Model model) {
		List<CountryBean> list = itemService.getAllCountrys();
		model.addAttribute("countrys", list);
		List<ActivityBean> listA = managerActivityService.getAllActivitys();
		model.addAttribute("activitys", listA);
		List<ItemBean> listTopSell = itemService.getTopSellItems(8);
		model.addAttribute("items", listTopSell);
		
		//shoppingcart
		Integer member = (Integer) model.getAttribute("mId");
		if(member != null) {
			List<ShoppingCartBean> cartlist = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); // 先從service拿資料
			model.addAttribute("membercartlist", cartlist);
		}
		return "_21_shoppingMall/MerchandiseIndex";
	}

//	@RequestMapping("/activityDetail")
//	public String activityDetail() {
//		return "_21_shoppingMall/ActivityDetail";
//	}

	// 得到所有商品
//	@RequestMapping("/merchandiseSearchResult")
//	public String merchandiseSearchResult(Model model) {
//		List<ItemBean> list = itemService.getAllItems();
//		model.addAttribute("items", list);
//		
//		
//		List<ShoppingCartBean> cartlist = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); // 先從service拿資料
//		model.addAttribute("membercartlist", cartlist);
//		System.out.println("cartlist================================="+cartlist);
//		
//		return "_21_shoppingMall/MerchandiseSearchResult";
//	}

	@RequestMapping("/merchandiseSearchResult/Id={countryId}")
	public String merchandiseSearchResultByCountryId(
			@PathVariable(value = "countryId", required = false) Integer countryId, Model model) {
		List<ItemBean> list = itemService.getItemByCountryId(countryId);
		model.addAttribute("items", list);
		
		//shoppingcart
		Integer member = (Integer) model.getAttribute("mId");
		if(member != null) {
			List<ShoppingCartBean> cartlist = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); // 先從service拿資料
			model.addAttribute("membercartlist", cartlist);
		}
		return "_21_shoppingMall/MerchandiseSearchResult";
	}

//	@RequestMapping("/merchandiseSearchResult/Id={countryId}")
//	public String merchandiseSearchResult(@PathVariable(value = "countryId", required = false) Integer countryId, Model model) {
//		List<ItemBean> list = itemService.getItemBySearch(countryId);
//		model.addAttribute("items", list);
//		return "_21_shoppingMall/MerchandiseSearchResult";
//	}

	// 得到單一商品
	@GetMapping({ "/merchandiseDetail/Id={itemId}" })
//	@GetMapping("/merchandiseDetail")
	public String getItemById(@ModelAttribute("itemId") Integer itemId, Model model) {
		ItemBean itemBean = itemService.getItemById(itemId);
		model.addAttribute("itemBean", itemBean);
		List<FeedbackBean> list = managerItemService.getAllFeedbacksById(itemId);
		model.addAttribute("feedbacks", list);
		
		Integer member = (Integer) model.getAttribute("mId");
		if(member != null) {
			List<ShoppingCartBean> cartlist = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); // 先從service拿資料
			model.addAttribute("membercartlist", cartlist);
		}
		return "_21_shoppingMall/MerchandiseDetail";
	}

	// 搜尋Bar
	@GetMapping("/merchandiseSearchResult")
	public String getItemBySearchBar(Model model, @ModelAttribute("searchWord") String searchWord, @RequestParam(value = "time", required = false, defaultValue="0") Integer time) {
		
		Set<ItemBean> list = itemService.getItemBySearchBar(searchWord, time);
		model.addAttribute("items", list);
		
		Integer member = (Integer) model.getAttribute("mId");
		if(member != null) {
			List<ShoppingCartBean> cartlist = shoppingCartService.getShoppingCart((Integer) model.getAttribute("mId")); // 先從service拿資料
			model.addAttribute("membercartlist", cartlist);
		}
		return "_21_shoppingMall/MerchandiseSearchResult";
	}

	// 新增商品留言
	@PostMapping("/merchandiseDetail/Id={itemId}")
	public String processAddNewFeedbackForm(@ModelAttribute("feedbackBean") FeedbackBean feedbackBean, Model model) {
		managerItemService.addFeedback(feedbackBean);
		return "redirect:/merchandiseDetail/Id={itemId}#fb";
	}
	
	


//	=====================

	// 取得ItemBean
	@ModelAttribute
	public ItemBean getItemBean(Model model) {
		ItemBean itemBean = new ItemBean();
		model.addAttribute("itemBean", itemBean);
		return itemBean;
	}

	// 取得Ship_TypeBean
	@ModelAttribute
	public Ship_TypeBean getShip_TypeBean(Model model) {
		Ship_TypeBean ship_TypeBean = new Ship_TypeBean();
		model.addAttribute("ship_TypeBean", ship_TypeBean);
		return ship_TypeBean;
	}

	// 取得OrdBean
	@ModelAttribute
	public OrdBean getOrdBean(Model model) {
		OrdBean ordBean = new OrdBean();
		model.addAttribute("ordBean", ordBean);
		return ordBean;
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

//	// 取得活動資訊
//	@ModelAttribute
//	public ActivityBean getActivityBean(@PathVariable(value = "activityId", required = false) Integer activityId, Model model) {
//		ActivityBean activityBean = null;
//			activityBean = managerActivityService.getActivityByActivityId(activityId);
//		return activityBean;
//	}

	// 商品留言
	@ModelAttribute
	public FeedbackBean getFeedbackBean(@PathVariable(value = "feedbackId", required = false) Integer feedbackId,
			@PathVariable(value = "itemId", required = false) Integer itemId, Model model) {
		FeedbackBean feedbackBean = null;
		feedbackBean = new FeedbackBean();
		feedbackBean.setItemTId(itemId);
		feedbackBean.setFeedbackText("推薦!!");
		feedbackBean.setFb_freeze(0);

		Date utilDate = new Date();// util.Date
		Timestamp sqlDate = new Timestamp(utilDate.getTime());
		feedbackBean.setF_createTime(sqlDate);

		model.addAttribute("feedbackBean", feedbackBean);
		return feedbackBean;
	}

}
