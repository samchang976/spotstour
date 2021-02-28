package _91_managerMart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.CountryBean;
import _02_model.entity.FeedbackBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _91_managerMart.service.ManagerItemService;

@Controller
public class ManagerController {

	@Autowired
	ManagerItemService managerItemService;

//	@GetMapping("/merchandiseModify")
//	public String addeMrchandise(Model model) {
//	@GetMapping({"/merchandiseModify","/merchandiseModify/get/Id={itemId}"})
	
	// 陳列商品
	@GetMapping({"/merchandiseModify","/Id={itemId}"})
		public String addeMrchandise(@PathVariable(value="itemId", required = false) Integer itemId, Model model) {
		List<ItemBean> list = managerItemService.getAllItems();
		model.addAttribute("items", list);
		return "_91_manageMart/MerchandiseModify";
	}

	// 新增商品
	@PostMapping("/merchandiseModify")
	public String processAddNewMrchandiseForm(@ModelAttribute("itemBean") ItemBean ib, Model model) {
		managerItemService.addItem(ib);
		return "redirect:/merchandiseModify";
	}

	// 凍結商品(刪除)
	@RequestMapping("/merchandiseModify/delete/Id={itemId}")
	public String freezeItem(@ModelAttribute("itemId") Integer itemId, Model model) {
		managerItemService.freezeItemByItemId(itemId);
		return "redirect:/merchandiseModify";
	}

	// 編輯及更新商品
//	@PostMapping("/merchandiseModify/get/Id={itemId}")
	@PostMapping("/Id={itemId}")
	public String updateItem(@ModelAttribute(value="itemId") Integer itemId, @ModelAttribute("itemBean") ItemBean itemBeanN, Model model) {
		
		managerItemService.updateItem(itemBeanN);
		return "redirect:/merchandiseModify";
	}
	
	//編輯商品留言
	@RequestMapping("/manageFeedback")
	public String manageFeedback(Model model) {
		List<FeedbackBean> list = managerItemService.getAllFeedbacks();
		model.addAttribute("feedbacks", list);
		return "_91_manageMart/ManageFeedback";
	}

	@ModelAttribute("item_TypeMap")
	public Map<Integer, String> getItem_TypeMap() {
		Map<Integer, String> item_TypeMap = new HashMap<>();
		List<Item_typeBean> list = managerItemService.getItem_TypeList();
		for (Item_typeBean itb : list) {
			item_TypeMap.put(itb.getItId(), itb.getItemType());
		}
		return item_TypeMap;
	}

	@ModelAttribute("item_TypeList")
	public List<Item_typeBean> getItem_TypeList() {
		return managerItemService.getItem_TypeList();
	}

	@ModelAttribute("countryMap")
	public Map<Integer, String> getCountryMap() {
		Map<Integer, String> countryMap = new HashMap<>();
		List<CountryBean> list = managerItemService.getCountryList();
		for (CountryBean itb : list) {
			countryMap.put(itb.getCountryId(), itb.getCountryName());
		}
		return countryMap;
	}

	@ModelAttribute("countryList")
	public List<CountryBean> getCountryList() {
		return managerItemService.getCountryList();
	}

	// 取得商品
	@ModelAttribute
	public ItemBean getItemBean(@PathVariable(value = "itemId", required = false) Integer itemId, Model model) {
		ItemBean itemBean = null;
		if (itemId != null) {
			itemBean = managerItemService.getItemByItemId(itemId);
			Item_typeBean item_typeBean = itemBean.getItem_typeBean();
			CountryBean countryBean = itemBean.getCountryBean();
			model.addAttribute("item_typeBean", item_typeBean);
			model.addAttribute("countryBean", countryBean);
			
		} else {
			itemBean = new ItemBean();
			itemBean.setItemHeader("AA");
			itemBean.setItemPrice(20);
			itemBean.setItemQty(10);
			itemBean.setItemDes("AAAA");
			itemBean.setItem_freeze(0);
			model.addAttribute("itemBean", itemBean);
		}
		return itemBean;
	}
}
