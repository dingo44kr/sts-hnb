<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>한빛 포트폴리오</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="${css}/common.css" />
</head>
<body>
	<div id="wrap">
	
	<div id = "heardr">
	    <tiles:insertAttribute name="header" />
	</div>
	
	<div id = "content">
	<section class = "sectionClass">
		<div class = "mainView">
		  <tiles:insertAttribute name = "content"/>
		</div>
	</section>
	</div>
		<div id = "footer">
			<tiles:insertAttribute name = "footer"/>
		</div>
	</div>
<script src="${js}/global.js"></script>  
<script src="${js}/bootstrap.js"></script>
<script src="${js}/bootstrap.min.js"></script> 
<script src="${js}/member.js"></script>
<script src="${js}/admin.js"></script>
<script src="${js}/bom.js"></script>
<script src="${js}/movie.js"></script>
<script src="${js}/ticket.js"></script>
</body>
</html>