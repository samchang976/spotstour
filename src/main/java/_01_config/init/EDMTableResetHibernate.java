package _01_config.init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import _00_util.GlobalService;
import _02_model.entity.MemberBean;
import _02_model.entity.test.BookBean;
import _02_model.entity.test.CompanyBean;
import _02_model.entity.test.ItemBean;
import _02_model.entity.test.Item_typeBean;




// 本程式建立範例程式所需要的表格與部分表格的初始資料
// 範例程式所需要的表格如下：
// 
public class EDMTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {
		String path = "src\\main\\webapp\\WEB-INF\\applicationContext.xml";
		@SuppressWarnings("resource")
		ApplicationContext ctx = new FileSystemXmlApplicationContext(path);
//		SessionFactory factory = HibernateUtils.getSessionFactory();
//		Session session = factory.openSession();
		SessionFactory factory = (SessionFactory) ctx.getBean("sessionFactory");
		Session session = factory.openSession();
		Transaction tx = null;

		String line = "";
		int count = 0;
		// 1. BookCompany表格
		// 1-1 由"data/bookCompany.dat"逐筆讀入BookCompany表格內的初始資料，
		// 然後依序新增到BookCompany表格中
		try (FileReader fr = new FileReader("data/bookCompany.dat"); BufferedReader br = new BufferedReader(fr);) {
			while ((line = br.readLine()) != null) {
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				String name = token[0];
				String address = token[1];
				String url = token[2];
				CompanyBean cb = new CompanyBean(null, name, address, url);
				try {
					tx = session.beginTransaction();
					session.save(cb);
					tx.commit();
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
			}
			System.out.println("BookCompany 資料新增成功");
		} catch (IOException e) {
			System.err.println("新建BookCompany表格時發生IO例外: " + e.getMessage());
		}

		// 2. Book表格
		File file = new File("data/book.dat");
		// 2-1 由"data/book.dat"逐筆讀入Book表格內的初始資料，然後依序新增
		// 到Book表格中
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				BookBean book = new BookBean();
				book.setTitle(token[0]);
				book.setAuthor(token[1]);
				book.setListPrice(Double.parseDouble(token[2].trim()));
				book.setDiscount(Double.parseDouble(token[3].trim()));
				book.setCompanyId(Integer.parseInt(token[4].trim()));
				// 讀取圖片檔
				Blob blob = GlobalService.fileToBlob(token[5].trim());
				book.setCoverImage(blob);
				book.setFileName(GlobalService.extractFileName(token[5].trim()));
				book.setBookNo(token[6].trim());
				book.setStock(Integer.parseInt(token[7].trim()));
				book.setCategory(token[8].trim());
				try {
					tx = session.beginTransaction();
					CompanyBean companyBean = session.get(CompanyBean.class, Integer.parseInt(token[4].trim()));
					book.setCompanyBean(companyBean);

					session.save(book);
					tx.commit();
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
				System.out.println("新增一筆Book紀錄");
			}
			// 印出資料新增成功的訊息
			System.out.println("Book資料新增成功");
		} catch (Exception e) {
			System.err.println("新建BookCompany表格時發生IO例外: " + e.getMessage());
		}

		// 3. Member表格
		// 3-1 由"data/Input.txt"逐筆讀入Member表格內的初始資料，
		// 然後依序新增到Member表格中
		try (FileInputStream fis = new FileInputStream("data/Input.txt");
				InputStreamReader isr0 = new InputStreamReader(fis, "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				MemberBean bean = new MemberBean();
				bean.setmAN(sa[0]);
				bean.setmName(sa[1]);
				String pswd = GlobalService.getMD5Endocing(GlobalService.encryptString(sa[2]));
				bean.setmPw(pswd);
				bean.setD_mAddress(sa[3]);
				bean.setmEmail(sa[4]);
				bean.setmPhone(sa[5]);
				bean.setmGender(sa[6]);

				bean.setM_createTime(new java.sql.Timestamp(System.currentTimeMillis()));

				// --------------處理Blob(圖片)欄位----------------
				Blob sb = GlobalService.fileToBlob(sa[7]);
				bean.setmPic(sb);
				String imageFileName = sa[7].substring(sa[7].lastIndexOf("/") + 1);
				bean.setFileName(imageFileName);

				bean.setmUid(sa[8]);

				new Date(count);
				Date date = Date.valueOf(sa[9]);
				bean.setmBDay(date);

				try {
					tx = session.beginTransaction();
					session.save(bean);
					tx.commit();
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
				count++;
				System.out.println("新增" + count + "筆記錄:" + sa[1]);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		// 4. Item_type表格
		// 4-1 由"data/Item_type.dat"逐筆讀入Item_type表格內的初始資料，
		// 然後依序新增到Item_type表格中
		try (FileReader fr = new FileReader("data/item_Type.dat"); 
				BufferedReader br = new BufferedReader(fr);) {
			while ((line = br.readLine()) != null) {
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				String itemType = token[0];
				Item_typeBean cb = new Item_typeBean(null, itemType);
				try {
					tx = session.beginTransaction();
					session.save(cb);
					tx.commit();
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
			}
			System.out.println("Item_type 資料新增成功");
		} catch (IOException e) {
			System.err.println("新建Item_type表格時發生IO例外: " + e.getMessage());
		}

		// 5. Item表格
		File file2 = new File("data/item.dat");
		// 5-1 由"data/item.dat"逐筆讀入Item表格內的初始資料，然後依序新增
		// 到Item表格中
		try (FileInputStream fis = new FileInputStream(file2);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);) {
			while ((line = br.readLine()) != null) {
				System.out.println("line=" + line);
				// 去除 UTF8_BOM: \uFEFF
				if (line.startsWith(UTF8_BOM)) {
					line = line.substring(1);
				}
				String[] token = line.split("\\|");
				ItemBean item = new ItemBean();
				item.setItemHeader(token[0]);
				item.setItemPrice(Integer.parseInt(token[1].trim()));
				item.setItemQty(Integer.parseInt(token[2].trim()));
				item.setItemDes(token[3]);
				item.setCountryId(token[4]);
				item.setItem_typeId(Integer.parseInt(token[5].trim()));

				try {
					tx = session.beginTransaction();
					Item_typeBean item_typeBean = session.get(Item_typeBean.class, Integer.parseInt(token[5].trim()));
					item.setItem_typeBean(item_typeBean);

					session.save(item);
					tx.commit();
				} catch (Exception ex) {
					if (tx != null)
						tx.rollback();
				}
				System.out.println("新增一筆Item紀錄");
			}
			// 印出資料新增成功的訊息
			System.out.println("Item資料新增成功");
		} catch (Exception e) {
			System.err.println("新建Item_type表格時發生IO例外: " + e.getMessage());
		}

	}
}