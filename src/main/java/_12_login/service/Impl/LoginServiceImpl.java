package _12_login.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _02_model.entity.MemberBean;
import _12_login.dao.LoginDao;
import _12_login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;
	@Override
	public boolean loginCheck(MemberBean member) {
		if(loginDao.checkAN(member) != null) {
			MemberBean res = loginDao.checkPw(member);
			member.setMemberPermBean(res.getMemberPermBean());	//將權限加入	
			return true;
		}else {
			return false;
		}
	}


}
