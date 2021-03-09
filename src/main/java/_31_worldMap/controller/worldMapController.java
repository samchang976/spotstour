package _31_worldMap.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class worldMapController {
	
	@RequestMapping("/worldMap")
	public String worldMap() {
		return "_31_portfolio/worldMap";
	}
}
