package _35_portfolioHistory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PortfolioHistoryController {

	@RequestMapping("historyList")
	public String getHistoryList() {
		return "_31_portfolio/HistoryList";
		        
	}
}
