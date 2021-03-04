package _37_portfolioManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PortfolioManageController {
	
	//新增影片跳轉
	@RequestMapping("videoCreate")
	public String getVideoCreate() {
		return "_31_portfolio/VideoCreate";
	}
	//個人作品跳轉
	@RequestMapping("personalVideo")
	public String getPersonalVideo() {
		return "_31_portfolio/PersonalVideo";
	}
	//收藏影片跳轉
	@RequestMapping("collectVideo")
	public String getCollectVideo() {
		return "_31_portfolio/CollectVideo";
	}
	//編輯影片跳轉
	@RequestMapping("videoModify")
	public String getVideoModify() {
		return "_31_portfolio/VideoModify";
	}
	
	
	
}
