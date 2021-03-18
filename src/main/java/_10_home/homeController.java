package _10_home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class homeController {
	
	//首頁
	@RequestMapping(value={"/", "index"}, method=RequestMethod.GET)
	public String home() {
		
		return "index";
	}
}
