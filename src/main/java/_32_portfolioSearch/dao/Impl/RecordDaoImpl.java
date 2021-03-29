package _32_portfolioSearch.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.RecordBean;
import _32_portfolioSearch.dao.RecordDao;

@Repository
public class RecordDaoImpl implements RecordDao {

	
	@Autowired
	SessionFactory sessionFactory;

	
	@Override
	public void addVRecord(RecordBean recordBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(recordBean);
	}
	
	
	
	@Override
	public void updateGBRecord(RecordBean recordBean) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(recordBean);
	}

	

	@Override
	public void deleteGBRecord(Integer portfolioId,Integer mId,Integer param) {
		Session session = sessionFactory.getCurrentSession();
		String hql = " DELETE "
				   + " FROM RecordBean r "
				   + " WHERE r.mId = :mId AND portfolioId = :portfolioId AND paramId = :paramId ";
//		session.createNativeQuery(sql)
		session.createQuery(hql).setParameter("mId", mId).setParameter("portfolioId", portfolioId).setParameter("paramId", param).executeUpdate();
	}
	
	



	@SuppressWarnings("unchecked")
	@Override
//	public List<Map<String, Object>> queryRecord(Integer portfolioId) {
	public RecordBean queryRecordBymId(Integer portfolioId,Integer mId,Integer param) {
		Session session = sessionFactory.getCurrentSession();
		RecordBean recordBean = null;
//		String sql = " SELECT r.mId "
//				+ " FROM record r "
//				+ " LEFT JOIN portfolio pf ON r.portfolioId = pf.portfolioId "
//				+ " LEFT JOIN params pas ON r.paramId = pas.paramId "
//				+ " LEFT JOIN MEMBER m ON r.mId = m.mId "
//				+ " WHERE r.mId = :mId AND pf.portfolioId = :portfolioId AND r.paramId = :paramId ";
		String hql =  " FROM RecordBean r "
				+ " WHERE r.mId = :mId AND portfolioId = :portfolioId AND paramId = :paramId ";
		
		
		//設定結果集:設定結果類型為List<Map<String, Object>>
//		Query q =  session.createNativeQuery(sql);
//		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		try {
		recordBean = (RecordBean) session.createQuery(hql).
				setParameter("mId",mId).
				setParameter("portfolioId",portfolioId).
				setParameter("paramId",param).getSingleResult();
		}catch(NoResultException nre){
			
			return null;
		}
	
		return recordBean;
	}


	
	
}
