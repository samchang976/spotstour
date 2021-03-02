package _21_merchandiseSearch.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _02_model.entity.ContinentBean;
import _02_model.entity.CountryBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _02_model.entity.OrdBean;
import _02_model.entity.Receipt_TypeBean;
import _02_model.entity.Ship_TypeBean;
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

	@RequestMapping("/merchandiseSearchResult/Id={countryId}")
	public String merchandiseSearchResult(@PathVariable(value = "countryId", required = false) Integer countryId, Model model) {
		List<ItemBean> list = itemService.getItemByCountryId(countryId);
		model.addAttribute("items", list);
		return "_21_shoppingMall/MerchandiseSearchResult";
	}
	
//	@RequestMapping("/merchandiseSearchResult/Id={countryId}")
//	public String merchandiseSearchResult(@PathVariable(value = "countryId", required = false) Integer countryId, Model model) {
//		List<ItemBean> list = itemService.getItemBySearch(countryId);
//		model.addAttribute("items", list);
//		return "_21_shoppingMall/MerchandiseSearchResult";
//	}
	
	// 得到單一商品
	@GetMapping("/merchandiseSearchResult/merchandiseDetail/Id={itemId}")
//	@GetMapping("/merchandiseDetail")
	public String getItemById(@ModelAttribute("itemId") Integer itemId, Model model) {
		ItemBean itemBean = itemService.getItemById(itemId);
		model.addAttribute("itemBean", itemBean);
		return "_21_shoppingMall/MerchandiseDetail";
	}
	
	// 搜尋Bar
	@GetMapping("/merchandiseSearchResult")
	public String getItemBySearchBar(Model model, @ModelAttribute("searchWord") String searchWord) {
		Set<ItemBean> list = itemService.getItemBySearchBar(searchWord);
		model.addAttribute("items", list);
		return "_21_shoppingMall/MerchandiseSearchResult";
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

}
