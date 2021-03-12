package _11_register.controller;



import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;
import _11_register.service.MemberService;
import _11_register.validator.MemberBeanValidator;

@Controller
@SessionAttributes({"gender","registerOK"})
public class MemberController {
	
	String inputForm="_11_member/MemberRegister";
	@Autowired
	MemberService memberService;

	
	@GetMapping("/memberRegister")
	public String sendForm(Model model) {
		MemberBean memberBean = new MemberBean();
		model.addAttribute("memberBean", memberBean);
		Map<String, String> gender = new LinkedHashMap<>();
		gender.put("男", "男生");
		gender.put("secret", "秘密");
		gender.put("女", "女生");
		
		model.addAttribute("gender", gender);
		return inputForm;
	}
	
	@PostMapping("/memberRegister")
	public String processForm(@ModelAttribute("memberBean") MemberBean bean, BindingResult result, 
			Model model, HttpServletRequest request) {
		MemberBeanValidator validator = new MemberBeanValidator();
		validator.validate(bean, result);
		if(result.hasErrors()) {
			return inputForm;
		}
		MultipartFile mbPicture = bean.getMultipartFile();
		try {
			byte[] pic = mbPicture.getBytes();
			String picstr = Base64.getEncoder().encodeToString(pic);
			bean.setmPic(picstr);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setM_createTime(registerTime);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String mBDay = sdf.format(bean.getmBDay());
		System.out.println(mBDay);
		java.util.Date date = null;
		try {
			date = sdf.parse(mBDay);
		} catch (ParseException e) {
			System.out.println();
			
		}
		Date date1 = new Date(bean.getmBDay().getTime());
		
		Member_permBean mpb = memberService.selectdata(2);
		bean.setM_verify(1);
		bean.setMemberPermBean(mpb);
		if(memberService.mANExists(bean.getmAN())) {
			result.rejectValue("mAN", "", "帳號已存在，請重新輸入");
			return inputForm;
		}
		try {
			memberService.saveMember(bean);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage() = " + ex.getMessage());
			result.rejectValue("mAN", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return inputForm;
		}
		model.addAttribute("registerOK", "註冊成功");
		return "redirect:/";
	}	
	
}
