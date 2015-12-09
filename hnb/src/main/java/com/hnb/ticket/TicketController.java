package com.hnb.ticket;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hnb.member.MemberController;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	@Autowired
	TicketServiceImpl ticketService;
	@Autowired
	TicketVO ticketVO;
	
	@RequestMapping("/Ticket")
	public String ticket(
			){
		logger.info("TicketController-ticket() 진입");
		return "ticket/Ticket";
	}
	
	@RequestMapping("/movieSelect")
	public Model movieSelect(String movie, String theater, String date, Model model
			){
		logger.info("TicketController-movieSelect() 진입");
		List theaterList = new ArrayList();
		List dateList = new ArrayList();
		List timeList = new ArrayList();
		if (theater==null && date!=null) {
			logger.info("극장null");
			theaterList =ticketService.getTheaterListByMD(movie, date);
		} else if(theater !=null && date==null){
			logger.info("날짜 null");
			
			dateList = ticketService.getShowDateListByMT(movie, theater);
		} else if(movie!=null&&theater!=null&&date!=null){
			timeList = ticketService.getTimeList(movie, theater, date);
		}
		List movieSelectList = new ArrayList();
		logger.info("극장"+theaterList);
		logger.info("극장"+dateList);
		movieSelectList.add(theaterList);
		movieSelectList.add(dateList);
		movieSelectList.add(timeList);
		model.addAttribute("movieCheckedList", movieSelectList);
		return model;
	}
	
	
	
	@RequestMapping("/theaterSelect")
	public Model ticket( String movie, String theater, String date, Model model
			){
		logger.info("TicketController-theaterSelect() 진입");
		List movieListRate = new ArrayList();
		List movieListAsc = new ArrayList();
		List dateList = new ArrayList();
		List timeList = new ArrayList();
		List seatList = new ArrayList();
		if (movie==null && date != null) {
			movieListRate = ticketService.getMovieRateByTD(theater,date);
			movieListAsc = ticketService.getMovieAscByTD(theater,date);
		} else if(movie!=null && date==null){
			dateList = ticketService.getShowDateListByMT(movie, theater);
		} else if (movie==null && date==null) {
			movieListRate = ticketService.getMovieRateByT(theater);
			movieListAsc = ticketService.getMovieAscByT(theater);
			dateList = ticketService.getShowDateListByT(theater);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = ticketService.getTimeList(movie, theater, date);
		}
		List theaterSelectList = new ArrayList();
		theaterSelectList.add(movieListRate);
		theaterSelectList.add(movieListAsc);
		theaterSelectList.add(dateList);
		theaterSelectList.add(timeList);
		
		model.addAttribute("theaterCheckedList", theaterSelectList);
		return model;
	}
	
	
	

	
}
