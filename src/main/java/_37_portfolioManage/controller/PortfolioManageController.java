package _37_portfolioManage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _02_model.entity.CityBean;
import _02_model.entity.MemberBean;
import _02_model.entity.Place_TypeBean;
import _02_model.entity.PortfolioBean;
import _37_portfolioManage.controller.vo.PortfolioBeanVo;
import _37_portfolioManage.service.CreatePortfolioService;
import _37_portfolioManage.service.GetCityListService;
import _37_portfolioManage.service.GetPlace_TypeListService;

@Controller
public class PortfolioManageController {
	
	@Autowired
	private CreatePortfolioService createPortfolioService;	
	@Autowired
	private GetCityListService getCityListService;
	@Autowired
	private GetPlace_TypeListService getPlace_TypeListService;
	
	
	
	//新增影片跳轉
	@RequestMapping("videoCreate")
	public String getVideoCreate(Model model) {
		//獲取城市,景點清單
		List<CityBean> cList = getCityListService.getCityList();
		List<Place_TypeBean> ptList = getPlace_TypeListService.getPlace_TypeList();
		model.addAttribute("cityList", cList);
		model.addAttribute("placeTypeList", ptList);
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

	
    @PostMapping("createPortfolio")
//  @ResponseBody
	public String createPortfolio(@ModelAttribute PortfolioBeanVo portfolioBeanVo,Model model,HttpSession session) {
    	portfolioBeanVo.setmId((Integer)session.getAttribute("mId"));
    	createPortfolioService.addPortfolio(portfolioBeanVo);
		
		
		return "redirect:/videoCreate";
		
	}
	
}
