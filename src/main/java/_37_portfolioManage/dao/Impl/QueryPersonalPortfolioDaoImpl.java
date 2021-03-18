package _37_portfolioManage.dao.Impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _37_portfolioManage.dao.QueryPersonalPortfolioDao;

@Repository
public class QueryPersonalPortfolioDaoImpl implements QueryPersonalPortfolioDao{

	@Autowired
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getMemberPortfolio(Integer imId) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT m.mId,c.cityId,c.cityName,pt.placeTypeId,pt.placeType,v.videoId,v.videoFile,v.videoPic,v.v_freeze,pf.portfolioId,pf.portfolioName,pf.portfolioText,pf.p_createTime,pf.pAddress,pf.longitude,pf.latitude "
				+ " FROM video v "
				+ " LEFT JOIN portfolio pf ON v.portfolioId = pf.portfolioId "
				+ " LEFT JOIN MEMBER m ON pf.mId = m.mId "
				+ " LEFT JOIN city c ON pf.cityId = c.cityId "
				+ " LEFT JOIN place_type pt ON pf.placeTypeId = pt.placeTypeId "
				+ " WHERE m.mId = :imId AND v.v_freeze = 0";
		//設定結果集:設定結果類型為List<Map<String, Object>>
		Query q =  session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		
		List<Map<String, Object>> ans = q.
				setParameter("imId",imId).list();	
	
		return ans;
	}

}
