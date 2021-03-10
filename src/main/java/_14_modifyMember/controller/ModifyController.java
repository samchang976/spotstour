package _14_modifyMember.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

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
		public String showDataForm(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		model.addAttribute("member", new MemberBean());
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
			RedirectAttributes redirectAtt
			) {
		ModifyValidator validator = new ModifyValidator();
		validator.validate(member, result);
		if(result.hasErrors()) {
			return "_11_member/MemberDetailModify";
		}
		MultipartFile mbPicture = member.getMultipartFile();
		try {
			byte[] pic = mbPicture.getBytes();
			String picstr = Base64.getEncoder().encodeToString(pic);
			member.setmPic(picstr);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		member.setM_createTime(registerTime);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String mBDay = sdf.format(member.getmBDay());
		System.out.println(mBDay);
		java.util.Date date = null;
		try {
			date = sdf.parse(mBDay);
		} catch (ParseException e) {
			System.out.println();
			
		}
		Date date1 = new Date(member.getmBDay().getTime());
		
		Member_permBean mpb = memberService.selectdata(2);
		member.setM_verify(0);
		member.setMemberPermBean(mpb);
		try {
			modifyService.update(member);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage() = " + ex.getMessage());
			result.rejectValue("mAN", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return "_11_member/MemberDetailModify";
		}
		redirectAtt.addFlashAttribute("SUCCESS", "修改成功!!!");
		return "redirect:/";
		
	}
	
}
