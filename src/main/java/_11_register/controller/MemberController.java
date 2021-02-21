package _11_register.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("register")
	public String register() {
		return "_11_member/register";
	}
	
}
