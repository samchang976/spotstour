//package _13_mailVerification.controller;
//
//import javax.servlet.ServletContext;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import _13_mailVerification.service.MailVerificationService;
//
//@Controller
//public class MailVerificationController {
//	
//	@Autowired
//	ServletContext servletContext;
//	
//	@Autowired
//	MailVerificationService mailService ;
//	
//
//	@RequestMapping("/emailVerificationSuccess")
//	public String emailVerificationSuccess() {
//		return "_11_member/EmailVerificationSuccess";
//	}
//	
//}