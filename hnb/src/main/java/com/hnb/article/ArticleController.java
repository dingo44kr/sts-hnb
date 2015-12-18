package com.hnb.article;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnb.event.EventController;
import com.hnb.global.Command;
import com.hnb.global.CommandFactory;

@Controller
@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	@Autowired ArticleVO article;
	@Autowired ArticleServiceImpl articleService;
	
	//겟방식이라고 생각하면됨 (주소값이 다 들어옴)
	@RequestMapping("/list/{themeNo}/{pageNo}")
	public @ResponseBody List<ArticleVO> getList(
			@PathVariable("themeNo")String themeNo,
			@PathVariable("pageNo")String pageNo,
			Model model){
		logger.info("ArticleController-article()");
		logger.info("넘어온 페이지번호 : {}", pageNo);
		logger.info("넘어온 게시판 테마번호 : {}", themeNo);
		List<ArticleVO> list = articleService.getList(CommandFactory.boardList(pageNo, themeNo));
		logger.info("검색한 게시판 글 수 : {}", list.size());
		return list;
	}
//	List<ArticleVO> list = articleService.getList(CommandFactory.list(pageNo)); 

	@RequestMapping("/list")
	public String goList(){
		logger.info("ArticleController-goList 진입");
		return "article/list.tiles";
	}
	
	@RequestMapping("/write")
	public String write(){
		logger.info("ArticleController-write()");
		return "article/write.jsp";
	}
	
	/*글 저장하기*/
	@RequestMapping("/save")
	public String save(
			@RequestBody ArticleVO article){
		logger.info("ArticleController-save()");
		return "article/write.jsp";
	}
}
