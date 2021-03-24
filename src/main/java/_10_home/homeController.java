package _10_home;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import _32_portfolioSearch.service.PortfolioSearchService;

@Controller
public class homeController {
	
	@Autowired
	PortfolioSearchService portfolioSearchService;
	
	//首頁
	@RequestMapping(value={"/", "index"}, method=RequestMethod.GET)
	public String home(HttpSession session,Model model) {
		model.addAttribute("hotList", portfolioSearchService.queryHotPortfolio());
		return "index";
	}
}
