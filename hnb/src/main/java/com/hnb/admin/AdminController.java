package com.hnb.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hnb.member.MemberService;
import com.hnb.member.MemberVO;
import com.hnb.movie.MovieVO;


@Controller
@RequestMapping("/admin")

public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	MemberService service;
	@Autowired
	MemberVO member;
	@Autowired
	MovieVO movie;
	@RequestMapping("/Admin")
	public String home() {
		logger.info("AdminController-home() 진입");
		return "admin/Admin";
	}
	
	@RequestMapping("/movie_list")
	public String movieList(){
		logger.info("AdminController-movieList() 진입");
		return "admin/movie_list";
	}
	
	@RequestMapping("/member_list")
	public String memberList(){
		logger.info("AdminController-memberList() 진입");
		return "admin/member_list";
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





