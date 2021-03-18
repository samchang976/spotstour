package _37_portfolioManage.dao.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_model.entity.VideoBean;
import _37_portfolioManage.dao.VideoDao;

@Repository
public class VideoDaoImpl implements VideoDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addVideo(VideoBean videoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(videoBean);
		
	}

	@Override
	public void updateVideo(VideoBean videoBean) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(videoBean);
	}
	
}
