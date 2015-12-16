<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<LINK REL="stylesheet" type="text/css" href="${css}/board.css"/>
<c:set var="PAGESIZE" value="5"/>
<c:set var="GROUPSIZE" value="2"/>

<c:choose>
	<c:when test="${count%PAGESIZE eq 0}"> <!-- count를 pagesize로 나눈 나머지가 =(eq) 0 이라면 -->
		<c:set var="totPage" value="${count/PAGESIZE}"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="totPage" value="${count/PAGESIZE+1}"></c:set>
	</c:otherwise>
</c:choose>

<c:set var="startPage" value = "${pageNo - ((pageNo-1)%GROUPSIZE) }"></c:set>
<c:choose>
	<c:when test="${startPage+GROUPSIZE-1 le totPage}"> <!-- le는 (=<) 작거나 같다를 말함 -->
		<c:set var="lastPage" value="${startPage+GROUPSIZE-1}"></c:set>
	</c:when>
	
	<c:otherwise>
		<c:set var="lastPage" value="${totPage}"></c:set>
	</c:otherwise>
	
</c:choose>
<div id = "boardList">	


<h1 align=center style="color:white; margin-bottom: 50px;">회원목록</h1>

	

<TABLE id = "tab_boardList">
	<tr>
		<td colspan="5" style="text-align: right; border: none;">총회원수 : ${count}</td> <%-- ${fn:length(memberList)} 이벤트 컨트롤러에서 담아준 memberList 객체의 갯수를 반환한다.(총회원수로직 대신에 사용가능)--%>
	</tr>
	
	<TR ALIGN=CENTER>
		<TD WIDTH=10%><B>번호</B></TD>
		<TD WIDTH=20%><B>아이디</B></TD>
		<TD WIDTH=20%><B>회원명</B></TD>
		<TD WIDTH=30%><B>이메일</B></TD>
		<TD WIDTH=18%><B>가입일</B></TD>
	</TR>
	
	<c:forEach var="member" items="${memberList}" varStatus="status"> <%-- items = ${memberList} memberList는 모델에서의 id값을 말한다. --%>
	<TR>
		<TD WIDTH=10% ALIGN=CENTER>${status.index+1}</TD>
		<TD WIDTH=20% ALIGN=CENTER>${member.id}</TD>
		<TD WIDTH=20% ALIGN=CENTER><A HREF="BoardContent.jsp">${member.name}</A></TD>
		<TD WIDTH=30% ALIGN=LEFT>${member.email}</TD>
		<TD width=18% align=Center>${member.regdate}</TD>
	</TR>
	</c:forEach>
</TABLE>



<TABLE id = "pagenation">

	<TR>
		<TD ALIGN=LEFT WIDTH=100>
			<IMG SRC="${img}/btn_new.gif" onClick="javascript:location.replace('BoardWrite.jsp')"; STYLE=CURSOR:HAND>
		</TD>
		<TD WIDTH=320 ALIGN=CENTER>
			<%-- <IMG SRC="${img}/btn_bf_block.gif">&nbsp; --%>
			<c:if test="${startPage ne 1}">
				<a href="${context}/event/boardList/1">
					<IMG SRC="${img}/btn_bf_block.gif">&nbsp;
				</a>
			</c:if>
			
			<c:if test="${startPage - GROUPSIZE gt 0}">
				<a href="${context}/event/boardList/${startPage-GROUPSIZE}">
					<IMG SRC="${img}/btn_bf_page.gif">&nbsp;
				</a>
			</c:if>
			
			<c:forEach begin="${startPage}" end="${lastPage}" step="1" varStatus="status">
				<c:choose>
					<c:when test="${status.index == pageNo}">
						<font style="color:red; font-size: 20px">${status.index}</font>
					</c:when>
					<c:otherwise>
						<a href="${context}/event/boardList/${status.index}">
							<font>${status.index}</font>
						</a>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			
			<c:if test="${startPage + GROUPSIZE le totPage}">
				<a href="${context}/event/boardList/${startPage+GROUPSIZE}">
					<IMG SRC="${img}/btn_nxt_page.gif">&nbsp;
				</a>
			</c:if>
			
			<%-- <IMG SRC="${img}/btn_nxt_block.gif"> --%>    	    		     
		</TD>
	
		<TD WIDTH=200 ALIGN=RIGHT>
			<FORM NAME="memberSearch" action="${context}/event/memberSearch/1">
				<SELECT NAME="column" SIZE=1>
					<OPTION VALUE="" SELECTED>선택</OPTION>
					<OPTION VALUE="id">ID</OPTION>
					<OPTION VALUE="name">이름</OPTION>
					<OPTION VALUE="gender">성별</OPTION>
				</SELECT> 
				<INPUT TYPE=TEXT NAME="keyword" SIZE=10 MAXLENGTH=20>
				<input type="submit" value="검색" />
				<%-- <IMG SRC="${img}/btn_search.gif" ALIGN=absmiddle STYLE=CURSOR:HAND> --%>
			</FORM>
		</TD>    
	</TR>
	
</TABLE>


</div>


<!-- 
전체레코드 수 - ((현재 페이지번호-1) * 한 페이지당 레코트 수 + 현재게시물 출력순서)
count - ((nowPage-1)*rowPerPage+status.index)


 -->