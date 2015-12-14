package com.hnb.event;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hnb.global.Command;
import com.hnb.global.CommandFactory;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;

@Controller
@RequestMapping("/event")
public class EventController {
	@Autowired MemberServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@RequestMapping("/boardList")
	public String boardList(
			@RequestParam(value="pageNo",defaultValue="1")String pageNo,
			@RequestParam(value="column",required=false)String column,
			@RequestParam(value="searchKey",required=false)String searchKey,
			Model model){
		logger.info("EventController-boardList");
		/*Command command = CommandFactory.list(pageNo);*/
		model.addAttribute("memberList",service.getList(CommandFactory.list(pageNo))); /*타일즈의 .jsp로 들어가게됨*/
		model.addAttribute("count", service.count());
		model.addAttribute("pageNo",1);
		return "event/boardList.jsp";
	}
}
