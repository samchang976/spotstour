package _24_contactUs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {

	@RequestMapping("aboutUs")
	public String getAboutUs() {
		return "_21_shoppingMall/AboutUs";
	}
	
	@RequestMapping("contactUs")
	public String getContactUs() {
		return "_21_shoppingMall/ContactUs";
	}
	
	@RequestMapping("aboutMerchandise")
	public String aboutMerchandise() {
		return "_21_shoppingMall/AboutMerchandise";
	}
}
