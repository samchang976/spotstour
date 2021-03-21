package _31_worldMap.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import _31_worldMap.service.WorldMapService;

@Controller
public class worldMapController {
	
	@Autowired
	private WorldMapService worldMapService;
	
	@RequestMapping("/worldMap")
	public String worldMap() {
		return "_31_portfolio/WorldMap";
	}
	
	
	
}
