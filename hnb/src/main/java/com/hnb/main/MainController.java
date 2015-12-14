package com.hnb.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	// value에는 url을 입력하여, jsp에서 할당한 주소와 동일한 주소를 준 이곳으로 들어올 수 있도록 하는 역할을 함.
	public String home() { //여기서 모델은 response, request의 역할을 모두 포함한다.
		System.out.println();
		return "global/default.tiles"; //어느 경로로 갈것인지를 결정함 
	}
	
	
}
