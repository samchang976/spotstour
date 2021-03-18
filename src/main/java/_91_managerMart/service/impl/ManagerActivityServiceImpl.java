package _91_managerMart.service.impl;

import java.sql.Blob;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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

		long sizeInBytes = -1;

		// 照片
		MultipartFile picture = activityBeanN.getActivityImage();
		// 表示使用者未挑選圖片
		if (picture.getSize() == 0) {
			sizeInBytes = -1;
		} else {
			sizeInBytes = picture.getSize();
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				activityBeanO.setActivityFileName(originalFilename);
			}
			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					activityBeanO.setActivityPic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		
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
