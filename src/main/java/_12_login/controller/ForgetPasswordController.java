package _12_login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForgetPasswordController {

	@RequestMapping("/forgetPassword")
	public String forgetPassword() {
		return "_11_member/ForgetPassword";
	}
	
	
}