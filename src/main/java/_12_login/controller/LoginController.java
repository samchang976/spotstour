package _12_login.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.Base64;

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

//import javax.persistence.NoResultException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.hibernate.Session;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import _02_model.entity.MemberBean;
//import _02_model.entity.Member_permBean;
//import _12_login.service.LoginService;

@Controller
@SessionAttributes({"LoginOK","Login", "FlashMSG_farewell"}) 
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/login")
	public String login(Model model) {
		MemberBean mb = new MemberBean();
		model.addAttribute(mb);
		return "_11_member/LoginForm";
	}
	
	@PostMapping("/login")
	public String check(@ModelAttribute("memberBean") MemberBean bean, BindingResult result, Model model) {
		LoginValidator validator = new LoginValidator();
		validator.validate(bean, result);
		if (result.hasErrors()) {
			return "_11_member/LoginForm";
		}
		String password = bean.getmPw();
		String account = bean.getmAN();
		MemberBean mb = null;
		try {
			mb = memberService.checkmANmPw(account, password);
		} catch (Exception e) {
			e.printStackTrace();
		}			
		if(mb != null) {
				model.addAttribute("LoginOK", mb);
				model.addAttribute("Login", "登入成功");
				return "index";
			}else {
				model.addAttribute("LoginError", "帳號或密碼錯誤");
				return "_11_member/LoginForm";
			}
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session,  Model model, 
			SessionStatus status,
			RedirectAttributes redirectAtt
			) {
		String name = "";
		System.out.println("Logout");
		MemberBean memberBean = (MemberBean) model.getAttribute("LoginOK");
		if (memberBean != null) {
			name = memberBean.getmName();
		} else {
			name = "訪客";
		}
		String farewellMessage = name + "您已登出，期待您再次蒞臨本網站";
		redirectAtt.addFlashAttribute("FlashMSG_farewell", farewellMessage);
		status.setComplete();		
		session.invalidate();				
		return "redirect:/";		

	}
	
	
	@GetMapping("/_00_init/getMemberImage")   
	public ResponseEntity<byte[]>  getMemberImage(@RequestParam("id") String id) {
		InputStream is = null;
		OutputStream os = null;
		String fileName = null;
		String mimeType = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;
		HttpHeaders headers = new HttpHeaders();
		MediaType mediaType = null;
		String pic = null;
		try {
			MemberBean bean = memberService.queryMember(id);
			if (bean != null) {
				pic = bean.getmPic();
				if (pic != null) {
					byte[] decodedBytes = Base64.getDecoder().decode(pic);
//					os.write(decodedBytes);
					is.read(decodedBytes);
				}
//				fileName = bean.getFileName();
			}	
			if (is == null) {
				fileName = "kitty.jpg" ; 
				is = servletContext.getResourceAsStream(
						"/image/memberImages/tinyImg/" + fileName);
			}
			mimeType = servletContext.getMimeType(fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int len = 0;
			byte[] bytes = new byte[8192];
			
			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}
			media = baos.toByteArray();
			mediaType = MediaType.valueOf(mimeType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			headers.setContentType(mediaType);
			responseEntity =  new ResponseEntity<>(media, headers, HttpStatus.OK);
		} catch(Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("發生Exception: " + ex.getMessage());
		} finally{
			try {
				if (is != null) is.close();
			} catch(IOException e) {
				;
			}
			try {
				if (os != null) os.close();
			} catch(IOException e) {
				;
			}
		}
		return responseEntity;
	}
	
	
	
	
	
	
	
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////
//	@Autowired
//	LoginService loginService;
//
//	@RequestMapping("/login")
//	public String login() {
//		return "_11_member/Login";
//	}
//
//	@RequestMapping("/login.do")
//	public String doLogin(@ModelAttribute MemberBean memberBean, HttpSession session) {
//		
//		try{
//			boolean loginCheck = loginService.loginCheck(memberBean);
//			if (loginCheck == true) {
//				session.setAttribute("mAN", memberBean.getmAN());
////				session.setAttribute("mId", memberBean.getmId());
//				session.setAttribute("mPid", memberBean.getMemberPermBean().getmPid());
//				session.setAttribute("mPidName", memberBean.getMemberPermBean().getmPermissions());
//				System.out.println("User:" + session.getAttribute("mAN") + " 已登入" + ",權限:"
//						+ memberBean.getMemberPermBean().getmPermissions());
//				return "index";
//			}
//		} catch (NoResultException nre) {
//			System.out.println("資料錯誤");
////			return "_11_member/Login";
//			return "redirect:login";	
//		}
//		return "redirect:login";	
//
//	}
//
//	@RequestMapping("/login.out")
//	public String logout(@ModelAttribute MemberBean memberBean, HttpSession session, HttpServletRequest req) {
//		String user = (String) session.getAttribute("mAN");
//		String mPidName = (String) session.getAttribute("mPidName");
//		if (req.getSession(false) != null) {
////		session.removeAttribute("mAN"); 只能移除sessoin屬性
//			session.invalidate(); // 銷毀session
//			System.out.println("User:" + user + " 已登出" + ",權限:" + mPidName);
//			return "index";
//		}
//
//		return "index";
//	}

}
