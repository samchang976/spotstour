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
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _91_managerMart.service.ManagerItemService;

@Controller
public class ManagerController {

	@Autowired
	ManagerItemService managerItemService;

//	@GetMapping("/merchandiseModify")
//	public String addeMrchandise(Model model) {
	@GetMapping({"/merchandiseModify","/merchandiseModify/get/Id={itemId}"})
		public String addeMrchandise(@PathVariable(value="itemId", required = false) Integer itemId, Model model) {
		List<ItemBean> list = managerItemService.getAllItems();
		model.addAttribute("items", list);
		return "_91_manageMart/MerchandiseModify";
	}

	@PostMapping("/merchandiseModify")
	public String processAddNewMrchandiseForm(@ModelAttribute("itemBean") ItemBean ib, Model model) {
		managerItemService.addItem(ib);
		return "redirect:/merchandiseModify";
	}

	// 凍結商品
	@RequestMapping("/merchandiseModify/delete/Id={itemId}")
	public String freezeItem(@ModelAttribute("itemId") Integer itemId, Model model) {
		managerItemService.freezeItemByItemId(itemId);
		return "redirect:/merchandiseModify";
	}

//	// 得到商品
//	@RequestMapping("/merchandiseModify/get/Id={itemId}")
//	public String getItem(@PathVariable("itemId") Integer itemId, Model model) {
////		ItemBean ib1 = managerItemService.getItemByItemId(itemId);
////		model.addAttribute("itemBean1", ib1);
//		return "redirect:/merchandiseModify";
//	}

	// 編輯及更新商品
	@PostMapping("/merchandiseModify/get/Id={itemId}")
	public String updateItem(@ModelAttribute(value="itemId") Integer itemId, Model model) {
		System.out.println("=========ABCDEF");
		
		ItemBean itemBean= managerItemService.getItemByItemId(itemId);
		System.out.println("=========ABCDE"+itemBean);
		managerItemService.updateItem(itemBean);
		return "redirect:/merchandiseModify";
	}

	@RequestMapping("/activityList")
	public String activityList() {
		return "_91_manageMart/ActivityList";
	}

	@RequestMapping("/activityModify")
	public String activityModify() {
		return "_91_manageMart/ActivityModify";
	}

	@RequestMapping("/aboutMerchandiseModify")
	public String aboutMerchandiseModify() {
		return "_91_manageMart/AboutMerchandiseModify";
	}

	@RequestMapping("/aboutUsModify")
	public String aboutUsModify() {
		return "_91_manageMart/AboutUsModify";
	}

	@RequestMapping("/contactUsModify")
	public String contactUsModify() {
		return "_91_manageMart/ContactUsModify";
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

	@ModelAttribute
	public ItemBean getItemBean(@PathVariable(value = "itemId", required = false) Integer itemId, Model model) {
		ItemBean ib = null;
		if (itemId != null) {
			ib = managerItemService.getItemByItemId(itemId);
			System.out.println("=========ABC"+ib);
		} else {
			ib = new ItemBean();
			ib.setItemHeader("AA");
			ib.setItemPrice(20);
			ib.setItemQty(10);
			ib.setItemDes("AAAA");
			ib.setItemPic1("null");
			ib.setItemPic2("null");
			ib.setItemPic3("null");
			ib.setItem_freeze(0);
			model.addAttribute("itemBean", ib);
		}
		return ib;
	}
}
