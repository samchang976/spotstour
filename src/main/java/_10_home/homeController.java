package _10_home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class homeController {
	
	//首頁
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() {
		return "index";
		
	}
}
