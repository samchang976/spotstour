package _11_register.controller;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import _00_util.GlobalService;
import _02_model.entity.MemberBean;
import _11_register.service.MemberService;
import _11_register.validator.MemberBeanValidator;

@Controller
//@RequestMapping("/_11_register/")
public class MemberController {
	
	String inputForm="_11_member/MemberRegister";
	@Autowired
	MemberService memberService;

//	@RequestMapping("memberRegister")
//	public String getMemberRegister() {
//		return "_11_member/register";
//	}
	
	
	@RequestMapping("memberDetailModify")
	public String getMemberDetailModify() {
		return "_11_member/MemberDetailModify";
	}
	
	/////////////////
	
	@GetMapping("memberRegister")
	public String sendForm(Model model) {
		MemberBean memberBean = new MemberBean();
		memberBean.setmName("Ms.Lin");
		model.addAttribute("memberBean", memberBean);
		return inputForm;
	}
	
	@PostMapping("memberRegister")
	public String processForm(@ModelAttribute("memberBean") MemberBean bean, BindingResult result, 
			Model model, HttpServletRequest request) {
		MemberBeanValidator validator = new MemberBeanValidator();
		validator.validate(bean, result);
		if(result.hasErrors()) {
			return inputForm;
		}
		MultipartFile mbPicture = bean.getMultipartFile();
//		String originFileName = mbPicture.getOriginalFilename();
//		String ext = "";
//		if(originFileName.lastIndexOf(".") > -1) {
//			ext = originFileName.substring(originFileName.lastIndexOf("."));
//		}
//		if(originFileName.length() > 0 && originFileName.lastIndexOf(".") > -1) {
//			bean.setFileName(originFileName);
//		}
		if(mbPicture != null && !mbPicture.isEmpty()) {
			try {
				byte[] b = mbPicture.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setmPic(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
			}
		}
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setM_createTime(registerTime);
		bean.setmPw(GlobalService.getMD5Endocing(GlobalService.encryptString(bean.getmPw())));
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
		return "redirect:/";
	}
	
	@ModelAttribute
	public MemberBean prepareMemberBean(HttpServletRequest req) {
		MemberBean memberBean = new MemberBean();
//		memberBean.setUserType("Z");
		return memberBean;
	}
	
	
}
