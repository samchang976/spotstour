package _32_portfolioSearch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _02_model.entity.ContinentBean;
import _32_portfolioSearch.service.PortfolioSearchService;

@Controller
public class PortfolioSearchController {

	// 注入Service第一種寫法
	@Autowired
	PortfolioSearchService psService;

	// 注入Service第二種寫法
//	PortfolioSearchService psService;
//	@Autowired
//	public void setPsService(PortfolioSearchService psService) {
//		this.psService = psService;
//	}

	// 關鍵字查詢
	@RequestMapping(value = "/SearchResult", method = RequestMethod.GET)
	public String getSearchWordForm(Model model, @ModelAttribute(name = "searchWord") String searchWord) {
		model.addAttribute("resultList", psService.queryKeyword(searchWord));
		return "_31_portfolio/PortfolioSearchResult";

	}
	
	//作品詳細查詢
	@RequestMapping(value = "/SearchPortfolioDetail", method = RequestMethod.GET)
	public String getPortfolioDetail(Model model,@ModelAttribute(name = "searchPortfolioDetail") String searchWord) {
		model.addAttribute("resultList", psService.queryKeyword(searchWord));
		return "redirect:/personalPortfolio";
	}

}
