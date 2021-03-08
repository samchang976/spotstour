//package _13_mailVerification.dao;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import _02_model.entity.MemberBean;
//
//public class MailVerificationDao {
//
//	
//	@Autowired
//	SessionFactory factory ;
//	
//
//    public MailVerificationDao() {
//    }
//    
//    // 更改驗證狀態碼
//    public void changeVerification(String type , String email , String hash) {
//    	String MemType = "";
//    	int typeInt = Integer.parseInt(type);
//    	
//    	
//		
//    	String hql1 = "From MemberBean m WHERE mEmail= :mEmail and m_verify = :m_verify";
//    	Session session = factory.getCurrentSession();
//    	MemberBean memberBean = (MemberBean) session.createQuery(hql1)
//					               						.setParameter("mEmail", email)
//					               						.setParameter("m_verify", 1)					               						
//					               						.getSingleResult();
//    	System.out.println("AAAAAAAAAAAAAA");
//		    	if(memberBean != null) {		    		
//		    		memberBean.setM_verify(1);
//		    			session.update(memberBean);
//		    		}
//				} 
//
//	}
//	
//
