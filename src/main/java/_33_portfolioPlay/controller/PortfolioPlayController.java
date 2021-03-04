package _33_portfolioPlay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
public class PortfolioPlayController {

	@RequestMapping("portfolioPlay")
	public String getHistoryList() {
		return "_31_portfolio/PortfolioPlay";
		        
	}
}
