package _12_login.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _02_model.entity.MemberBean;
import _11_register.service.MemberService;
import _12_login.validator.LoginValidator;
import _22_shoppingCart.service.ShoppingCartService;
import _22_shoppingCart.vo.SessionShoppingCartVo;

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
@SessionAttributes({ "sessionShoppingCart", "sessionShoppingCartList" })
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	ShoppingCartService shoppingCartService;

	@RequestMapping("/login")
	public String login(Model model) {
		MemberBean mb = new MemberBean();
		model.addAttribute(mb);
		return "_11_member/Login";
	}

//	@RequestMapping("/login.do")
	@SuppressWarnings("unchecked")
	@PostMapping("/login")
	public String doLogin(@ModelAttribute("memberBean") MemberBean memberBean, BindingResult result,
			HttpSession session, Model model, SessionStatus status, RedirectAttributes redirectAtt) {
		LoginValidator validator = new LoginValidator();
		validator.validate(memberBean, result);
		if (result.hasErrors()) {
			return "_11_member/Login";
		}

		try {
			boolean loginCheck = loginService.loginCheck(memberBean, model);
			if (loginCheck == true) {
				session.setAttribute("LoginOK", model.getAttribute("LoginOK"));
				session.setAttribute("mAN", memberBean.getmAN());
				session.setAttribute("mId", memberBean.getmId());
				session.setAttribute("mPid", memberBean.getMemberPermBean().getmPid());
				session.setAttribute("mPidName", memberBean.getMemberPermBean().getmPermissions());
				model.addAttribute("Login", "登入成功");
				System.out.println("User:" + session.getAttribute("mAN") + " 已登入" + ",權限:"
						+ memberBean.getMemberPermBean().getmPermissions());
//登入後把sessuon的購物清單存入資料庫=====================================================================				
				Integer member = (Integer) session.getAttribute("mPid");
				if (member == 2 || member ==1) { // 1:管理員 2:會員
					@SuppressWarnings("unchecked")
					List<SessionShoppingCartVo> sscList = (List<SessionShoppingCartVo>) model
							.getAttribute("sessionShoppingCartList");
					if (sscList != null) {
						shoppingCartService.sessionCartSave(sscList, (int) session.getAttribute("mId"));
						status.setComplete(); //存完清空session
					}
				}
//=================================================================================================				
				return "redirect:index";
			}
		} catch (NoResultException nre) {
			System.out.println("資料錯誤");
			redirectAtt.addFlashAttribute("LoginError", "帳號或密碼錯誤");
			return "redirect:login";
		}
		return "redirect:login";

	}

//	@RequestMapping("/login.out")
	@RequestMapping("/logout")
	public String logout(@ModelAttribute MemberBean memberBean, HttpSession session, HttpServletRequest req) {
		String user = (String) session.getAttribute("mAN");
		String mPidName = (String) session.getAttribute("mPidName");
		if (req.getSession(false) != null) {
//		session.removeAttribute("mAN"); 只能移除sessoin屬性
			session.invalidate(); // 銷毀session
			System.out.println("User:" + user + " 已登出" + ",權限:" + mPidName);
			return "redirect:index";
		}

		return "redirect:index";
	}

}
