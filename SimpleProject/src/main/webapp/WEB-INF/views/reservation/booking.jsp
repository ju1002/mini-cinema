<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin: 0px;
	padding: 0px;
}
#res-main{
	border: 1px solid black;
	width: 1200px;
	height: 700px;
	margin-top:40px;
	margin: auto;
	display: flex;
}
#res-main [id*="res"]  {
	width:100%;
	height:100%;
	flex-direction: 25%;
	border: 1px solid black;
	 overflow: auto;
	  
	   flex: 1;
}

#movie-select{

	width: 100%;
	height: 50px;
	border: 1px solid red;
}
</style>
</head>
<body>
	
	<%@ include file="../include/common.jsp" %>
	
	
	   <!-- Header 영역 -->
    <%@ include file="../include/header.jsp" %>
    
    <div id="res-main">
    	<div id="res1">
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	<div id="movie-select"></div>
    	
    	</div>
    	<div id="res2">2</div>
    	<div id="res3">3</div>
    	<div id="res4">4</div>
    </div>
    
    <!-- Footer 영역 -->
    <%@ include file="../include/footer.jsp" %>
</body>
</html>