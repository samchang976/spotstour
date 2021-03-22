package _00_utilH;
//
///*  
//    程式說明：建立表格與設定初始測試資料。
//    表格包括：Book, BookCompany, Member, Orders, OrderItems
// 
//*/

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Blob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_util.SystemUtilsFile;
import _02_model.entity.ActivityBean;

public class EDMTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

//	@Autowired
//	static
//	SessionFactory factory = null;
	
	public static void main(String args[]) {
		
		

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		
		
		Transaction tx = null;
		try { 
			tx = session.beginTransaction();
			File file = new File("data/activitys.dat");
			
			// 2. 由"data/book.dat"逐筆讀入Book表格內的初始資料，然後依序新增
			// 到Book表格中
			try (
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);
			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1); 
					}
					String[] token = line.split("\\|");
					//依據activityId 取得 ActivityBean
					Integer activityId = Integer.valueOf(token[0].trim());
					ActivityBean activityBean = session.get(ActivityBean.class, activityId);
					
					// 讀取圖片檔
					Blob blobPic = SystemUtilsFile.fileToBlob(token[1].trim());
					
					activityBean.setActivityPic(blobPic);
					
					activityBean.setActivityFileName(SystemUtilsFile.extractFileName(token[1].trim()));
					
				
					session.update(activityBean);
					System.out.println("更新一筆activityBean紀錄成功");
				}
				// 印出資料新增成功的訊息
				session.flush();
				System.out.println("更新activityBean紀錄成功");
			}catch (Exception ex) {
				ex.printStackTrace();
			}

            tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		} 
        factory.close();
	}

}