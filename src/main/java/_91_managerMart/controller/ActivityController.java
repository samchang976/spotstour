package _91_managerMart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.ActivityBean;
import _91_managerMart.service.ManagerActivityService;

@Controller
public class ActivityController {
	
	@Autowired
	ManagerActivityService managerActivityService;

	@RequestMapping("/activityList")
	public String getAllActivityList(Model model) {
		List<ActivityBean> list = managerActivityService.getAllActivitys();
		model.addAttribute("activitys", list);
		return "_91_manageMart/ActivityList";
	}

	@RequestMapping("/activityModify")
	public String activityModify() {
		return "_91_manageMart/ActivityModify";
	}

	@RequestMapping("/aboutMerchandiseModify")
	public String aboutMerchandiseModify() {
		return "_91_manageMart/AboutMerchandiseModify";
	}

	@RequestMapping("/aboutUsModify")
	public String aboutUsModify() {
		return "_91_manageMart/AboutUsModify";
	}

	@RequestMapping("/contactUsModify")
	public String contactUsModify() {
		return "_91_manageMart/ContactUsModify";
	}
	
	
	// 取得活動資訊
	@ModelAttribute
	public ActivityBean getActivityBean(@PathVariable(value = "activityId", required = false) Integer activityId, Model model) {
		ActivityBean activityBean = null;
		if (activityId != null) {
			activityBean = managerActivityService.getActivityByActivityId(activityId);
		} else {
			activityBean = new ActivityBean();
			activityBean.setActivityHeader("活動三");
			activityBean.setActivityContent("測試活動");
			model.addAttribute("activityBean", activityBean);
		}
		return activityBean;
	}

}
