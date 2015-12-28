package com.hnb.member;

import org.apache.catalina.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.hnb.global.Constants;
import com.hnb.global.FileUpload;

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
		return "redirect:/"; /* jsp 를 타지 않고 그대로 MainController로 가게 됨, 풀경로로 다 주어야 함.*/
	}

	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody MemberVO login(@RequestBody MemberVO param, Model model){
		logger.info("MemberController-login() 진입");
		logger.info("유저 아이디{}", param.getId());
		logger.info("유저 비밀번호{}", param.getPassword());
		member = service.login(param.getId(), param.getPassword());
		model.addAttribute("user",member);
		String u = member.getId();
		logger.info("로그인과정에서 체크하는 아이디:{}",u);
		// 로그인 실패시0
		if (member.getId().equals(param.getId())) {
			logger.info("로그인성공");
		} else {
			logger.info("로그인실패");
		}
		return member;
	}
	
	@RequestMapping(value="/login_mobile")
	public Model loginForMobile(Model model, 
			@RequestParam("id") String id,
			String password
			){
		logger.info("MemberController-loginForMobile() 진입");
		logger.info("유저 아이디{}", id);
		logger.info("유저 비밀번호{}", password);
		member = service.login(id, password);
		model.addAttribute("user",member);
		String u = member.getId();
		logger.info("로그인과정에서 사용자에게로부터 받아오는 아이디:{}",u);
		// 로그인 실패시0
		if (member.getId().equals(id)) {
			logger.info("로그인성공");
			model.addAttribute("result","success");
		} else {
			logger.info("로그인실패");
			model.addAttribute("result","fail");
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
	public String mypage(
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
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody MemberVO update(
			@RequestParam(required=false, value="file")MultipartFile multipartFile,
			@RequestParam("password")String password,
			@RequestParam("addr")String addr,
			@RequestParam("email")String email,
			@RequestParam("phone")String phone,			
			@RequestParam("id")String id){
		logger.info("MemberController-update() 진입");
		String path = Constants.imageDomain+"resources\\images\\";
		FileUpload fileUpload = new FileUpload();
		String fileName = multipartFile.getOriginalFilename();
		String fullPath = fileUpload.uploadFile(multipartFile, path, fileName);
		logger.info("파일업로드 경로:{}", fullPath);
		member.setPassword(password);
		member.setAddr(addr);
		member.setEmail(email);
		member.setPhone(phone);
		member.setProfile(fileName);
		int result = service.change(member);
		if(result ==1){
			logger.info("업데이트 성공");
		}
		else{
			logger.info("업데이트 실패");
		}
		return member;
	}
	
	
	
	
}
