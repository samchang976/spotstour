package _11_register.controller;


import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

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
@SessionAttributes({"gender"})
public class MemberController {
	
	String inputForm="_11_member/MemberRegister";
	@Autowired
	MemberService memberService;

	
	
//	@RequestMapping("memberDetailModify")
//	public String getMemberDetailModify() {
//		return "_11_member/MemberDetailModify";
//	}
	
	
	
	@GetMapping("/memberRegister")
	public String sendForm(Model model) {
		MemberBean memberBean = new MemberBean();
		memberBean.setmBDay(java.sql.Date.valueOf("1980-5-4"));
		memberBean.setmName("Ms.Lin");
		memberBean.setmPw("Do!ng123");
		memberBean.setmTPw("Do!ng123");
		memberBean.setmAN("a1011000");
		memberBean.setD_mAddress("新竹市大同路100號");
		memberBean.setmPhone("0919123456");
		memberBean.setmEmail("scwang39165@outlook.com");
		memberBean.setmUid("A123456789");
		model.addAttribute("memberBean", memberBean);
//		Map<String, String> gender = new HashMap<>();
//		Map<String, String> gender = new TreeMap<>();
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

//		if(mbPicture != null && !mbPicture.isEmpty()) {
//			try {
//				byte[] b = mbPicture.getBytes();
//				Blob blob = new SerialBlob(b);
//				bean.setmPic(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
//			}
//		}
		
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setM_createTime(registerTime);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String mBDay = sdf.format(bean.getmBDay());
//		Date date = sdf.parse(mBDay);
		System.out.println(mBDay);
		java.util.Date date = null;
		try {
			date = sdf.parse(mBDay);
		} catch (ParseException e) {
			System.out.println();
			
		}
		Date date1 = new Date(bean.getmBDay().getTime());
		
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
		return "redirect:/";
	}
	
///
//	public byte[] blobToByteArray(Blob blob) {
//		byte[] result = null;
//		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
//			byte[] b = new byte[819200];
//			int len = 0;
//			while ((len = is.read(b)) != -1) {
//				baos.write(b, 0, len);
//			}
//			result = baos.toByteArray();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}
//	
//	public static byte[] base64Encode(byte[] fileBytes) {
//		byte[] encodedBytes = Base64.getEncoder().encode(fileBytes);
//		System.out.println("編碼完成 " + encodedBytes.length);
//		return encodedBytes;
//	}
	
}
