package _37_portfolioManage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.CityBean;
import _02_model.entity.Place_TypeBean;
import _37_portfolioManage.controller.vo.PortfolioBeanVo;
import _37_portfolioManage.service.PortfolioService;
import _37_portfolioManage.service.GetCityListService;
import _37_portfolioManage.service.GetPlace_TypeListService;
import _37_portfolioManage.service.ShowPersonalPortfolioService;

@Controller
public class PortfolioManageController {

	@Autowired
	private PortfolioService portfolioService;
	@Autowired
	private GetCityListService getCityListService;
	@Autowired
	private GetPlace_TypeListService getPlace_TypeListService;
	@Autowired
	private ShowPersonalPortfolioService showPersonalPortfolioService;

	//新增影片跳轉
	@RequestMapping({ "videoCreate", "videoModify" })
	public String getVideoCreate(@ModelAttribute PortfolioBeanVo portfolioBeanVo, Model model) {
			//新增影片
		if (portfolioBeanVo.getPortfolioId() == null) {
			// 獲取城市,景點清單
			List<CityBean> cList = getCityListService.getCityList();
			List<Place_TypeBean> ptList = getPlace_TypeListService.getPlace_TypeList();
			model.addAttribute("cityList", cList);
			model.addAttribute("placeTypeList", ptList);
			return "_31_portfolio/VideoCreate";
		} else {
			//編輯影片
			// 獲取城市,景點清單
			List<CityBean> cList = getCityListService.getCityList();
			List<Place_TypeBean> ptList = getPlace_TypeListService.getPlace_TypeList();
			model.addAttribute("portfolioEdit", portfolioBeanVo);
			model.addAttribute("cityList", cList);
			model.addAttribute("placeTypeList", ptList);			
			return "_31_portfolio/VideoCreate";
		}
	}

	//個人作品跳轉
	@RequestMapping("personalPortfolio")
	public String getPersonalVideo(HttpSession session, Model model) {
		model.addAttribute("mId", session.getAttribute("mId"));
		model.addAttribute("memberPortfolioList", showPersonalPortfolioService.queryMemberPortfolio(model));
		return "_31_portfolio/PersonalPortfolio";
	}

	//收藏影片跳轉
	@RequestMapping("collectVideo")
	public String getCollectVideo() {
		return "_31_portfolio/CollectVideo";
	}


	//新增作品及影片
	@PostMapping("createPortfolio")
	public String createPortfolio(@ModelAttribute PortfolioBeanVo portfolioBeanVo, Model model, HttpSession session)
			throws IOException {
		portfolioBeanVo.setmId((Integer) session.getAttribute("mId"));
		portfolioService.addPortfolio(portfolioBeanVo);

		return "redirect:/personalPortfolio";
	}

	//編輯作品及影片
    @PostMapping("editPortfolio")
	public String updatePortfolio(@ModelAttribute PortfolioBeanVo portfolioBeanVo,Model model,HttpSession session) throws IOException {
    	portfolioService.editPortfolio(portfolioBeanVo);
			
		return "redirect:/personalPortfolio";	
	}
    
	//刪除(凍結)作品及影片
    @PostMapping("deletePortfolio")
	public String deletePortfolio(@ModelAttribute PortfolioBeanVo portfolioBeanVo,Model model,HttpSession session) throws IOException {
    	portfolioService.deletePortfolio(portfolioBeanVo);
			
		return "redirect:/personalPortfolio";	
	}
    

}
