<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 1400px;
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
	   align-items: center
}
#movie-list{
width: 100%;
	height: 50px;
	border: 1px solid red;
	line-height: 50px;

	
	
}
.movieTitle {
  display: flex;
  justify-content: space-between; 
  align-items: center;           
  margin-bottom: 5px;
}


/* 라디오 버튼 숨기기 */
input[type="radio"] {
  display: none;
}

/* label 기본 스타일 */
.movie-label {
  display: block;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s;
}

/* 라디오 체크 시 label 배경색 변경 */
input[type="radio"]:checked + #movieTitle {
  background-color: #a0d2eb; /* 원하는 색상 */
  color: #000;
  border-color: #0077cc;
}

.selected{
	background: gray;
}

</style>
</head>
<body>
	
	<%@ include file="../include/common.jsp" %>
	
	
	   <!-- Header 영역 -->
    <%@ include file="../include/header.jsp" %>
    
    <div id="res-main">
    	<div id="res1">
    	<!-- 영화 리스트 비동기 -->
    
 
    	
    	
    	</div>
    	<div id="res2">2</div>
    	<div id="res3">3</div>
    	<div id="res4">4</div>
    	<div id="res5">4</div>
    </div>
    <script type="text/javascript">
    	
    	const selectedMovie = '${selectedMovieId}'; 
    	console.log(selectedMovie);
    	
    	$.ajax({
    		url: '${pageContext.request.contextPath}/ajax/reservation',
    		method: 'GET',
    		success:function(response){
    			console.log(response);
    			
    			
    			const movies = response.map(e => {
    			    return `<div id="movie-list">
    			   	<div id=\${e.movieId} onclick="change();">\${e.movieTitle} </div>
    			   			         	 
    			            
    			    </div>`;
    			}).join('');

    			
    			 document.querySelector('#res1').innerHTML = movies;
    			 
    			 
    				const movielist = document.querySelectorAll('#movie-list');
    		    	console.log(movielist);
    				
    				
    		}
		
    		
    	});
    	
    	
		function change() {
			
			const movielist = document.querySelectorAll('#movie-list');

			movielist.forEach(item => {
				  item.addEventListener('click', function() {
				    // 1️ 모든 요소에서 selected 제거
				    movielist.forEach(el => el.classList.remove('selected'));

				    // 2️ 클릭한 요소(this)에 selected 추가
				    this.classList.add('selected');
				  });
				});
		}
    	
    	
    	</script>
    	
    <!-- Footer 영역 -->
    <%@ include file="../include/footer.jsp" %>
</body>
</html>