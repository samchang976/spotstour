package _13_mailVerification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailVerificationController {

	@RequestMapping("/emailVerificationSuccess")
	public String emailVerificationSuccess() {
		return "_11_member/EmailVerificationSuccess";
	}
	
}