package _14_modifyMember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import _14_modifyMember.service.ModifyService;

@Controller
public class ModifyController {

	@Autowired
	ModifyService modifyService;
	
	@RequestMapping("memberDetailModify")
	public String getMemberDetailModify() {
		return "_11_member/MemberDetailModify";
	}
	
	
	
	
	
	
	
	
}
