<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="${js}/global.js"></script>

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
			<INPUT id="subject" TYPE=TEXT NAME="subject" SIZE=70>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
		<TD WIDTH=500>
			<TEXTAREA id="content" NAME="content" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	
</TABLE>

</FORM>

<TABLE WIDTH=620 HEIGHT=50 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>

	<TR ALIGN=CENTER>
		<TD WIDTH=110 ALIGN=LEFT>
			<IMG id = "go_list" SRC="${img}/btn_list.gif" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=400 ALIGN=CENTER>		
			<IMG id ="save" SRC="${img}/btn_save.gif" STYLE=CURSOR:HAND>&nbsp;&nbsp;
			<IMG SRC="${img}/btn_cancel.gif" STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=110 ALIGN=LEFT>&nbsp;</TD>   
	</TR>
	
</TABLE>


<script>
$(function() {
	var $goList = $('#go_list');
	Global.move($goList, context+'/article/list');
	
	$('#save').click(function() {
		write.save();
	});
});

var write = {
	save : function() {
		var article {
			"usrSubject" : $('#subject').val(),
			"usrContent" : $('#content').val()
		};
		$.ajax(context +"/article/save",{
			data : JSON.stringify(article),
            dataType : "json",
            type : 'post',
            contentType : "application/json;",
            mimeType: "application/json;",
            async : false,

		});
		
		
	}
		
}



</script>