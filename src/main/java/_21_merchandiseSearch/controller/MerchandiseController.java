package _21_merchandiseSearch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _21_merchandiseSearch.service.ItemService;

@Controller
public class MerchandiseController {

	@Autowired
	ItemService itemService;

	@GetMapping("/merchandiseIndex")
	public String getAllCountry(Model model) {
		List<CountryBean> list = itemService.getAllCountrys();
		model.addAttribute("countrys", list);
		return "_21_shoppingMall/MerchandiseIndex";
	}

	@RequestMapping("/activityDetail")
	public String activityDetail() {
		return "_21_shoppingMall/ActivityDetail";
	}

	@RequestMapping("merchandiseDetail")
	public String merchandiseDetail() {
		return "_21_shoppingMall/MerchandiseDetail";
	}

	@RequestMapping("merchandiseSearchResult")
	public String merchandiseSearchResult() {
		return "_21_shoppingMall/MerchandiseSearchResult";
	}

//	// 陳列商品
//	@GetMapping("/manageFeedback/Id={itemId}")
//	public String getItemsByCountry(@ModelAttribute("itemId") Integer itemId, Model model) {
//		List<FeedbackBean> list = managerItemService.getAllFeedbacksById(itemId);
//		model.addAttribute("feedbacks", list);
//		return "_91_manageMart/ManageFeedback";
//	}

//	@ModelAttribute("countryList")
//	public List<CountryBean> getCountryList() {
//		return itemService.getCountryList();
//	}

	// 取得國家
	@ModelAttribute
	public CountryBean getCountryBean(Model model) {
		CountryBean countryBean = null;
		countryBean = new CountryBean();
		model.addAttribute("countryBean", countryBean);
		return countryBean;
	}

}
