package _91_managerMart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _02_model.entity.ActivityBean;
import _91_managerMart.dao.ManagerActivityDao;
import _91_managerMart.service.ManagerActivityService;


@Service
public class ManagerActivityServiceImpl implements ManagerActivityService{

	
	@Autowired
	ManagerActivityDao managetActivityDao;

	//編輯活動列表
	@Transactional
	@Override
	public ActivityBean getActivityByActivityId(int activityId) {
		ActivityBean activityBean = null;
		activityBean = managetActivityDao.getActivityByActivityId(activityId);
		return activityBean;
	}

	@Transactional
	@Override
	public void freezeActivityByActivityId(int activityId) {
		managetActivityDao.freezeActivityByActivityId(activityId);
	}

	@Transactional
	@Override
	public void updateActivity(ActivityBean activityBeanN) {
		ActivityBean activityBeanO = managetActivityDao.getActivityByActivityId(activityBeanN.getActivityId());
		
		activityBeanO.setActivityHeader(activityBeanN.getActivityHeader());
		activityBeanO.setActivityContent(activityBeanN.getActivityContent());
		
		managetActivityDao.updateActivity(activityBeanO);
		
	}

	@Transactional
	@Override
	public List<ActivityBean> getAllActivitys() {
		return managetActivityDao.getAllActivitys();
	}

	@Transactional
	@Override
	public void addActivity(ActivityBean activityBean) {
		managetActivityDao.addActivity(activityBean);		
	}
}
