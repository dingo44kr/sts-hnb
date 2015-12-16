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
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnb.article.ArticleServiceImpl;
import com.hnb.article.ArticleVO;
import com.hnb.global.Command;
import com.hnb.global.CommandFactory;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;

@Controller
@RequestMapping("/event")
public class EventController {
	@Autowired MemberServiceImpl service;
	@Autowired ArticleVO article;
	@Autowired ArticleServiceImpl articleService;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@RequestMapping("/boardList/{pageNo}")
	public @ResponseBody List<ArticleVO> boardList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		logger.info("EventController-article()");
		logger.info("넘어온 페이지번호 : {}", pageNo);
		List<ArticleVO> list = articleService.getList(CommandFactory.list(pageNo)); 
		
		/*Command command = CommandFactory.list(pageNo);*/
		/*model.addAttribute("memberList",service.getList(CommandFactory.list(pageNo))); 타일즈의 .jsp로 들어가게됨
		model.addAttribute("count", service.count());
		model.addAttribute("pageNo",pageNo);*/
		return list;
	}

	@RequestMapping("/boardList")
	public String goList(){
		logger.info("EventController-goList 진입");
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
