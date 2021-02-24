package _11_register.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("memberRegister")
	public String getMemberRegister() {
		return "_11_member/register";
	}
	
	
	@RequestMapping("memberDetailModify")
	public String getMemberDetailModify() {
		return "_11_member/MemberDetailModify";
	}
	
	
	
	
}
