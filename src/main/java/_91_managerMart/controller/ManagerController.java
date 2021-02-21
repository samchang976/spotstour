package _91_managerMart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {

	@RequestMapping("/merchandiseModify")
	public String AddMerchandise() {
		return "_91_manageMart/MerchandiseModify";
	}
	
}
