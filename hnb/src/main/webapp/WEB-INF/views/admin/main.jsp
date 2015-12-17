<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
$(function() {
	$.getJSON(context+'/admin/member_List/1',function(data) {
		var table = "<div id='boardList'><h1 align=center style='color:white;margin-bottom:30px'>회원목록</h1>"
		+"<TABLE id='tab_boardList'>"
		+"<TR ALIGN=CENTER><TD WIDTH=10%><B>번호</B></TD>"
		+"<TD WIDTH=20%><B>아이디</B></TD>"
		+"<TD WIDTH=20%><B>회원명</B></TD>"
		+"<TD WIDTH=30%><B>이메일</B></TD>"
		+"<TD WIDTH=18%><B>가입일</B></TD></TR>";
		var count = data.count;
		var pageNo = data.pageNo;
		$.each(data.list,function(index,value){
			table+="<TR><TD WIDTH=10% ALIGN=CENTER>"+(index+1)+"</TD>"
			+"<TD WIDTH=20% ALIGN=CENTER>"+value.id+"</TD>"
			+"<TD WIDTH=20% ALIGN=CENTER><A HREF='BoardContent.jsp'>"+value.name+"</A></TD>"
			+"<TD WIDTH=30% ALIGN=LEFT>"+this.email+"</TD>"
			+"<TD WIDTH=18% ALIGN=CENTER>"+this.regdate+"</TD></TR>"
		});
		table+="</TABLE></div>";
		
		var pagination = '<TABLE id="pagination">'
		+'<TR>'
		+'<TD ALIGN=LEFT WIDTH=100>'
		+'<IMG SRC="${img}/btn_new.gif" onClick="" STYLE=CURSOR:HAND></TD>'
		+'<TD WIDTH=320 ALIGN=CENTER>'
		+'<c:if test="${startPage ne 1}">'
		+'<a href="${context}/event/boardList/1">'
		+'<IMG SRC="${img}/btn_bf_block.gif"></a></c:if>'
		+'<c:if test="${startPage - GROUPSIZE gt 0}">'
		+'<a href="${context}/event/boardList/${startPage-GROUPSIZE}">'
		+'<IMG SRC="${img}/btn_bf_page.gif"></a></c:if>'
		+'<c:if test="${startPage + GROUPSIZE le totPage}">'
		+'<a href="${context}/event/boardList/${startPage+GROUPSIZE}">'
		+'<IMG SRC="${img}/btn_nxt_page.gif"></a></c:if></TD>'
		+'<TD WIDTH=200 ALIGN=RIGHT>'
		+'<FORM NAME="memberSearch" action="${context}/event/memberSearch/1">'
		+'<SELECT NAME="column" SIZE=1>'
		+'<OPTION VALUE="" SELECTED>선택</OPTION>'
		+'<OPTION VALUE="id">ID</OPTION>'
		+'<OPTION VALUE="name">이름</OPTION>'
		+'<OPTION VALUE="gender">성별</OPTION></SELECT>'
		+'<INPUT TYPE=TEXT NAME="keyword" SIZE=10 MAXLENGTH=20>'
		+'<input type="submit" value="검색" />'
		+'</FORM>'
		+'</TD>'
		+'</TR></TABLE>';
		table += pagination;
		$('.mainView').html(table);
	});
});
 $('#btn_admin_table').click(function() {
    $('#btn_admin_table').submit();
  });
 var Admin = {
		 memberList : function(url) {
		$.getJSON(url,function(data) {
			var table = "<div id='boardList'><h1 align=center style='color:white;margin-bottom:30px'>회원목록</h1>"
			+"<TABLE id='tab_borderList'>"
			+"<TR ALIGN=CENTER><TD WIDTH=10%><B>번호</B></TD>"
			+"<TD WIDTH=20%><B>아이디</B></TD>"
			+"<TD WIDTH=20%><B>회원명</B></TD>"
			+"<TD WIDTH=30%><B>이메일</B></TD>"
			+"<TD WIDTH=18%><B>가입일</B></TD></TR>"
			/* "<c:forEach var='member' items='${memberList}' varStatus='status'><TR>"
			+"<TD WIDTH=10% ALIGN=CENTER>${status.index+1}</TD>"
			+"<TD WIDTH=20% ALIGN=CENTER>${member.id}</TD>"
			+"<TD WIDTH=20% ALIGN=CENTER><A HREF='BoardContent.jsp'>${member.name}</A></TD>"
			+"<TD WIDTH=30% ALIGN=LEFT>${member.email}</TD>"
			+"<TD WIDTH=18% ALIGN=CENTER>${member.regdate}</TD></TR></c:forEach>" */
			+"</TABLE></div>";
			$('.mainView').empty();
			$('.mainView').html(table);
		});
	},
	memberNotExist : function() {
		var table ='<h1>회원목록</h1><table id="tab_member"><tr><th>아이디</th>';
			table += '<th>이름</th><th>성별</th><th>생년원일</th><th>전화번호</th><th>이메일</th></tr>';
			table += '<tr><td colspan="6"><h2>회원목록이 없습니다.</h2></td></tr></table>';
			$(table).appendTo($('#main_right').empty());
	}
 };
 
</script>