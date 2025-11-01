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
	  
	  
	   align-items: center
}
#movie-list{
width: 100%;
	height: 50px;
	border: 1px solid red;
	line-height: 50px;

	
	
}
#res1{
flex: 2;
}
#res2{
flex: 2;
}
#res3{
flex: 2;
}
#res4{
flex: 4;
}

.movieTitle {
  display: flex;
  justify-content: space-between; 
  align-items: center;           
  margin-bottom: 5px;
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

.movieTitle {
    cursor: pointer;
    padding: 10px;
    border: 1px solid #ddd;
    margin: 5px;
    transition: all 0.3s;

}

.selected{
	background: gray;
}
.date-item {
	width: 100%;
	padding: 15px;
	border: 1px solid #ddd;
	margin: 5px;
	cursor: pointer;
	transition: all 0.3s;
	text-align: center;
}
.date-item:hover {
	background-color: #f0f0f0;
}
.day-name {
	font-size: 14px;
	color: #666;
	margin-bottom: 5px;
}
.date-number {
	font-size: 18px;
	font-weight: bold;
}
.sunday {
	color: red;
}
.saturday {
	color: blue;
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
    	<div id="res2">
    	<!-- 날짜 선택 영역 -->
    	</div>
    	<div id="res3">
    	<!-- 상영 시간 선택 영역 -->
    	</div>
    	<div id="res4">4</div>
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
    			    return `<div id="movie-list" class="\${selectedMovie == e.movieId ? 'selected' : ''}">
    			   	<div id=\${e.movieId} onclick="selectedMovieTitle();"  >\${e.movieTitle} </div>
    			   			         	 
    			            
    			    </div>`;
    			}).join('');

    			
    			 document.querySelector('#res1').innerHTML = movies;
    			 
    			 
    				const movielist = document.querySelectorAll('#movie-list');
    		    	console.log(movielist);
    		    	
    		    	if(selectedMovie) {
    		    	    loadDates();
    		    	}
    				
    		}
		
    		
    	});
    	
    	
		function selectedMovieTitle() {
			
			const movielist = document.querySelectorAll('#movie-list');

			movielist.forEach(e => {
				  e.addEventListener('click', function() {
				    // 1️ 모든 요소에서 selected 제거
				    movielist.forEach(el => el.classList.remove('selected'));

				    // 2️ 클릭한 요소(this)에 selected 추가
				    this.classList.add('selected');
				  });
				});
			
			// 날짜 영역 표시
			loadDates();
		}
		
		// 2주간의 날짜 생성 함수 (간단 버전)
		function loadDates() {
			let dateHtml = '';
			let today = new Date();
			
			// 14일 반복
			for(let i = 0; i < 14; i++) {
				let date = new Date();
				date.setDate(today.getDate() + i);
				
				let year = date.getFullYear();
				let month = date.getMonth() + 1;
				let day = date.getDate();
				let dayOfWeek = date.getDay();
				
				// SQL용 날짜 형식 (YYYY-MM-DD)
				let monthStr = month < 10 ? '0' + month : month;
				let dayStr = day < 10 ? '0' + day : day;
				let fullDate = year + '-' + monthStr + '-' + dayStr;
				
				// 요일 이름
				let dayName = '';
				if(dayOfWeek == 0) dayName = '일';
				else if(dayOfWeek == 1) dayName = '월';
				else if(dayOfWeek == 2) dayName = '화';
				else if(dayOfWeek == 3) dayName = '수';
				else if(dayOfWeek == 4) dayName = '목';
				else if(dayOfWeek == 5) dayName = '금';
				else if(dayOfWeek == 6) dayName = '토';
				
				// 요일 색상
				let dayColor = '';
				if(dayOfWeek == 0) dayColor = 'sunday';
				else if(dayOfWeek == 6) dayColor = 'saturday';
				
				// HTML 만들기 (data-date 속성에 전체 날짜 저장)
				dateHtml += '<div class="date-item" data-date="' + fullDate + '" onclick="selectDate();">';
				dateHtml += '<div class="day-name ' + dayColor + '">' + dayName + '</div>';
				dateHtml += '<div class="date-number">' + month + '/' + day + '</div>';
				dateHtml += '</div>';
			}
			
			document.querySelector('#res2').innerHTML = dateHtml;
		}
		
		// 날짜 선택 함수
		function selectDate() {
			const datelist = document.querySelectorAll('.date-item');
			datelist.forEach(e => {
				e.addEventListener('click', function() {
					// 모든 날짜에서 selected 제거
					datelist.forEach(el => el.classList.remove('selected'));
					// 클릭한 날짜에 selected 추가
					this.classList.add('selected');
					
					// 선택된 영화 ID 가져오기
					const selectedMovieElement = document.querySelector('#res1 .selected div');
					const movieId = selectedMovieElement ? selectedMovieElement.id : null;
					
					// 선택된 날짜 가져오기 (data-date 속성에서)
					const selectedDate = this.getAttribute('data-date');
					
					console.log('영화 ID:', movieId);
					console.log('날짜:', selectedDate);  // 2025-11-04 형식
					
					// AJAX 요청
					$.ajax({
						url: '${pageContext.request.contextPath}/ajax/reservation/showtimes',
						method: 'GET',
						data: {
							movieId: movieId,
							date: selectedDate
						},
						success: function(response) {
							console.log(response);
							// res3에 상영시간 표시
						}
					});
				});
			});
		}
		</script>

    	
    <!-- Footer 영역 -->
    <%@ include file="../include/footer.jsp" %>
</body>
</html>