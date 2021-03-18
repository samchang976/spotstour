package _14_modifyMember.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;
import _11_register.service.MemberService;
import _14_modifyMember.service.ModifyService;
import _14_modifyMember.validator.ModifyValidator;



@Controller
@SessionAttributes({"gender"})
public class ModifyController {

	@Autowired
	ModifyService modifyService;
	
	@Autowired
	MemberService memberService;
	

	@GetMapping("/memberDetailModify")
		public String showDataForm(Model model,HttpSession session) {
		MemberBean member = (MemberBean) session.getAttribute("LoginOK");
		model.addAttribute("member",member);
		model.addAttribute("mPid", member.getMemberPermBean().getmPid());		
		Map<String, String> gender = new LinkedHashMap<>();
		gender.put("男", "男生");
		gender.put("secret", "秘密");
		gender.put("女", "女生");
		model.addAttribute("gender", gender);
		return "_11_member/MemberDetailModify";
	}
	

	@PostMapping("/memberDetailModify")
	public String modify(
			@ModelAttribute("member") MemberBean member, 
			BindingResult result, 
			Model model,
			RedirectAttributes redirectAtt, HttpSession session
			) {
		ModifyValidator validator = new ModifyValidator();
		validator.validate(member, result);
		if(result.hasErrors()) {
			return "_11_member/MemberDetailModify";
		}		
		
		try {
			modifyService.update(member,(Integer)session.getAttribute("mId"),(Integer)session.getAttribute("mPid"));
			System.out.println("old======="+member.getmPw());
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage() = " + ex.getMessage());
			result.rejectValue("mAN", "", "發生異常，請通知系統人員..." + ex.getMessage());
			model.addAttribute("member",member);
			return "_11_member/MemberDetailModify";
		}
		redirectAtt.addFlashAttribute("SUCCESS", "修改成功!!!");
		
		return "redirect:logout";
		
	}
	
}
