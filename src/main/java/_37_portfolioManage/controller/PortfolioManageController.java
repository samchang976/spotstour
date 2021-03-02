package _37_portfolioManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PortfolioManageController {
	
	@RequestMapping("personalVideo")
	public String getPersonalVideo() {
		return "_31_portfolio/PersonalVideo";
	}
	
	@RequestMapping("collectVideo")
	public String getCollectVideo() {
		return "_31_portfolio/CollectVideo";
	}
	
	@RequestMapping("videoModify")
	public String getVideoModify() {
		return "_31_portfolio/VideoModify";
	}
	
	
	
}
