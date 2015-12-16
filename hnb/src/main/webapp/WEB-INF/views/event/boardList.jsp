<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<LINK REL="stylesheet" type="text/css" href="${css}/board.css"/>


 
 <script>
 $(function() {
	alert('보더리스트.jsp 진입!');
	boardList.load();
	/* boardList.tab(); */
});
 
 var boardList = {
		/*  tab : function() {
			var board = '<div id = "boardList"><h1 align=center style="color:white; margin-bottom: 50px;">회원목록</h1><TABLE id = "tab_boardList"><tr><td colspan="5"style="text-align: right; border: none;">총회원수:${count}</td></tr><TR ALIGN=CENTER><TD WIDTH=10%><B>번호</B></TD><TD WIDTH=20%><B>아이디</B></TD><TD WIDTH=20%><B>회원명</B></TD><TD WIDTH=30%><B>이메일</B></TD><TD WIDTH=18%><B>가입일</B></TD></TR><c:forEach var="member"items="${memberList}"varStatus="status"><TR><TD WIDTH=10%ALIGN=CENTER>${status.index+1}</TD><TD WIDTH=20%ALIGN=CENTER>${member.id}</TD><TD WIDTH=20%ALIGN=CENTER><A HREF="BoardContent.jsp">${member.name}</A></TD><TD WIDTH=30%ALIGN=LEFT>${member.email}</TD><TD width=18%align=Center>${member.regdate}</TD></TR></c:forEach></TABLE></div>'
			$('.mainView').html(board);
		}, */
		
		load : function() {
			$.getJSON(function(data){
				var table = '<div id = "boardList"><h1 align=center style="color:white; margin-bottom: 50px;">회원목록</h1><TABLE id = "tab_boardList"><tr><td colspan="5"style="text-align: right; border: none;">총회원수:${count}</td></tr><TR ALIGN=CENTER><TD WIDTH=10%><B>번호</B></TD><TD WIDTH=20%><B>아이디</B></TD><TD WIDTH=20%><B>회원명</B></TD><TD WIDTH=30%><B>이메일</B></TD><TD WIDTH=18%><B>가입일</B></TD></TR><c:forEach var="member"items="${memberList}"varStatus="status"><TR><TD WIDTH=10%ALIGN=CENTER>${status.index+1}</TD><TD WIDTH=20%ALIGN=CENTER>${member.id}</TD><TD WIDTH=20%ALIGN=CENTER><A HREF="BoardContent.jsp">${member.name}</A></TD><TD WIDTH=30%ALIGN=LEFT>${member.email}</TD><TD width=18%align=Center>${member.regdate}</TD></TR></c:forEach></TABLE></div>'
				$('.mainView').empty();
				$('.mainView').html(table);
			});
		}
 		
 }
 
 
 </script>
 
 <!-- 
전체레코드 수 - ((현재 페이지번호-1) * 한 페이지당 레코트 수 + 현재게시물 출력순서)
count - ((nowPage-1)*rowPerPage+status.index)
 -->