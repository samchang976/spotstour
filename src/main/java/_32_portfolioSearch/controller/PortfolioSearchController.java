package _32_portfolioSearch.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _32_portfolioSearch.controller.vo.Portfolio_MsgBeanVo;
import _32_portfolioSearch.service.PortfolioMsgService;
import _32_portfolioSearch.service.PortfolioPlayService;
import _32_portfolioSearch.service.PortfolioSearchService;

@Controller
public class PortfolioSearchController {

	// 注入Service第一種寫法
	@Autowired
	PortfolioSearchService psService;
	@Autowired
	PortfolioPlayService portfolioPlayService;
	@Autowired
	PortfolioMsgService portfolioMsgService;

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
	
	
	//影片播放頁面
	@RequestMapping(value = "/PortfolioPlay", method = RequestMethod.GET)
	public String portfolioPlay(Model model, @ModelAttribute(name = "portfolioId") Integer portfolioId) {
		model.addAttribute("detailList", portfolioPlayService.queryPortfolioId(portfolioId));
		model.addAttribute("pMsgList", portfolioMsgService.queryPortfolioMsg(portfolioId));
		return "_31_portfolio/PortfolioPlay";        
	}
	

	
	//新增影片留言(由影片播放頁面新增)
	@PostMapping("createPortfolioMsg")
	public String updatePortfolioMsg(@ModelAttribute Portfolio_MsgBeanVo portfolio_MsgBeanVo, Model model, HttpSession session)
			throws IOException {
		portfolio_MsgBeanVo.setmId((Integer) session.getAttribute("mId"));
		portfolioMsgService.addPortfolioMsg(portfolio_MsgBeanVo);
		return "redirect:/PortfolioPlay";
	}
	
	//編輯影片留言(取消編輯功能)
//	@PostMapping("editPortfolioMsg")
//	public String createPortfolio(@ModelAttribute Portfolio_MsgBeanVo portfolio_MsgBeanVo, Model model, HttpSession session)
//			throws IOException {
//		portfolio_MsgBeanVo.setmId((Integer) session.getAttribute("mId"));
//
//		return "redirect:/PortfolioPlay";
//	}
	

}
