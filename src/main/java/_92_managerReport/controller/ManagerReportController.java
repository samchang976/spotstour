package _92_managerReport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerReportController {
	
	@RequestMapping("/manageMerchandiseReport")
	public String manageMerchandiseReport() {
		return "_91_manageMart/ManageMerchandiseReport";
	}
	
	@RequestMapping("/manageVideoReport")
	public String manageVideoReport() {
		return "_91_manageMart/ManageVideoReport";
	}
	
}
