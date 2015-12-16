<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="${js}/global.js"></script>
<script type="text/javascript">
	$(function() {
		LoginMember.detail(context+'/member/detail/${user.id}');
	});
	var LoginMember = {
			detail : function(url) {
				$.getJSON(url,
					function(data){
					var table = '<table id="tab_detail"><tr><td rowspan="9" id="td_profile"><img id="profile" src="${img}/'+data.profile+'" width="70%" height="80%"/></td>'
					+'<th id="item">항목</th><th>빈 칸</th></tr><tr><td>아이디</td><td>'+data.id+'</td></tr><tr><td>비밀번호</td><td>'+data.password
					+'</td></tr><tr><td>이름</td><td>'+data.name+'</td></tr><tr><td>생일</td><td>'+data.birth+'</td></tr><tr>'
					+'<td>주소</td><td>'+data.addr+'</td></tr><tr><td>이메일</td><td>'+data.email+'</td>'
					+'</tr><tr><td>등록일</td><td>'+data.regdate+'</td></tr><tr>'
					+'<td colspan="3"><button id="changeInfo" style="margin-right : 100px">정보수정</button><button id="remove">회원탈퇴</button></td></tr></table>'
					$('.mainView').empty();
					$('.mainView').html(table);
					LoginMember.style();
					$('#changeInfo').click(function() {
						LoginMember.updateForm();
					});
					$('#remove').click(function() {
						LoginMember.remove('${member.id}');
					});
				});
			},
			updateForm : function() {
				$.getJSON('${context}/member/detail/${user.id}',
						function(data){
					$('<form action="${context}/member/update" id="frm" method="post" enctype="multipart/form-data">')
					.appendTo($('.mainView').empty());
					var table = '<table id="tab_detail"><tr><td rowspan="9" id="td_profile"><img id="profile" name="profile" src="${img}/'+data.profile+'" width="70%" height="80%"/></td>'
					+'<th id="item">항 목</th><th>내 용</th></tr><tr><td>아이디</td><td><input type="text" id="id" name="id" value="'+data.id+'"></td></tr><tr>'
					+'<td>비밀번호</td><td><input type="password" id="password" name="password" value="'+data.password+'">'
					+'</td></tr><tr><td>이름</td><td>'+data.name+'</td></tr><tr><td>생일</td><td>'+data.birth+'</td></tr><tr>'
					+'<td>주소</td><td><input type="text" id="addr" name="addr" value="'+data.addr+'"></td></tr>'
					+'<tr><td>이메일</td><td><input type="text" id="email" name="email" value="'+data.email+'"></td></tr>'
					+'<tr><td>전화번호</td><td><input type="text" id="phone" name="phone" value="'+data.phone+'"></td>'
					+'</tr><tr><td>등록일</td><td>'+data.regdate+'</td></tr><tr>'
					+'<td><input type="file" id="file" name="file" value="이미지변경" style="margin:auto"/></td>'
					+'<td colspan="2"><button id="confirm" style="width:100px">확인</button></td></tr></table>';
					$('#frm').html(table);
					$("input[type=text]").css("color","gray").css("text-align","center");
					$("input[type=password]").css("color","gray").css("text-align","center");
					
					LoginMember.style();
					$('#confirm').click(function() {
						$('#frm').submit(function(e) {
							e.preventDefault(); /* 기본 폼태그의 서브밋을 막아라. 자스의 서브밋을 실행해라 */
							var postData = new FormData($('#frm')[0]); //파일 업로드 라이브러리의 함수 / jar 파일은 다음과 같이 다른클래스에서 생성자함수의 형태로 사용할 수 있다.
							$.ajax('${context}/member/update',{
								type : 'post',
								data : postData,
								async : true, // 비동기로 할 지 여부, 기본값  true, 생략가능
								dataType : 'json',
								mimeType : 'multipart/form-data',
								contentType : false,
								processData : false,
								success : function(data) {
									/* LoginMember.detail(context+'/member/detail/${user.id}'); => 또다시 서버를 타게 하면 낭비이기 때문에 서버를 안타고 바로 아래에서 코딩.*/
									alert('수정성공');
									var table = '<table id="tab_detail"><tr><td rowspan="9" id="td_profile"><img id="profile" src="${img}/'+data.profile+'" width="70%" height="80%"/></td>'
									+'<th id="item">항목</th><th>빈 칸</th></tr><tr><td>아이디</td><td>'+data.id+'</td></tr><tr><td>비밀번호</td><td>'+data.password
									+'</td></tr><tr><td>이름</td><td>'+data.name+'</td></tr><tr><td>생일</td><td>'+data.birth+'</td></tr><tr>'
									+'<td>주소</td><td>'+data.addr+'</td></tr><tr><td>이메일</td><td>'+data.email+'</td>'
									+'</tr><tr><td>등록일</td><td>'+data.regdate+'</td></tr><tr>'
									+'<td colspan="3"><button id="changeInfo" style="margin-right : 100px">정보수정</button><button id="remove">회원탈퇴</button></td></tr></table>'
									$('.mainView').empty();
									$('.mainView').html(table);
									LoginMember.style();
									$('#changeInfo').click(function() {
										LoginMember.updateForm();
									});
									$('#remove').click(function() {
										LoginMember.remove('${member.id}');
									});
								},
								error : function(xhr, status, msg) {
									alert('에러발생상태 : '+status +', 내용 :'+msg);
									// error 는 파라미터 갯수와 위치로 그 역할을 결정하기 때문에
									// xhr 은 자리를 지키고 있어야, status 와 msg 가 작동한다.
								}
							});
						});
					});
					
				});
			},
			update : function() {
				$.ajax('',{
					data : {},
					dataType : 'json',
					success : function(data) {
						
					},
					error : function(e) {
						
					}
				});
			},
			style : function(){
				$('#tab_detail').css('width','80%').css('height','400px').css('margin','auto').css('border','1px solid white');
				$('td').add('th').css('text-align','center').css('border','1px solid white').css('background-color','black');
				$('tr').add('th').add('td').css('float','center').css('color','white').css('border','1px solid white');
				$('#box').css('clear','both').css('margin','20px');
				$('#item').css('width','400px');
				$('#profile').css('width','300px');
				$('#td_profile').css('width','400px');
				$('#changeImg').add('#changeInfo').add('#remove').add('#confirm').css('color','black');
			},
			remove : function(userid) {
				$.ajax('${context}/member.do',{
					data : {
						userid : userid,
						page : 'remove'
					},
					dataType : 'json',
					success : function(data) {
						alert('회원탈퇴 되었습니다.');
						location.href = "${context}/member.do?page=logout";
					},
					error : function(xhr, status, msg) {
						alert('에러발생상태 : '+status +', 내용 :'+msg);
					}
				});
			}
	};
</script>
<!-- 
	* 주요속성
	* data : 서버에 전송할 데이터, key/value 형식의 객체
	* dataType : 서버가 리턴하는 데이터 타입 (xml, json, script, html)
	* type : 서버로 전송하는 데이터의 타입 (POST, GET)
	* url : 데이터를 전송할 URL
	* success : ajax통신에 성공했을 때 호출될 이벤트 핸들러
	* error : ajax통신이 실패했을 때 호출될 이벤트 핸들러
 -->