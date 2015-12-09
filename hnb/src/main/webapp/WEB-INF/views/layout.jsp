<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>한빛 포트폴리오</title>
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
	<div id = "footer"></div>
		<tiles:insertAttribute name = "footer"/>
	</div>
</body>
</html>