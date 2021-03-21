package _91_managerMart.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.ActivityBean;
import _91_managerMart.dao.ManagerActivityDao;

@Repository
public class ManagerActivityDaoImpl implements Serializable, ManagerActivityDao{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	SessionFactory factory = null;
	
	@Override
	public ActivityBean getActivityByActivityId(int activityId) {
		ActivityBean activityBean = null;
        Session session = factory.getCurrentSession();
        activityBean = session.get(ActivityBean.class, activityId);
		return activityBean;
	}
	
	//凍結商品
	@Override
	public void freezeActivityByActivityId(int activityId) {
		String hql = "UPDATE ActivityBean SET activity_freeze = :freeze WHERE activityId = :id";
		Session session = factory.getCurrentSession();
		int freeze = 1;
		session.createQuery(hql)
		   .setParameter("freeze", freeze)
		   .setParameter("id", activityId)
		   .executeUpdate();
	}

	@Override
	public void updateActivity(ActivityBean activityBean) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(activityBean);		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ActivityBean> getAllActivitys() {
		String hql = "FROM ActivityBean WHERE activity_freeze = 0 ORDER BY activityId DESC";
		Session session = factory.getCurrentSession();
		List<ActivityBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void addActivity(ActivityBean activityBean) {
		Session session = factory.getCurrentSession();
		session.save(activityBean);		
	}

}
