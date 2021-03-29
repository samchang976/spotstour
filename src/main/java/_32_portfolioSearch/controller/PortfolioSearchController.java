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
import _32_portfolioSearch.service.AddRecordService;
import _32_portfolioSearch.service.PortfolioMsgService;
import _32_portfolioSearch.service.PortfolioPlayService;
import _32_portfolioSearch.service.PortfolioSearchService;

@Controller
public class PortfolioSearchController {

	// 注入Service第一種寫法
	@Autowired
	private PortfolioSearchService psService;
	@Autowired
	private PortfolioPlayService portfolioPlayService;
	@Autowired
	private PortfolioMsgService portfolioMsgService;
	@Autowired
	private AddRecordService addRecordService;

	
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
		//初始化
		session.setAttribute("portfolioId", null);
		session.setAttribute("countryId", null);
		return "_31_portfolio/PortfolioSearchResult";

	}
	
	
	//個人作品詳細查詢
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
			model.addAttribute("countryId",portfolio_MsgBeanVo.getCountryId());
			model.addAttribute("detailList", portfolioPlayService.queryPortfolioId(portfolio_MsgBeanVo.getPortfolioId()));
			model.addAttribute("pMsgList", portfolioMsgService.queryPortfolioMsg(portfolio_MsgBeanVo.getPortfolioId()));
			model.addAttribute("itemList", portfolioPlayService.queryHotItems(portfolio_MsgBeanVo.getCountryId()));
			//觀看次數(無論身份:參數=>3,mId=>0)
			addRecordService.addVRecord(portfolio_MsgBeanVo.getPortfolioId(), 3);
		}else {
			model.addAttribute("portfolioId",(Integer) session.getAttribute("portfolioId"));
			model.addAttribute("countryId",(Integer) session.getAttribute("countryId"));
			model.addAttribute("detailList", portfolioPlayService.queryPortfolioId((Integer) session.getAttribute("portfolioId")));
			model.addAttribute("pMsgList", portfolioMsgService.queryPortfolioMsg((Integer) session.getAttribute("portfolioId")));
			model.addAttribute("itemList", portfolioPlayService.queryHotItems((Integer) session.getAttribute("countryId")));
		}
		return "_31_portfolio/PortfolioPlay";        
	}
	

	
	//新增影片留言(由影片播放頁面新增)
	@PostMapping("createPortfolioMsg")
	public String updatePortfolioMsg(@ModelAttribute Portfolio_MsgBeanVo portfolio_MsgBeanVo, Model model, HttpSession session)
			throws IOException {
		portfolio_MsgBeanVo.setmId((Integer) session.getAttribute("mId"));
		portfolioMsgService.addPortfolioMsg(portfolio_MsgBeanVo);
		//為了新增影片留言後跳轉能保留
		session.setAttribute("portfolioId", portfolio_MsgBeanVo.getPortfolioId());
		session.setAttribute("countryId", portfolio_MsgBeanVo.getCountryId());
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
