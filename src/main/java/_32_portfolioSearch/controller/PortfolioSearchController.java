package _32_portfolioSearch.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@GetMapping(value = "/SearchResult")
	public String getSearchWordForm(@ModelAttribute(name = "searchWord") String searchWord,@ModelAttribute(name = "param") String param, HttpSession session,Model model) {
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("resultList", psService.queryKeyword(searchWord,param));
		session.setAttribute("portfolioId", null);
		return "_31_portfolio/PortfolioSearchResult";

	}
	
	
	//作品詳細查詢
	@RequestMapping(value = "/SearchPortfolioDetail", method = RequestMethod.GET)
	public String getPortfolioDetail(@ModelAttribute(name = "searchWord") String searchWord,Model model, HttpSession session) {
		model.addAttribute("memberPortfolioList", psService.queryPersonalKeyword(searchWord, (Integer) session.getAttribute("mId")));
		return "_31_portfolio/PersonalPortfolio";
	}
	
		
	//影片播放頁面
	@GetMapping("portfolioPlay")
	public String portfolioPlay(@ModelAttribute Portfolio_MsgBeanVo portfolio_MsgBeanVo, Model model, HttpSession session) {
		if(session.getAttribute("portfolioId") == null) {
			model.addAttribute("portfolioId",portfolio_MsgBeanVo.getPortfolioId());
			model.addAttribute("detailList", portfolioPlayService.queryPortfolioId(portfolio_MsgBeanVo.getPortfolioId()));
			model.addAttribute("pMsgList", portfolioMsgService.queryPortfolioMsg(portfolio_MsgBeanVo.getPortfolioId()));
		}else {
			model.addAttribute("portfolioId",(Integer) session.getAttribute("portfolioId"));
			model.addAttribute("detailList", portfolioPlayService.queryPortfolioId((Integer) session.getAttribute("portfolioId")));
			model.addAttribute("pMsgList", portfolioMsgService.queryPortfolioMsg((Integer) session.getAttribute("portfolioId")));
		}
		return "_31_portfolio/PortfolioPlay";        
	}
	

	
	//新增影片留言(由影片播放頁面新增)
	@PostMapping("createPortfolioMsg")
	public String updatePortfolioMsg(@ModelAttribute Portfolio_MsgBeanVo portfolio_MsgBeanVo, Model model, HttpSession session)
			throws IOException {
		portfolio_MsgBeanVo.setmId((Integer) session.getAttribute("mId"));
		portfolioMsgService.addPortfolioMsg(portfolio_MsgBeanVo);
		session.setAttribute("portfolioId", portfolio_MsgBeanVo.getPortfolioId());
		return "redirect:/portfolioPlay";
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
