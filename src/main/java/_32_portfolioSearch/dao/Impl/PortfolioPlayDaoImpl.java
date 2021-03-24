package _32_portfolioSearch.dao.Impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _32_portfolioSearch.dao.PortfolioPlayDao;

@Repository
public class PortfolioPlayDaoImpl implements PortfolioPlayDao {

	@Autowired
	SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryPortfolioId(Integer portfolioId) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT v.videoFile,v.videoPic,v.v_freeze,rpv.vcount,rpb.bcount,rpg.gcount,pf.portfolioId,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude,ct.cityName,cn.countryName,cnt.continentName "
				+ " FROM video v " 
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN city ct ON pf.cityId = ct.cityId "
				+ " LEFT JOIN country cn ON ct.countryId = cn.countryId "
				+ " LEFT JOIN continent cnt ON cn.continentId = cnt.continentId "
				+ " LEFT JOIN (SELECT COUNT(r.portfolioId) vcount,r.portfolioId "
			    + " FROM record r "
				+ " WHERE r.paramId = 3 "
				+ " GROUP BY r.portfolioId ) rpv ON pf.portfolioId = rpv.portfolioId "
				+ " LEFT JOIN (SELECT COUNT(r.portfolioId) bcount,r.portfolioId "
			    + " FROM record r "
				+ " WHERE r.paramId = 2 "
				+ " GROUP BY r.portfolioId ) rpb ON pf.portfolioId = rpb.portfolioId "
				+ " LEFT JOIN (SELECT COUNT(r.portfolioId) gcount,r.portfolioId "
			    + " FROM record r "
			    + " WHERE r.paramId = 1 "
			    + " GROUP BY r.portfolioId ) rpg ON pf.portfolioId = rpg.portfolioId "
				+ " WHERE pf.portfolioId = :portfolioId ";

		// 設定結果集:設定結果類型為List<Map<String, Object>>
		Query q = session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);

		List<Map<String, Object>> ans = q.setParameter("portfolioId", portfolioId).list();

		return ans;
	}

}
