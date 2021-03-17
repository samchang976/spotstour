package _91_managerMart.controller;

import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import _02_model.entity.ActivityBean;
import _02_model.entity.ItemBean;
import _91_managerMart.service.ManagerActivityService;

@Controller
public class ActivityController {

	@Autowired
	ManagerActivityService managerActivityService;

	@RequestMapping("/activityList")
	public String getAllActivityList(Model model) {
		List<ActivityBean> list = managerActivityService.getAllActivitys();
		model.addAttribute("activitys", list);
		return "_91_manageMart/ActivityList";
	}

	@RequestMapping("/activityDetail/Id={activityId}")
	public String getActivityById(@ModelAttribute("activityId") Integer activityId, Model model) {
		ActivityBean activityBean = managerActivityService.getActivityByActivityId(activityId);
		model.addAttribute("activityBean", activityBean);
		return "_21_shoppingMall/ActivityDetail";
	}

//	@RequestMapping("/activityModify")
//	public String activityModify() {
//		return "_91_manageMart/ActivityModify";
//	}

	@RequestMapping("/aboutMerchandiseModify")
	public String aboutMerchandiseModify() {
		return "_91_manageMart/AboutMerchandiseModify";
	}

	@RequestMapping("/aboutUsModify")
	public String aboutUsModify() {
		return "_91_manageMart/AboutUsModify";
	}

	@RequestMapping("/contactUsModify")
	public String contactUsModify() {
		return "_91_manageMart/ContactUsModify";
	}

	// 查詢所有活動資料
	@GetMapping("/activitys")
	public @ResponseBody List<ActivityBean> getAllActivitys(Model model) {
		List<ActivityBean> activitys = managerActivityService.getAllActivitys();
		return activitys;
	}

	// 讀取並傳回單筆活動
	@GetMapping(value = "/activitysEdit/{key}", produces = { "application/json" })
	public String displayActivity(@PathVariable Integer activityId, Model model) {
		model.addAttribute("activityId", activityId);
		return "_91_manageMart/ContactUsModify";
	}

	// 凍結活動(刪除)
	@GetMapping("/activityList/delete/Id={activityId}")
	public String freezeActivity(@ModelAttribute("activityId") Integer activityId) {
		managerActivityService.freezeActivityByActivityId(activityId);
		return "redirect:/activityList";
	}

	// 編輯及更新活動
	@GetMapping({ "/activityModify/Id={activityId}" })
	public String getActivity(@ModelAttribute(value = "activityId") Integer activityId,
			@ModelAttribute("activityBean") ActivityBean activityBeanN, Model model) {
		return "_91_manageMart/ActivityModify";
	}

	// 編輯及更新活動
	@PostMapping({ "/activityModify/Id={activityId}" })
	public String updateActivity(@ModelAttribute(value = "activityId") Integer activityId,
			@ModelAttribute("activityBean") ActivityBean activityBeanN, Model model) throws InterruptedException {
		managerActivityService.updateActivity(activityBeanN);
		Thread.sleep(5000);
		return "redirect:/activityList";
	}

	// 新增活動
	@GetMapping("/activityModify")
	public String getNewActivityForm(@ModelAttribute("activityBean") ActivityBean activityBean, Model model) {
		return "_91_manageMart/ActivityModify";
	}

	// 新增活動
	@PostMapping("/activityModify")
	public String addNewActivityForm(@ModelAttribute("activityBean") ActivityBean activityBean, Model model)
			throws InterruptedException {

		// 圖片上傳
		// step1: 從前端取得使用者上傳圖片的路徑
		MultipartFile activityImage = activityBean.getActivityImage();// 圖片本身
		String originalFilename = activityImage.getOriginalFilename();
		activityBean.setActivityFileName(originalFilename);

		// step2: 建立Blob物件，交由 Hibernate寫入資料庫
		if (activityImage != null && !activityImage.isEmpty()) {
			try {
//	    需要先得到byte[]，才能透過SerialBlob(byte[] b) 得到Blob的物件
				byte[] b = activityImage.getBytes();
				Blob blob = new SerialBlob(b);
				activityBean.setActivityPic(blob);
			} catch (Exception e) {
				throw new RuntimeException("照片上傳時發生異常: " + e.getMessage());
			}
		}
		
		managerActivityService.addActivity(activityBean);
		
		Thread.sleep(5000);
		return "redirect:/activityList";
	}

	// ===============

	// 取得活動資訊
	@ModelAttribute
	public ActivityBean getActivityBean(@PathVariable(value = "activityId", required = false) Integer activityId,
			Model model) {
		ActivityBean activityBean = null;
		if (activityId != null) {
			activityBean = managerActivityService.getActivityByActivityId(activityId);
		} else {
			activityBean = new ActivityBean();
			activityBean.setActivityHeader("活動三");
			activityBean.setActivityContent("測試活動");

			Date utilDate = new Date();// util.Date
//			System.out.println("utilDate : " + utilDate);
			// util.Date轉sql.Date
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//			System.out.println("sqlDate : " + sqlDate);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
			sdf.format(sqlDate);

			activityBean.setActivity_createTime(sqlDate);
			activityBean.setActivity_freeze(0);
			model.addAttribute("activityBean", activityBean);
		}
		return activityBean;
	}

}
