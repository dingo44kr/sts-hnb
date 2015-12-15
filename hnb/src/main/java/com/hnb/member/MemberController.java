package com.hnb.member;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sun.org.apache.xerces.internal.util.Status;


@Controller
@SessionAttributes("user")
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
	public String logout(Model model, SessionStatus status){
		logger.info("MemberController-logout() 진입");
		status.setComplete(); //세션스코프의 값을 모두 비워주는 역할. (세션 초기화)
		return "global/default.tiles";
	}

	@RequestMapping("/login")
	public @ResponseBody MemberVO login(String id, 
			@RequestParam("pw")String password,
			Model model
			){
		logger.info("MemberController-login() 진입");
		logger.info("유저 아이디{}", id);
		logger.info("유저 비밀번호{}", password);
		member = service.login(id, password);
		model.addAttribute("user",member);
		// 로그인 실패시0
		if (member.getId().equals(id)) {
			logger.info("로그인성공");
		} else {
			logger.info("로그인실패");
		}
		// 로그인 성공시 (choa 관리자)
			logger.info("컨트롤러 로그인 성공!!");
			if (id.equals("choa")) {
            	model.addAttribute("admin","yes");
			} else {
				model.addAttribute("admin","no");
			}
		return member;
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
		return "member/mypage.tiles";
	}
	
	@RequestMapping("/detail/{id}")
	public @ResponseBody MemberVO detail(
			@PathVariable("id")String id){
		logger.info("멤버컨트롤러 detail() - 진입");
		member = service.selectById(id);
		return member;
	}
	
	
	
}
