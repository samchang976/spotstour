package _91_managerMart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@GetMapping("/merchandiseModify")
	public String addeMrchandise(Model model) {
		ItemBean ib = new ItemBean();
		ib.setItemHeader("AA");
		ib.setItemPrice(20);
		ib.setItemQty(10);
		ib.setItemDes("AAAA");
		ib.setItemPic1("null");
		ib.setItemPic2("null");
		ib.setItemPic3("null");
		model.addAttribute("itemBean",ib);
		return "_91_manageMart/MerchandiseModify";
	}
	
	@PostMapping("/merchandiseModify")
	public String processAddNewMrchandiseForm(@ModelAttribute("itemBean") ItemBean ib) {
		managerItemService.addItem(ib);  
//		return "redirect:/_91_manageMart/MerchandiseModify";
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
		for(Item_typeBean itb : list) {  
			item_TypeMap.put(itb.getItId(), itb.getItemType());
		}
		return item_TypeMap; 
	}
	
	@ModelAttribute("Item_TypeList")   
	public List<Item_typeBean> getItem_TypeList() {
	    return managerItemService.getItem_TypeList();
	}
	
	@ModelAttribute("countryMap") 
	public Map<Integer, String> getCountryMap() {
		Map<Integer, String> countryMap = new HashMap<>();
		List<CountryBean> list = managerItemService.getCountryList();
		for(CountryBean itb : list) {  
			countryMap.put(itb.getCountryId(), itb.getCountryName());
		}
		return countryMap; 
	}
	
	@ModelAttribute("CountryList")   
	public List<CountryBean> getCountryList() {
	    return managerItemService.getCountryList();
	}
	
}
