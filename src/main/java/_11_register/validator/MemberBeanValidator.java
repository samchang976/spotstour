package _11_register.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _02_model.entity.MemberBean;

public class MemberBeanValidator implements Validator{
	public static final String MEMAIL_CHECK = "[a-zA-Z0-9]{1,}[@][a-zA-Z]{1,}[\\.][a-zA-Z]{1,}";
	public static final String MAN_AND_MPW_CHECK = "[a-zA-Z0-9]{6,10}";
	public static final String MPHONE_CHECK = "[0-9]{10,10}";
	public static final String MUID_CHECK = "[A-Z]{1}[0-9]{9}";

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean mb = (MemberBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mName", "", "請輸入姓名");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "d_mAddress", "", "請輸入地址");
		ValidationUtils.rejectIfEmpty(errors, "multipartFile", "", "請挑選圖片");
		if (mb.getmPw() != null && ! mb.getmPw().equals(mb.getmTPw())) {
			errors.rejectValue("mTPw","", "密碼欄與確認密碼不一致");
		}
		if (mb.getMultipartFile() != null && mb.getMultipartFile().getSize() == 0) {
			errors.rejectValue("multipartFile", "", "請挑選圖片");
		}	
		if (!mb.getmAN().matches(MAN_AND_MPW_CHECK)) {
			errors.rejectValue("mAN", "", "請輸入6-10個英數字");
		}
		if (!mb.getmPw().matches(MAN_AND_MPW_CHECK)) {
			errors.rejectValue("mPw", "", "請輸入6-10個英數字");
		}
		if (!mb.getmEmail().matches(MEMAIL_CHECK)) {
			errors.rejectValue("mEmail", "", "email格式不符");
		}
		if (!mb.getmPhone().matches(MPHONE_CHECK)) {
			errors.rejectValue("mPhone", "", "請輸入正確的手機號碼");
		}
		if (!mb.getmUid().matches(MUID_CHECK)) {
			errors.rejectValue("mUid", "", "請輸入正確的身分證號碼");
		}

	}
}
