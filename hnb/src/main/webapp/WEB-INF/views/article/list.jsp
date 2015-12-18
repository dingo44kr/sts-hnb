<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<LINK REL="stylesheet" type="text/css" href="${css}/board.css"/>

<script type="text/javascript">
$(function() {
	board.init('142','1');
	
})

var board = {
		init : function(themeNo, pageNo) {
			$.getJSON(context +"/article/list/"+themeNo+'/'+pageNo, function(data) {
				var table = "<div id='boardList'><h1 align=center style='color:white;margin-bottom:30px'>자유게시판</h1>"
				+"<TABLE id='tab_boardList'>"
				+"<TR ALIGN=CENTER><TD WIDTH=8%><B>번호</B></TD>"
				+"<TD WIDTH=30%><B>제 목</B></TD>"
				+"<TD WIDTH=60%><B>내 용</B></TD>"
				$.each(data,function(index, value){
				table+="<TR><TD WIDTH=8% ALIGN=CENTER>"+(index+1)+"</TD>"
				+"<TD WIDTH=30% ALIGN=CENTER>"+value.usrSubject+"</TD>"
				+"<TD WIDTH=60% ALIGN=CENTER>"+value.usrContent+"</TD>"
				});
				
				table+="</TABLE></div>";
				table+="<div style='width:100px;margin:auto'><a href='"+context+"/article/write'>글쓰기</a></div>";
				$('.mainView').html(table);
		});
	},
	
};	
 </script>
 <!-- 
전체레코드 수 - ((현재 페이지번호-1) * 한 페이지당 레코트 수 + 현재게시물 출력순서)
count - ((nowPage-1)*rowPerPage+status.index)
 -->