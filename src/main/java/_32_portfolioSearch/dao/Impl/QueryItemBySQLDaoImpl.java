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

import _32_portfolioSearch.dao.QueryItemBySQLDao;

@Repository
public class QueryItemBySQLDaoImpl implements QueryItemBySQLDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryItemsByCnId(Integer countryId) {
		Session session = sessionFactory.getCurrentSession();
		String sql = " SELECT i.itemId,i.itemHeader,i.itemPrice,i.itemQty,i.itemDes,i.itId,i.itemPic1,i.itemPic2,i.itemPic3,i.item_freeze,i.countryId,cn.countryName "
				+ " FROM item i "
				+ " LEFT JOIN country cn ON i.countryId = cn.countryId "
				+ " WHERE cn.countryId = :countryId ";

		
		// 設定結果集:設定結果類型為List<Map<String, Object>>
		Query q = session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);

		List<Map<String, Object>> ans = q.setParameter("countryId", countryId).list();
		//檢查查詢結果
//		for(Map<String, Object> map:ans) {
//			System.out.println(map.get(""));
//			System.out.println(map.get(""));
//		}
		return ans;
	}

	
}
