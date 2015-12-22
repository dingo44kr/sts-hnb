<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/magnific-popup.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/jquery.magnific-popup.min.js"></script>

<style>
.white-popup {
  position: relative;
  background: #FFF;
  padding: 20px;
  width: auto;
  max-width: 500px;
  margin: 20px auto;
}
</style>
<div id="test-popup" class="white-popup mfp-hide">
  <TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR BGCOLOR=#A0A0A0>
		<TD ALIGN=CENTER><FONT SIZE=4><B>게시판 ( 게시글 입력 )</B></FONT></TD>
	</TR>
</TABLE>

<FORM NAME="BoardWrite" METHOD=POST ACTION="BoardWriteProc.jsp">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>

	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>제목</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="subject" SIZE=70>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="content" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	
		
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			<IMG id="go_list" SRC="${img}/btn_list.gif" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<IMG id="save" SRC="${img}/btn_save.gif" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="${img}/btn_cancel.gif" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>
</div>
<a href="#test-popup" class="open-popup-link">Show inline popup</a>
<a href="mobile-friendly-page.html" data-mfp-src="#test-popup" class="open-popup-link">
	Show inline popup
</a>
<script type='text/javascript'>
	$(function() {
		board.init('142','1');
		$('.open-popup-link').magnificPopup({
			type:'inline',
			midClick: true
		});
	});
	
	var board = {
		init : function(themeNo,pageNo) {
			$.getJSON(context+'/article/list/'+themeNo+'/'+pageNo,function(data) {
			
				var table = "<div id='boardList'><h1 align=center style='color:white;margin-bottom:30px'>자유게시판</h1>"
				+"<TABLE id='tab_borderList'>"
				+"<TR ALIGN=CENTER><TD WIDTH=8%><B>번호</B></TD>"
				+"<TD WIDTH=30%><B>제 목</B></TD>"
				+"<TD WIDTH=60%><B>내 용</B></TD>"
				+"</TR>";
				
				table += "</TABLE></div>";
				table +='<div style="width:100px;margin:auto"><a href="'+context+'/article/write">글쓰기</a><div>';
				$('.mainView').html(table);
			});	
		}
	
	};
</script>
 <!-- 
전체레코드 수 - ((현재 페이지번호-1) * 한 페이지당 레코트 수 + 현재게시물 출력순서)
count - ((nowPage-1)*rowPerPage+status.index)
 -->