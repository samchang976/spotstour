package _12_login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public String login() {
		return "_11_member/Login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "_11_member/Logout";
	}
	
}