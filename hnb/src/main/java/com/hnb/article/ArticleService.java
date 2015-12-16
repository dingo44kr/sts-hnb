package com.hnb.article;

import java.util.List;

import com.hnb.global.Command;
import com.hnb.article.ArticleVO;

public interface ArticleService {
				// C : 추가(글작성)
				public int write(ArticleVO article);
				
				// R : 조회
				public List<ArticleVO> getList(Command command); //전체회원목록
				public List<ArticleVO> searchByKeyword(Command command); //임의의 값으로 검색
				public ArticleVO searchById(int rcdNo); //아이디로 조회
				public int count(); //전체글수 조회
				public int countByKeyword(Command command); //검색 결과의 갯수만 조회
				// U : 개인정보 변경
				public int change(ArticleVO article);
				// D : 삭제 (회원탈퇴)
				public int remove(int rcdNo);
}
