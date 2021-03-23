package _32_portfolioSearch.dao.Impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.internal.build.AllowSysOut;
import org.hibernate.query.Query;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.Portfolio_MsgBean;
import _32_portfolioSearch.controller.vo.Portfolio_MsgBeanVo;
import _32_portfolioSearch.dao.PortfolioMsgDao;

@Repository
public class PortfolioMsgDaoImpl implements PortfolioMsgDao {
	
	@Autowired
	SessionFactory sessionFactory;

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> getPortfolioMsgList(Integer portfolioId) {
		Session session = sessionFactory.getCurrentSession();
		String sql = 
				  " SELECT ps.portfolioId,ps.portfolioMsgId,ps.msgText,ps.pm_createTime,ps.pmsg_freeze,mb.mId,mb.mName,mb.mPic "
				+ " FROM portfoliomsg ps "
				+ " LEFT JOIN portfolio pf ON ps.portfolioId = pf.portfolioId "
				+ " LEFT JOIN member mb ON ps.mId = mb.mId "
				+ " WHERE ps.portfolioId = :portfolioId AND ps.pmsg_freeze = 0 " ;
//		String sql = " SELECT n.portfolioId,n.portfolioMsgId,n.pmsg_freeze,n.msgText,n.pm_createTime,n.pmsg_freeze,mb.mId,mb.mName,mb.mPic "
//				+ " FROM "
//				+ " ( SELECT ps.portfolioId,ps.portfolioMsgId,ps.msgText,ps.pm_createTime,ps.pmsg_freeze,ps.mId "
//				+ " FROM portfoliomsg ps "
//				+ " LEFT JOIN portfolio pf ON ps.portfolioId = pf.portfolioId "
//				+ " WHERE ps.portfolioId = :portfolioId AND ps.pmsg_freeze = 0 ) n "
//				+ " LEFT JOIN MEMBER mb ON n.mId = mb.mId ";
		
		// 設定結果集:設定結果類型為List<Map<String, Object>>
		Query q = session.createNativeQuery(sql);
		q.unwrap(NativeQueryImpl.class).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);

		List<Map<String, Object>> ans = q.setParameter("portfolioId", portfolioId).list();
		for(Map<String, Object> map:ans) {
			System.out.println(map.get("mId"));
			System.out.println(map.get("msgText"));
		}
		return ans;
	}

	//新增影片留言
	@Override
	public void addPortfolioMsg(Portfolio_MsgBean portfolio_MsgBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(portfolio_MsgBean);
	}

	//修改影片留言
	@Override
	public void updatePortfolioMsg(Portfolio_MsgBean portfolio_MsgBean) {
		Session session = sessionFactory.getCurrentSession();
		session.merge(portfolio_MsgBean);
	}
	
	

}
