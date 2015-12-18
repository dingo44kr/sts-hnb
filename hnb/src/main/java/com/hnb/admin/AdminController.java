package com.hnb.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnb.article.ArticleServiceImpl;
import com.hnb.article.ArticleVO;
import com.hnb.event.EventController;
import com.hnb.global.CommandFactory;
import com.hnb.member.MemberService;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;
import com.hnb.movie.MovieServiceImpl;
import com.hnb.movie.MovieVO;


@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired MemberServiceImpl memberService;
	@Autowired MemberVO member;
	@Autowired MovieVO movie;
	@Autowired MovieServiceImpl movieService;
	
	@RequestMapping("/main")
	public String home() {
		logger.info("AdminController-home() 진입");
		return "admin/admin/main.tiles";
	}
	
	@RequestMapping("/movie_list")
	public String movieList(){
		logger.info("AdminController-movieList() 진입");
		return "admin/movie_list";
	}
	
	
	
	
	@RequestMapping("/member_List/{pageNo}")
	public @ResponseBody Map<String,Object> memberList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		logger.info("AdminController-memberList()");
		logger.info("넘어온 페이지번호 : {}", pageNo);
		int pageSize = 5, groupSize = 3, count = memberService.count(),
		totPage = 0, pageNum = Integer.parseInt(pageNo), lastPage=0, startPage=0;
		
		totPage = (((count%pageSize)==0) ? count/pageSize : (count/pageSize)+1 );
		startPage = pageNum-((pageNum-1)%groupSize);
		lastPage = (((startPage+groupSize)-1 <= totPage) ? (startPage+groupSize)-1 : totPage);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", memberService.getList(CommandFactory.list(pageNo)));
		map.put("count", memberService.count());
		map.put("pageNo", pageNo);
		map.put("startPage", startPage);
		map.put("groupSize", groupSize);
		map.put("lastPage", lastPage);
		map.put("totPage", totPage);
		return map;
	}
	
	@RequestMapping("/member_profile")
	public String memberProfile(){
		logger.info("AdminController-memberProfile() 진입");
		return "admin/member_profile";
	}
	
	@RequestMapping("/movie_profile")
	public String movieProfile(){
		logger.info("AdminController-movieProfile() 진입");
		return "admin/movie_profile";
	}
	
	@RequestMapping("/insert")
	public String Insert(){
		logger.info("AdminController-Insert() 진입");
		return "admin/insert";
	}
	
	@RequestMapping("/insert2")
	public String Insert2(){
		logger.info("AdminController-Insert2() 진입");
		return "admin/insert2";
	}
	
	@RequestMapping("/delete")
	public String Delete(){
		logger.info("AdminController-Delete() 진입");
		return "admin/delete";
	}
	
}





