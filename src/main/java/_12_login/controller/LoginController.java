package _12_login.controller;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import _02_model.entity.MemberBean;
import _12_login.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;

	@RequestMapping("/login")
	public String login() {
		return "_11_member/Login";
	}
	
	@RequestMapping("/login.do")
	public String doLogin(@ModelAttribute MemberBean memberBean ,HttpSession session) {
		if(loginService.loginCheck(memberBean) == true) {
			session.setAttribute("mAN", memberBean.getmAN());
			System.out.println(session.getAttribute("mAN"));
			return "index";
		}else {
			return "_11_member/register";	
		}
	}
	
	@RequestMapping("/login.out")
	public String logout() {
//		if()) {
//			
//		}
		return "index";
	}
	
	
	
	
}