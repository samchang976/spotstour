package _11_register.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _02_model.entity.MemberBean;

public class MemberBeanValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean mb = (MemberBean) target;
//		String n = mb.getmBDay().toString();
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mAN", "", "帳號欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mName", 		"", "姓名欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mPw", 	"", "密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mTPw", 	"", "確認密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "d_mAddress", 	"", "地址欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mGender", 	"", "性別欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mUid", 		"", "身分證欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mEmail", 		"", "電子信箱欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mBDay", 		"mBDay.required", "生日欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mPhone", 		"", "電話欄不能空白");
		ValidationUtils.rejectIfEmpty(errors, "multipartFile", "", "必須挑選圖片");
		if (mb.getmAN() != null && mb.getmAN().length()<6) {
			errors.rejectValue("mAN","", "帳號欄不能小於六個字元");
		}		
		if (mb.getmPw() != null && ! mb.getmPw().equals(mb.getmTPw())) {
			errors.rejectValue("mPw","", "密碼欄與確認密碼不一致");
		}
		if (mb.getMultipartFile() != null && mb.getMultipartFile().getSize() == 0) {
			errors.rejectValue("multipartFile", "", "必須挑選圖片");
		}	
//		Integer s = Integer.parseInt(mb.getmGender());
//		if (s == -1) {
//			errors.rejectValue("mGender","", "必須挑選嗜好欄的選項");
//		}
	}
}
