package _32_portfolioSearch.dao.Impl;

import java.lang.annotation.Native;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ContinentBean;
import _32_portfolioSearch.dao.PortfolioSearchDao;
@Repository
public class PortfolioSearchDaoImpl implements PortfolioSearchDao {
	
	@Autowired
	SessionFactory sessionFactory;
	

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryKeyword(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT v.videoFile,v.videoPic,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " WHERE pf.portfolioName  LIKE :keyword "
				+ " OR ct.cityName  LIKE :keyword "
				+ " OR cn.countryName LIKE :keyword "
				+ " OR cnt.continentName LIKE :keyword " ;
		
		//設定結果集:設定結果類型為List<Map<String, Object>>
		Query q =  session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		
		List<Map<String, Object>> ans = q.
					setParameter("keyword","%" + keyword  +"%").list();	
		
		return ans;
	}





	@Override
	public ContinentBean queryContinentName(String continentName) {		
		ContinentBean cnb = null;
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ContinentBean cnb WHERE cnb.continentName like :continentName";
		try {
			cnb = (ContinentBean) session.createQuery(hql)
									 .setParameter("continentName","%"+ continentName +"%")
									 .getSingleResult();
		} catch (NoResultException ex) {
			System.out.println("err : " + ex.getMessage());
		}
		return cnb;
	}}