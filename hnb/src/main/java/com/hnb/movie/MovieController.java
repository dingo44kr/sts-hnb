package com.hnb.movie;

import java.util.ArrayList;
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


@Controller
@RequestMapping("/movie")
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	@Autowired
	MovieServiceImpl service;
	@Autowired
	MovieVO movie;
	
	@RequestMapping("/Movie")
	public String movie() {
		logger.info("MovieController-home() 진입");
		return "movie/Movie.tiles";
	}
	
	@RequestMapping("/movie_info")
	public Model movieInfo(Model model) {
		logger.info("MovieController-movieInfo() 진입");
		List<MovieVO> list = service.getList();
		model.addAttribute("movieList", list);
		logger.info("영화리스트 조회결과{}", list);
		return model;
	}
	
	@RequestMapping("/movie_name/{movieName}")
	public @ResponseBody MovieVO movieName(
			@PathVariable("movieName")String filmNumber
			) {
		logger.info("MovieController-movieName() 진입");
		logger.info("영화 아이디{}",filmNumber);
		movie = service.searchByName(filmNumber);
		logger.info("영화제목 : {}",movie.getFilmName());
		return movie;
	}
	@RequestMapping("/movie_Cut")
	public Model movieCut(
			String filmNumber, Model model /*@RequestParam("filmNumber")String fileNumber 중 @RequestParam("filmNumber") 생략.*/
			/*에버노트의 "요청 핸들러 매개변수 타입"의 표, @RequestParam 부분 참고.*/
			/*String filmNumber = request.getParameter("filmNumber"); 와 같은 구문, 앞의 @RequestParam("filmNumber")은 생략됨 */
			) {
		logger.info("MovieController-movieCut() 진입");
		logger.info("movieCut()의 filmNumber{}",filmNumber);
		movie = service.searchByName(filmNumber);
		String cut = movie.getCut();
		logger.info("가져온 movie.getCut(){}", cut);
		String[] arr = cut.split("/");
		logger.info("결과 cut.split{}", arr);
		model.addAttribute("jsonString", arr);
		return model;
	}
	@RequestMapping("/movie_Tra")
	public Model movieTra(
			String filmNumber, Model model
			) {
		logger.info("MovieController-movieTra() 진입");
		logger.info("movieTra의 filmNumber{}", filmNumber);
		movie = service.searchByName(filmNumber);
		String tra = movie.getTrailer();
		logger.info("가져온 movie.getTrailer() {}", tra);
		String[] arrt = tra.split("/");
		logger.info("트레일러 목록인 tra.split(){}", arrt);
		model.addAttribute("jsonString", arrt);
		return model;
	}
	
	@RequestMapping("/movie_Basic")
	public @ResponseBody MovieVO movieBasic(
			String filmNumber
			) {
		logger.info("MovieController-movieBasic() 진입");
		logger.info("MovieCut의 filmNumber: {}",filmNumber);
		movie = service.searchByName(filmNumber);
		logger.info("MovieBasic컷의 영화제목: {}",movie.getFilmName());
		return movie;
	}
	@RequestMapping("/movie_Chart")
	public String movieChart() {
		logger.info("MovieController-movie_Chart() 진입");
		return "movie/movie_Chart";
	}
}
