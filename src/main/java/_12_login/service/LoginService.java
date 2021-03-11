package _12_login.service;

import org.springframework.ui.Model;

import _02_model.entity.MemberBean;

public interface LoginService {
	
	public boolean loginCheck(MemberBean member,Model model);
	
	
}
