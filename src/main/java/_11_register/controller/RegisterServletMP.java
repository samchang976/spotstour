package _11_register.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import _00_util.GlobalService;
import _02_model.entity.test.MemberBean;
import _11_register.service.MemberService;



@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)

@WebServlet("/_01_register/register.do")
public class RegisterServletMP extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//
	// 設定密碼欄位必須由大寫字母、小寫字母、數字與 !@#$%!^'" 等四組資料組合而成，且長度不能小於八個字元
	//
//	private static final String PASSWORD_PATTERN = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%!^'\"]).{8,})";
//	private static final String PASSWORD_PATTERN = "((?=.*[a-z])(?=.*[A-Z]).{1,})";
	private static final String PASSWORD_PATTERN = "((?=.*[a-z]).{1,})";
	private Pattern pattern = null;
	private Matcher matcher = null;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		// 註冊成功後將用response.sendRedirect()導向新的畫面，所以需要
		// session物件來存放共用資料。
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息

		String memberId = "";
		String mPw = "";
		String mPw1 = "";
		String mName = "";
		String mEmail = "";
		String d_mAddress = "";
		String mPhone = "";
		String fileName = "";
		long sizeInBytes = 0;
		InputStream is = null;

		String mGender = "";
		String mUid = "";
		Date mBDay = null;

		// 取出HTTP multipart request內所有的parts
		Collection<Part> parts = request.getParts();
//		GlobalService.exploreParts(parts, request);
		// 由parts != null來判斷此上傳資料是否為HTTP multipart request
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("memberId")) {
						memberId = value;
					} else if (fldName.equals("mPw")) {
						mPw = value;
					} else if (fldName.equals("mPw1")) {
						mPw1 = value;
					} else if (fldName.equals("mName")) {
						mName = value;
					} else if (fldName.equals("mEmail")) {
						mEmail = value;
					} else if (fldName.equals("d_mAddress")) {
						d_mAddress = value;
					} else if (fldName.equals("mPhone")) {
						mPhone = value;
					} else if (fldName.equals("mGender")) {
						mGender = value;
					} else if (fldName.equals("mUid")) {
						mUid = value;
					} else if (fldName.equals("mBDay")) {
						try {
							SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
							java.util.Date date = simpleDateFormat.parse(value);
							mBDay = new Date(date.getTime());

						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
				} else {
					// 取出圖片檔的檔名
					fileName = GlobalService.getFileName(p);
					// 調整圖片檔檔名的長度，需要檔名中的附檔名，所以調整主檔名以免檔名太長無法寫入表格
					fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
					if (fileName != null && fileName.trim().length() > 0) {
						sizeInBytes = p.getSize();
						is = p.getInputStream();
					}
				}
			}
			// 2. 進行必要的資料轉換
			// (無)
			// 3. 檢查使用者輸入資料
			if (memberId == null || memberId.trim().length() == 0) {
				errorMsg.put("errorIdEmpty", "帳號欄必須輸入");
			}
			if (mPw == null || mPw.trim().length() == 0) {
				errorMsg.put("errormPwEmpty", "密碼欄必須輸入");
			}
			if (mPw1 == null || mPw1.trim().length() == 0) {
				errorMsg.put("errormPw1Empty", "密碼確認欄必須輸入");
			}
			if (mPw.trim().length() > 0 && mPw1.trim().length() > 0) {
				if (!mPw.trim().equals(mPw1.trim())) {
					errorMsg.put("errormPw1Empty", "密碼欄必須與確認欄一致");
					errorMsg.put("errormPwEmpty", "*");
				}
			}

			if (mName == null || mName.trim().length() == 0) {
				errorMsg.put("errormName", "姓名欄必須輸入");
			}
			if (d_mAddress == null || d_mAddress.trim().length() == 0) {
				errorMsg.put("errord_mAddress", "地址欄必須輸入");
			}
			if (mEmail == null || mEmail.trim().length() == 0) {
				errorMsg.put("errormEmail", "電子郵件欄必須輸入");
			}
			if (mPhone == null || mPhone.trim().length() == 0) {
				errorMsg.put("errormPhone", "電話號碼欄必須輸入");
			}
			if (mGender == null || mGender.trim().length() == 0) {
				errorMsg.put("errormGender", "性別欄必須輸入");
			}
			if (mUid == null || mUid.trim().length() == 0) {
				errorMsg.put("errormUid", "身分證欄必須輸入");
			}
			if (mBDay == null) {
				errorMsg.put("errormBDay", "生日欄必須輸入");
			}

		} else {
			errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
		}
		// 如果有錯誤
		if (errorMsg.isEmpty()) {
			pattern = Pattern.compile(PASSWORD_PATTERN);
			matcher = pattern.matcher(mPw);
			if (!matcher.matches()) {
				errorMsg.put("passwordError", "密碼至少含有一個大寫字母、小寫字母、數字與!@#$%!^'\"等四組資料組合而成，且長度不能小於八個字元");
			}
		}
		// 如果有錯誤
		if (!errorMsg.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
			return;
		}
		try {
			// 4. 產生MemberDao物件，以便進行Business Logic運算
			// MemberDaoImpl_Jdbc類別的功能：
			// 1.檢查帳號是否已經存在，已存在的帳號不能使用，回傳相關訊息通知使用者修改
			// 2.若無問題，儲存會員的資料
			ServletContext sc = getServletContext();
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
			MemberService service = ctx.getBean(MemberService.class);
//			MemberBean bean = memberService.queryMember(id);

//			MemberService service = new MemberServiceImpl();
			if (service.mANExists(memberId)) {
				errorMsg.put("errorIdDup", "此帳號已存在，請換新帳號");
			} else {
				// 為了配合Hibernate的版本。
				// 要在此加密，不要在 dao.saveMember(mem)進行加密
				mPw = GlobalService.getMD5Endocing(GlobalService.encryptString(mPw));
				Timestamp m_createTime = new java.sql.Timestamp(System.currentTimeMillis());
				Blob blob = null;
				if (is != null) {
					blob = GlobalService.fileToBlob(is, sizeInBytes);
				}
				// 將所有會員資料封裝到MemberBean(類別的)物件
				MemberBean mem = new MemberBean(null, memberId, mName, mPw, d_mAddress, mEmail, mPhone, mGender, m_createTime,
						blob, fileName, mUid, mBDay);
				// 呼叫MemberDao的saveMember方法
				int n = service.saveMember(mem);
				if (n == 1) {
					msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
					response.sendRedirect("../index.jsp");
					return;
				} else {
					errorMsg.put("errorIdDup", "新增此筆資料有誤(RegisterServlet)");
				}
			}
			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			if (!errorMsg.isEmpty()) {
				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("errorIdDup", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}
}