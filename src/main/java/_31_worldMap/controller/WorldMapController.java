package _31_worldMap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _31_worldMap.service.WorldMapService;

@Controller
public class WorldMapController {
	
	@Autowired
	private WorldMapService worldMapService;
	
	@RequestMapping("/worldMap")
	public String worldMap(Model model,HttpSession session) {
		//於畫面上使用"allPortfolioList"識別字串,取出對應的值
		model.addAttribute("allPortfolioList", worldMapService.getAllPortfolioList());
		return "_31_portfolio/WorldMap";
	}
	
	
	
}
