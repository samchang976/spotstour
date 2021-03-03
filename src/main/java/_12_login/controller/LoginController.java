package _12_login.controller;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
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
import _02_model.entity.Member_permBean;
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
	public String doLogin(@ModelAttribute MemberBean memberBean, HttpSession session) {
		
		try{
			boolean loginCheck = loginService.loginCheck(memberBean);
			if (loginCheck == true) {
				session.setAttribute("mAN", memberBean.getmAN());
				session.setAttribute("mPid", memberBean.getMemberPermBean().getmPid());
				session.setAttribute("mPidName", memberBean.getMemberPermBean().getmPermissions());
				System.out.println("User:" + session.getAttribute("mAN") + " 已登入" + ",權限:"
						+ memberBean.getMemberPermBean().getmPermissions());
				return "index";
			}
		} catch (NoResultException nre) {
			System.out.println("資料錯誤");
//			return "_11_member/Login";
			return "redirect:login";	
		}
		return "redirect:login";	

	}

	@RequestMapping("/login.out")
	public String logout(@ModelAttribute MemberBean memberBean, HttpSession session, HttpServletRequest req) {
		String user = (String) session.getAttribute("mAN");
		String mPidName = (String) session.getAttribute("mPidName");
		if (req.getSession(false) != null) {
//		session.removeAttribute("mAN"); 只能移除sessoin屬性
			session.invalidate(); // 銷毀session
			System.out.println("User:" + user + " 已登出" + ",權限:" + mPidName);
			return "index";
		}

		return "index";
	}

}
