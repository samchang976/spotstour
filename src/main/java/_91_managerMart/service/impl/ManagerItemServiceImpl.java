package _91_managerMart.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import _00_util.StreamUtils;
import _02_model.entity.CountryBean;
import _02_model.entity.FeedbackBean;
import _02_model.entity.ItemBean;
import _02_model.entity.Item_typeBean;
import _91_managerMart.dao.ManagerItemDao;
import _91_managerMart.service.ManagerItemService;



@Service
public class ManagerItemServiceImpl implements ManagerItemService {

	@Autowired
	ManagerItemDao managetItemDao;
//	@Autowired
//	SessionFactory factory;

	@Transactional
	@Override
	public ItemBean getItemByItemId(int itemId) {
		ItemBean itembean = null;
		itembean = managetItemDao.getItemByItemId(itemId);
		return itembean;
	}

	// 凍結商品(刪除)
	@Transactional
	@Override
	public void freezeItemByItemId(int itemId) {
		managetItemDao.freezeItemByItemId(itemId);
	}
	
	// 凍結商品留言(刪除)
	@Transactional
	@Override
	public void freezeFeedbackByFeedbackId(int feedbackId) {
		managetItemDao.freezeFeedbackByFeedbackId(feedbackId);
	}
	
	@Transactional
	@Override
	public void editItemByItemId(int itemId) {
		managetItemDao.editItemByItemId(itemId);
	}

//	@Transactional
//	@Override
//	public int saveItem(ItemBean itembean) {
//		int n = 0;
//		boolean b = managetItemDao.saveItem(itembean);
//		if (b = true) {
//			return n = 1;
//		} else {
//			return n = 0;
//		}
//	}
	
	//陳列全部商品
	@Transactional
	@Override
	public List<ItemBean> getAllItems() {
		return managetItemDao.getAllItems();
	}

	//陳列全部商品留言
	@Transactional
	@Override
	public List<FeedbackBean> getAllFeedbacks() {
		return managetItemDao.getAllFeedbacks();
	}
	
	//陳列全部商品留言
	@Transactional
	@Override
	public List<FeedbackBean> getAllFeedbacksById(int itemId) {
		return managetItemDao.getAllFeedbacksById(itemId);
	}
	
	//新增商品
	@Transactional
	@Override
	public void addItem(ItemBean itemBean) {
		
		// 圖片處理
		MultipartFile picture1 = itemBean.getItemImage1(); // 圖片本人
		String originalFilename1 = picture1.getOriginalFilename(); // 圖片的檔名
		if (originalFilename1.length() > 0 && originalFilename1.lastIndexOf(".") > -1) {
			itemBean.setItemPic1("itemImages/" + originalFilename1); // 將檔名存入資料庫
		}
		
		MultipartFile picture2 = itemBean.getItemImage2(); // 圖片本人
		String originalFilename2 = picture2.getOriginalFilename(); // 圖片的檔名
		if (originalFilename2.length() > 0 && originalFilename2.lastIndexOf(".") > -1) {
			itemBean.setItemPic2("itemImages/" + originalFilename2); // 將檔名存入資料庫
		}
		
		MultipartFile picture3 = itemBean.getItemImage3(); // 圖片本人
		String originalFilename3 = picture3.getOriginalFilename(); // 圖片的檔名
		if (originalFilename3.length() > 0 && originalFilename3.lastIndexOf(".") > -1) {
			itemBean.setItemPic3("itemImages/" + originalFilename3); // 將檔名存入資料庫
		}
		
		// 將圖片存入資料夾
//		String folderPath = String.format("C:/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/itemImages/%s",
//				itemBean.getItemId());
		
		String folderPath = "C:/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/itemImages";
		
		File theDir = new File(folderPath);
		if (!theDir.exists()) {
			theDir.mkdirs();
		}

		try (InputStream in = picture1.getInputStream();
				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename1)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try (InputStream in = picture2.getInputStream();
				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename2)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		try (InputStream in = picture3.getInputStream();
				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename3)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//將接取的圖片檔案儲存到本地,拿取路徑字串,放入要送到對應資料庫圖片的Bean
//				MultipartFile mfp = itemBean.getItemImage1();
//				//隨機唯一圖片檔名
//				UUID puuid = UUID.randomUUID();
//				String picPath = "/_Hibernate/workspace_JSP/SpotsTourHSM/src/main/webapp/images/vedioImages/";
//				String picName = puuid + ".jpg";
//				try {
//					itemBean.setItemPic1(StreamUtils.writeStream(mfp.getBytes(),picPath,picName));
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}	
		
		managetItemDao.addItem(itemBean);
	}
	
	//新增留言
	@Transactional
	@Override
	public void addFeedback(FeedbackBean feedbackBean) {
		managetItemDao.addFeedback(feedbackBean);
	}

	@Transactional
	@Override
	public Item_typeBean getItem_TypeById(int itId) {
		return managetItemDao.getItem_TypeById(itId);
	}
	
	@Transactional
	@Override
	public CountryBean getCountryById(int countryId) {
		return managetItemDao.getCountryById(countryId);
	}

	//取得item_type list
	@Transactional
	@Override
	public List<Item_typeBean> getItem_TypeList() {
		return managetItemDao.getItem_TypeList();
	}
	
	//取得country list
	@Transactional
	@Override
	public List<CountryBean> getCountryList() {
		return managetItemDao.getCountryList();
	}
	
	//編輯及更新商品
	@Transactional
	@Override
	public void updateItem(ItemBean itemBeanN) {
		ItemBean itemBeanO = managetItemDao.getItemByItemId(itemBeanN.getItemId());
		Item_typeBean isb = managetItemDao.getItem_TypeById(itemBeanN.getItem_typeBean().getItId());
		CountryBean cb = managetItemDao.getCountryById(itemBeanN.getCountryBean().getCountryId());
		
//		itemBeanO.setCountryTId(itemBeanN.getCountryTId());
//		itemBeanO.setItTId(itemBeanN.getItTId());
		itemBeanO.setItemDes(itemBeanN.getItemDes());
		itemBeanO.setItemHeader(itemBeanN.getItemHeader());
		itemBeanO.setItemPrice(itemBeanN.getItemPrice());
		itemBeanO.setItemQty(itemBeanN.getItemQty());
		itemBeanO.setItemPic1(itemBeanN.getItemPic1());
		itemBeanO.setItemPic2(itemBeanN.getItemPic2());
		itemBeanO.setItemPic3(itemBeanN.getItemPic3());
		
//		// 圖片處理
//		MultipartFile picture1 = itemBeanN.getItemImage1(); // 圖片本人
//		String originalFilename1 = picture1.getOriginalFilename(); // 圖片的檔名
//		if (originalFilename1.length() > 0 && originalFilename1.lastIndexOf(".") > -1) {
//			itemBeanO.setItemPic1("itemImages/" + originalFilename1); // 將檔名存入資料庫
//		}
//		
//		MultipartFile picture2 = itemBeanN.getItemImage2(); // 圖片本人
//		String originalFilename2 = picture2.getOriginalFilename(); // 圖片的檔名
//		if (originalFilename2.length() > 0 && originalFilename2.lastIndexOf(".") > -1) {
//			itemBeanO.setItemPic2("itemImages/" + originalFilename2); // 將檔名存入資料庫
//		}
//		
//		MultipartFile picture3 = itemBeanN.getItemImage3(); // 圖片本人
//		String originalFilename3 = picture3.getOriginalFilename(); // 圖片的檔名
//		if (originalFilename3.length() > 0 && originalFilename3.lastIndexOf(".") > -1) {
//			itemBeanO.setItemPic3("itemImages/" + originalFilename3); // 將檔名存入資料庫
//		}
//		
//		// 將圖片存入資料夾
////		String folderPath = String.format("C:/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/itemImages/%s",
////				itemBean.getItemId());
//		
//		String folderPath = "C:/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/itemImages";
//		
//		File theDir = new File(folderPath);
//		if (!theDir.exists()) {
//			theDir.mkdirs();
//		}
//
//		try (InputStream in = picture1.getInputStream();
//				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename1)) {
//
//			byte[] buffer = new byte[1024];
//			int len = -1;
//			while ((len = in.read(buffer)) != -1) {
//				out.write(buffer, 0, len);
//			}
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		try (InputStream in = picture2.getInputStream();
//				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename2)) {
//
//			byte[] buffer = new byte[1024];
//			int len = -1;
//			while ((len = in.read(buffer)) != -1) {
//				out.write(buffer, 0, len);
//			}
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		try (InputStream in = picture3.getInputStream();
//				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename3)) {
//
//			byte[] buffer = new byte[1024];
//			int len = -1;
//			while ((len = in.read(buffer)) != -1) {
//				out.write(buffer, 0, len);
//			}
//
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		//將接取的圖片檔案儲存到本地,拿取路徑字串,放入要送到對應資料庫圖片的Bean
//				MultipartFile mfp = itemBean.getItemImage1();
//				//隨機唯一圖片檔名
//				UUID puuid = UUID.randomUUID();
//				String picPath = "/_Hibernate/workspace_JSP/SpotsTourHSM/src/main/webapp/images/vedioImages/";
//				String picName = puuid + ".jpg";
//				try {
//					itemBean.setItemPic1(StreamUtils.writeStream(mfp.getBytes(),picPath,picName));
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}	
		
		
		itemBeanO.setItem_typeBean(isb);
		itemBeanO.setCountryBean(cb);
		managetItemDao.updateItem(itemBeanO);
	}
}
