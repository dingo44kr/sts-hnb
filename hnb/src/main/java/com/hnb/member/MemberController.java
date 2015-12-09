package com.hnb.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberServiceImpl service;
	@Autowired
	MemberVO member;
	
	@RequestMapping("/admin_home")
	public String adminHome(
			){
		logger.info("MemberController-adminHome() 진입");
		return "admin/Admin";
	}
	
	@RequestMapping("/provision")
	public String provision(
			){
		logger.info("MemberController-provision() 진입");
		return "member/provision";
	}
	

	@RequestMapping("/join_member")
	public Model joinMember(
			@ModelAttribute("member")MemberVO member,
			Model model
			){
		logger.info("MemberController-join_member() 진입");
		logger.info("가입 id{}",member.getId());
		logger.info("가입 password{}",member.getPassword());
		logger.info("가입 name{}",member.getName());
		logger.info("가입 birth{}",member.getBirth());
		logger.info("가입 addr{}",member.getAddr());
		logger.info("가입 gender{}",member.getGender());
		logger.info("가입 email{}",member.getEmail());
		logger.info("가입 phone{}",member.getPhone());
		
		int result = service.join(member);
		if (result==1) {
			logger.info("회원가입 성공");
			model.addAttribute("result", "success");
			model.addAttribute("name", member.getName());
		} else {
			logger.info("회원가입 실패");
			model.addAttribute("result", "fail");
		}
		return model;
	}

	
	@RequestMapping("/join_Result")
	public String joinResult(
			){
		logger.info("MemberController-join_Result() 진입");
		return "member/join_Result";
	}

	@RequestMapping("/logout")
	public Model logout(Model model
			){
		logger.info("MemberController-logout() 진입");
		model.addAttribute("result", "success");
		return model;
	}

	@RequestMapping("/login")
	public Model login(
			String id, String password, Model model
			){
		logger.info("MemberController-login() 진입");
		
		logger.info("유저 아이디{}", id);
		logger.info("유저 비밀번호{}", password);
		member = service.login(id, password);
		// 로그인 실패시0
		if (member == null) {
			model.addAttribute("result", "fail");
		} else {
		// 로그인 성공시
			model.addAttribute("result","success");
			model.addAttribute("id", id);
			model.addAttribute("pw", password);
			if (id.equals("choa")) {
            	model.addAttribute("admin","yes");
			} else {
				model.addAttribute("admin","no");
			}
		}
		return model;
	}
	
	@RequestMapping("/check_Overlap")
	public Model checkOverlap(Model model, String id
			){
		logger.info("MemberController-checkOverlap() 진입");
		if (service.selectById(id).getId()==null) {
			model.addAttribute("result","usable");
			model.addAttribute("id",id);
		} else {
			model.addAttribute("result","unusable");
			model.addAttribute("id",id);
		}
		return model;
	}
	
	@RequestMapping("/mypage")
	public String checkOverlap(
			){
		logger.info("MemberController-mypage() 진입");
		return "member/mypage";
	}
	
	
	
}
