package _11_register.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;
import _11_register.service.MemberService;
import _11_register.validator.MemberBeanValidator;
import _13_mailVerification.mail.SendingEmail;


@Controller
@SessionAttributes({"gender","registerOK"})
public class MemberController {
	
	String inputForm="_11_member/MemberRegister";
	@Autowired
	MemberService memberService;

	
	@GetMapping("/memberRegister")
	public String sendForm(Model model) {
		MemberBean memberBean = new MemberBean();
		memberBean.setmBDay(java.sql.Date.valueOf("1990-3-31"));
		model.addAttribute("memberBean", memberBean);
		Map<String, String> gender = new LinkedHashMap<>();
		gender.put("男", "男生");
		gender.put("秘密", "秘密");
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

		MultipartFile picture = bean.getMultipartFile(); // 圖片本人
		String originalFilename = picture.getOriginalFilename(); // 圖片的檔名
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			bean.setmPic("memberImages/" + originalFilename); // 將檔名存入資料庫
		}
//		String folderPath = "D:/_JSP/workspace/spotstourHSM05/src/main/webapp/images/memberImages";
		String folderPath = "C:/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/memberImages";
		
		File theDir = new File(folderPath);
		if (!theDir.exists()) {
			theDir.mkdirs();
		}

		try (InputStream in = picture.getInputStream();
				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setM_createTime(registerTime);
		
		Member_permBean mpb = memberService.selectdata(2);
		bean.setM_verify(0);
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
		model.addAttribute("registerOK", bean);
		return "redirect:/confirmEmail";
	}	
	
	@GetMapping("/confirmEmail")
	public String confirmEmail(HttpSession session) {
		
		MemberBean memberBean = (MemberBean) session.getAttribute("registerOK");
		SendingEmail sendingEmail = new SendingEmail(memberBean.getmId(), memberBean.getmEmail(), memberBean.getmName(),  memberBean);
		sendingEmail.sendMail();
		return "_11_member/ConfirmEmail";
	}
	
	@GetMapping("/verify")
	public String verify(HttpSession session) {
		MemberBean memberBean = (MemberBean) session.getAttribute("registerOK");
		memberService.updateVerify(memberBean.getmId());
		return "redirect:/login";
	}
}
