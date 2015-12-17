<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<LINK REL="stylesheet" type="text/css" href="${css}/board.css"/>

<script type="text/javascript">
$(function() {
	board.article(context + "/event/boardList/1");
	
})

var board = {
		article : function(url) {
			$.getJSON(url, function(data) {
				var table = "<div id='boardList'><h1 align=center style='color:white;margin-bottom:30px'>자유게시판</h1>"
				+"<TABLE id='tab_boardList'>"
				+"<TR ALIGN=CENTER><TD WIDTH=10%><B>번호</B></TD>"
				+"<TD WIDTH=40%><B>제목</B></TD>"
				+"<TD WIDTH=20%><B>작성자</B></TD>"
				+"<TD WIDTH=20%><B>작성일</B></TD>"
				+"<TD WIDTH=8%><B>참조</B></TD></TR>"
				+"</TABLE></div>";
				$('.mainView').html(table);
		});
	}
};	
 </script>
 <!-- 
전체레코드 수 - ((현재 페이지번호-1) * 한 페이지당 레코트 수 + 현재게시물 출력순서)
count - ((nowPage-1)*rowPerPage+status.index)
 -->