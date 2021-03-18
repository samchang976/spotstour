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
		//擁有相同的資料庫標識符(代表資料庫中的同一條紀錄),但具有不同的永續標識符
		session.merge(videoBean);
	}

	
}
