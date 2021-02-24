package _11_register.dao.impl;


import javax.persistence.NoResultException;
import org.hibernate.NonUniqueResultException;
//import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.test.MemberBean;
import _11_register.dao.MemberDao;


// 本類別使用為標準的JDBC技術來存取資料庫。
@Repository
public class MemberDaoImpl_Hibernate implements MemberDao {
	
	@Autowired
	SessionFactory factory;
	
	public MemberDaoImpl_Hibernate() {
//		factory = HibernateUtils.getSessionFactory();
	}
	// 儲存MemberBean物件，將參數mb新增到Member表格內。
	public int saveMember(MemberBean mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		n++;
		return n;
	}
	
	// 判斷參數id(會員帳號)是否已經被現有客戶使用，如果是，傳回true，表示此id不能使用，
	// 否則傳回false，表示此id可使用。
	@Override
	public boolean mANExists(String mAN) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.mAN = :mAN";
//		Query<MemberBean> query = session.createQuery(hql);
//		query = query.setParameter("mid", mAN);
//		MemberBean mb = query.getSingleResult();
		try {
			MemberBean mb = (MemberBean) session.createQuery(hql)
												.setParameter("mAN", mAN)
												.getSingleResult();
			if (mb != null) {
				exist = true;
			}
		} catch(NoResultException e) {
			exist = false;
		} catch(NonUniqueResultException e) {
			exist = true;
		}		
		return exist;
	}
	
	// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件，
	// 如果找不到對應的會員資料，傳回值為null。
	@Override
	public MemberBean queryMember(String mAN) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.mAN = :mAN";
		try {
			mb = (MemberBean) session.createQuery(hql)
									 .setParameter("mAN", mAN)
									 .getSingleResult();
		} catch (NoResultException ex) {
			;
		}
		return mb;
	}
	// 檢查使用者在登入時輸入的帳號與密碼是否正確。如果正確，傳回該帳號所對應的MemberBean物件，
	// 否則傳回 null。
	@Override
	public MemberBean checkmANmPw(String mAN, String mPw) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.mAN = :mAN and m.mPw = :mPw";
		try {
			mb = (MemberBean) session.createQuery(hql)
									 .setParameter("mAN", mAN)
									 .setParameter("mPw", mPw)
									 .getSingleResult();
		} catch (NoResultException ex) {
			;
		}
		return mb;
	}
	
}
