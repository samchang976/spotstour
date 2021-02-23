package _24_contactUs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {

	@RequestMapping("aboutUs")
	public String getAboutUs() {
		return "_11_member/AboutUs";
	}
	
	@RequestMapping("contactUs")
	public String getContactUs() {
		return "_11_member/ContactUs";
	}
}
