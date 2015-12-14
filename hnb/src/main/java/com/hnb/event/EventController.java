package com.hnb.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@RequestMapping("/article")
	public String article(){
		return "event/article.tiles";
	}
}
