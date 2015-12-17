var Global = {

   init : function() {
      var wrapper = document.createElement("div");
      wrapper.id = "wrapper";
      document.body.appendChild(wrapper);
      
      $("<div id='header'></div>").appendTo($("#wrapper"));
      $("<div id='outbox'></div>").appendTo($("#wrapper"));
         $("<div id='box'></div>").appendTo($("#outbox"));
      $("<div id='footer'></div>").appendTo($("#wrapper"));
   },
   
   load : function(btn, target, url) {
	  btn.click(function() {
		   $(target).load(url);
	});
},

	move : function(btn,url) {
		btn.click(function() {
			location.href = url;
		});
	},
	
	aaa : function(url) {
		alert('보더리스트.load');
		$.getJSON(url, function(data){
			var table = '<div id = "boardList"><h1 align=center style="color:white; margin-bottom: 50px;">'
			+'회원목록</h1><TABLE id = "tab_boardList"><tr><td colspan="5"style="text-align: right; border: none;">'
			+'총회원수:</td></tr><TR ALIGN=CENTER><TD WIDTH=10%>'
			+'<B>번호</B></TD><TD WIDTH=20%><B>아이디</B></TD><TD WIDTH=20%><B>회원명</B>'
			+'</TD><TD WIDTH=30%><B>이메일</B></TD><TD WIDTH=18%><B>가입일</B></TD></TR>'
			$('.mainView').empty();
			$('.mainView').html(table);
		});
	}
};
