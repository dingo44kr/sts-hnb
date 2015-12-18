package com.hnb.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hnb.article.ArticleVO;
import com.hnb.global.Command;

@Repository
public interface ArticleMapper {
	// C : 추가(글작성)
	public int write(ArticleVO article);
	
	// R : 조회
	public List<ArticleVO> getList(Command command); //전체조회(게시판 별)
	public List<ArticleVO> desc_list(Command command); //전체 글 목록 RcdNo-내림차순으로 조회하기 
	public List<ArticleVO> searchByKeyword(Command command); //임의의 값으로 검색
	public ArticleVO searchById(int rcdNo); //글번호로 조회
	public int count(); //전체글수 조회
	public int countByKeyword(Command command); //검색 결과의 갯수만 조회
	public String searchPass(int rcdNo);
	
	// U : 변경 or 수정
	public int change(ArticleVO article);
	public int Refer_Inc(int rcdNo); // usrRefer의 값 증가 쿼리문.
	public int rcd_Change(ArticleVO articleVO);
	
	// D : 삭제
	public int remove(int rcdNo); //레코드 삭제


}
