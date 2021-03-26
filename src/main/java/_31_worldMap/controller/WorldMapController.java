package _31_worldMap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _31_worldMap.service.WorldMapService;
import _37_portfolioManage.service.GetPlace_TypeListService;

@Controller
public class WorldMapController {
	
	@Autowired
	private WorldMapService worldMapService;
	@Autowired
	private GetPlace_TypeListService getPlace_TypeListService;
	
	@RequestMapping("/worldMap")
	public String worldMap(Model model,HttpSession session) {
		//於畫面上使用"atPortfolioList"識別字串,取出景點的作品相關欄位對應的值
		model.addAttribute("atPortfolioList", worldMapService.queryAtPortfolioList());
		//於畫面上使用"rtPortfolioList"識別字串,取出餐廳的作品相關欄位對應的值
		model.addAttribute("rtPortfolioList", worldMapService.queryRtPortfolioList());
		//於畫面上使用"htPortfolioList"識別字串,取出旅館的作品相關欄位對應的值
		model.addAttribute("htPortfolioList", worldMapService.queryHtPortfolioList());
		//於畫面上使用"placeTypeList"識別字串,取出所有地點類型欄位對應的值
//		model.addAttribute("placeTypeList", getPlace_TypeListService.getPlace_TypeList());
		
		return "_31_portfolio/WorldMap";
	}
	
	
	
}
