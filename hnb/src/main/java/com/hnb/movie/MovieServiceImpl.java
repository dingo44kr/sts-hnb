package com.hnb.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnb.mapper.MovieMapper;

@Service
public class MovieServiceImpl implements MovieSerive {
	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	
	@Override	//영화등록
	public int register(MovieVO o) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.insert(o);
	}
	@Override	//영화수정
	public int change(MovieVO o) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.update(o);
	}
	@Override	//영화삭제
	public int remove(String filmNumber) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.delete(filmNumber);
	}
	@Override	//영화번호로 검색
	public MovieVO searchByName(String filmNumber) {
		logger.info("영화번호으로 검색하는 서비스 안으로 들어옴");
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		logger.info("필름번호으로 검색된 객체는{}",mapper.selectNameBy(filmNumber));
		return mapper.selectNameBy(filmNumber);
	}
	@Override	//영화전체목록
	public List<MovieVO> getList() {
		logger.info("MovieServiceImpl : getList()");
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.selectAll();
	}
	@Override
	public List<MovieVO> getFilmNum() {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.selectChart();
	}
	
}
