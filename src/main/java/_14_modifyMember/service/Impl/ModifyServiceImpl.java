package _14_modifyMember.service.Impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import _02_model.entity.MemberBean;
import _02_model.entity.Member_permBean;
import _14_modifyMember.dao.ModifyDao;
import _14_modifyMember.service.ModifyService;

@Service
@Transactional
public class ModifyServiceImpl implements ModifyService{

	@Autowired
	ModifyDao modifyDao;
	
	@Override
	public void save(MemberBean mb) {
		modifyDao.save(mb);
		
	}

	@Override
	public void delete(Integer mId) {
		modifyDao.delete(mId);
		
	}

	@Override
	public MemberBean get(Integer mId) {
		return modifyDao.get(mId);
	}

	@Override
	public void update(MemberBean mbN, Integer mId, Integer mPid) {
		
		MemberBean memberBean = modifyDao.get(mId);
		Member_permBean mpermBean = modifyDao.getperm(mPid);
		
		memberBean.setmAN(mbN.getmAN());
		memberBean.setmName(mbN.getmName());
		memberBean.setmPw(mbN.getmPw());
		memberBean.setmTPw(mbN.getmTPw());
		memberBean.setD_mAddress(mbN.getD_mAddress());
		memberBean.setmGender(mbN.getmGender());
		memberBean.setmUid(mbN.getmUid());
		memberBean.setmEmail(mbN.getmEmail());
		memberBean.setmBDay(mbN.getmBDay());
		memberBean.setmPhone(mbN.getmPhone());
		memberBean.setM_createTime(mbN.getM_createTime());
		memberBean.setM_verify(mbN.getM_verify());
		mpermBean.setmPid(mPid);
		
		MultipartFile picture = mbN.getMultipartFile(); // 圖片本人
		String originalFilename = picture.getOriginalFilename(); // 圖片的檔名
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			memberBean.setmPic("memberImages/" + originalFilename);
		}
//		String folderPath = "D:/_JSP/workspace/spotstourHSM05/src/main/webapp/images/memberImages";
		String folderPath = "C:/_Hibernate/workspace/SpotsTourHSM/src/main/webapp/images/memberImages";
		
		File theDir = new File(folderPath);
		if (!theDir.exists()) {
			theDir.mkdirs();
		}

		try (InputStream in = picture.getInputStream();
				OutputStream out = new FileOutputStream(folderPath + "/" + originalFilename)) {

			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = in.read(buffer)) != -1) {
				out.write(buffer, 0, len);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		modifyDao.update(memberBean);
		
	}

	@Override
	public List<MemberBean> getAll() {
		return modifyDao.getAll();
	}

}
