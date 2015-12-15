package com.hnb.event;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//RESTful 방식 (url에 {}이 있어서 @pathVariable 사용한 경우)
	@RequestMapping("/boardList/{pageNo}")
	public String boardList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		logger.info("EventController-boardList");
		logger.info("넘어온 페이지번호 : {}", pageNo);
		logger.info("EventController-boardList");
		/*Command command = CommandFactory.list(pageNo);*/
		model.addAttribute("memberList",service.getList(CommandFactory.list(pageNo))); /*타일즈의 .jsp로 들어가게됨*/
		model.addAttribute("count", service.count());
		model.addAttribute("pageNo",pageNo);
		return "event/boardList.jsp";
	}

	// SOAP 방식 처리 (url에 ?가 있는 경우, 즉 쿼리스트링을 사용한 경우)
	@RequestMapping("/boardList")
	public String boardList2(
			@RequestParam(value="pageNo",defaultValue="1")String pageNo,
			@RequestParam(value="column",required=false)String column,
			@RequestParam(value="searchKey",required=false)String searchKey,
			Model model){
		logger.info("EventController-boardList");
		logger.info("넘어온 페이지번호 : {}", pageNo);
		logger.info("넘어온 컬럼 : {}", column);
		logger.info("넘어온 검색어 : {}", searchKey);
		logger.info("EventController-boardList");
		/*Command command = CommandFactory.list(pageNo);*/
		model.addAttribute("memberList",service.getList(CommandFactory.list(pageNo))); /*타일즈의 .jsp로 들어가게됨*/
		model.addAttribute("count", service.count());
		model.addAttribute("pageNo",pageNo);
		return "event/boardList.jsp";
	}
	
	
	
	@RequestMapping("memberSearch/{pageNo}")
	public String memberSearch(
			@PathVariable("pageNo")String pageNo,
			@RequestParam("column")String column,
			@RequestParam("keyword")String keyword,
			Model model
			){
		logger.info("EventController article()");
		logger.info("넘어온 페이지번호 : {}", pageNo);
		logger.info("넘어온 컬럼 : {}", column);
		logger.info("넘어온 검색어 : {}", keyword);
		Command command = CommandFactory.search(column, keyword, pageNo);
		List<MemberVO> list = service.searchByKeyword(command);
		int count = service.countByKeyword(command);
		logger.info("리스트 결과 사이즈: {}", list.size());
		model.addAttribute("memberList", list);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("count", count);
		return "event/boardSearch.tiles";
				
	}
}
