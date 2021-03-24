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

import _02_model.entity.ContinentBean;
import _32_portfolioSearch.dao.PortfolioSearchDao;
@Repository
public class PortfolioSearchDaoImpl implements PortfolioSearchDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryHotPortfolio() {
		Session session = sessionFactory.getCurrentSession();
		String sql =
				  " SELECT v.videoFile,v.videoPic,v.v_freeze,pf.portfolioId,rp.iccount,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " LEFT JOIN (SELECT COUNT(r.portfolioId) iccount,r.portfolioId "
				+ " FROM record r "
				+ " WHERE r.paramId = 3 "
				+ " GROUP BY r.portfolioId ) rp ON pf.portfolioId = rp.portfolioId "
				+ " WHERE v.v_freeze = 0 "
				+ " ORDER BY rp.iccount DESC "
				+ " LIMIT 6 ";
		
		//設定結果集:設定結果類型為List<Map<String, Object>>
		Query q =  session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		
		List<Map<String, Object>> ans = q.list();	
		
		return ans;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryKeyword(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT v.videoFile,v.videoPic,v.v_freeze,pf.portfolioId,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " WHERE ( pf.portfolioName LIKE :keyword "
				+ " OR ct.cityName  LIKE :keyword "
				+ " OR cn.countryName LIKE :keyword "
				+ " OR cnt.continentName LIKE :keyword ) AND v.v_freeze = 0 " ;
		
		//設定結果集:設定結果類型為List<Map<String, Object>>
		Query q =  session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		
		List<Map<String, Object>> ans = q.
					setParameter("keyword","%" + keyword  +"%").list();	
		
		return ans;
	}


	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryKeywordASC(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT v.videoFile,v.videoPic,v.v_freeze,pf.portfolioId,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " WHERE ( pf.portfolioName LIKE :keyword "
				+ " OR ct.cityName  LIKE :keyword "
				+ " OR cn.countryName LIKE :keyword "
				+ " OR cnt.continentName LIKE :keyword ) AND v.v_freeze = 0 "
				+ " ORDER BY pf.p_createTime ASC ";
		
		//設定結果集:設定結果類型為List<Map<String, Object>>
		Query q =  session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		
		List<Map<String, Object>> ans = q.
					setParameter("keyword","%" + keyword  +"%").list();	
		
		return ans;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryKeywordDESC(String keyword) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT v.videoFile,v.videoPic,v.v_freeze,pf.portfolioId,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " WHERE ( pf.portfolioName LIKE :keyword "
				+ " OR ct.cityName  LIKE :keyword "
				+ " OR cn.countryName LIKE :keyword "
				+ " OR cnt.continentName LIKE :keyword ) AND v.v_freeze = 0 "
				+ " ORDER BY pf.p_createTime DESC ";
		
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
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryPersonalKeyword(String keyword, Integer mId) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT v.videoFile,v.videoPic,v.v_freeze,pf.portfolioId,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN member mb ON mb.mId = pf.mId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " WHERE ( pf.portfolioName LIKE :keyword "
				+ " OR ct.cityName  LIKE :keyword "
				+ " OR cn.countryName LIKE :keyword "
				+ " OR cnt.continentName LIKE :keyword ) AND mb.mId = :mId AND v.v_freeze = 0 " ;
		
		//設定結果集:設定結果類型為List<Map<String, Object>>
		Query q =  session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		
		List<Map<String, Object>> ans = q.
					setParameter("keyword","%" + keyword  +"%").setParameter("mId", mId).list();	
		
//		for(Map<String, Object> map:ans) {
//		System.out.println(map.get("mId"));
//		System.out.println(map.get("cityName"));
//		System.out.println(map.get("countryName"));
//		System.out.println(map.get("continentName"));
//		System.out.println(map.get("portfolioName"));
//	}
		return ans;
	}
	




}