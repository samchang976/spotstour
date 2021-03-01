package _91_managerMart.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ActivityController {

	@RequestMapping("/activityList")
	public String activityList() {
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

}
