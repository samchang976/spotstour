//package _13_mailVerification.service;
//
//import javax.transaction.Transactional;
//
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import _13_mailVerification.dao.MailVerificationDao;
//
//@Service
//public class MailVerificationService {
//
//	@Autowired
//	SessionFactory factory;
//	
//	@Autowired
//	MailVerificationDao dao;
//	
//	public MailVerificationService() {
//		
//	}
//	
//	@Transactional
//	public void changeVerification(String type , String email , String hash) {
//			dao.changeVerification(type, email, hash);
//	}
//}
