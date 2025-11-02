<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

#res-main {
	border: 1px solid black;
	width: 1400px;
	height: 700px;
	margin-top: 40px;
	margin: auto;
	display: flex;
}

#res-main [id*="res"] {
	width: 100%;
	height: 100%;
	flex-direction: 25%;
	border: 1px solid black;
	overflow: auto;
	align-items: center
}

#movie-list {
	width: 100%;
	height: 50px;
	border: 1px solid red;
	line-height: 50px;
}

#res1 {
	flex: 2;
}

#res2 {
	flex: 2;
}

#res3 {
	flex: 2;
}

#res4 {
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

.selected {
	background: #8FABD4;
}
/* 날짜 */
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

/* 상영시간 버튼 스타일 */
#res3 {
	display: flex;
	flex-wrap: wrap;
	gap: 10px; /* 버튼 사이 간격 */
	padding: 10px;
	justify-content: flex-start; /* 왼쪽부터 채움 */
	align-content: flex-start; /* 위쪽부터 채움 */
	height: 100%; /* 부모 높이 꽉 채우기 */
}

#movie-time {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 120px;
	height: 70px; /* 약간 더 높게 */
	border: 1px solid #888;
	border-radius: 8px;
	background-color: #f5f5f5;
	cursor: pointer;
	transition: all 0.2s;
	font-weight: bold;
	text-align: center;
}

#movie-time:hover {
	background-color: #e0e0e0;
	transform: scale(1.05);
}

#movie-time.selected {
	background: #8FABD4;
}

/* res4 영역 */
#seat-container {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-bottom: 15px;
}

/* 좌석 버튼 크기 키우기 */
.seat {
	width: 70px; /* 가로 */
	height: 70px; /* 세로 */
	font-size: 16px; /* 글씨 크기 */
	border: 1px solid #888;
	border-radius: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	background-color: #f5f5f5;
	transition: all 0.2s;
}

.seat.selected {
	background-color: #8FABD4;
}

.seat.disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

/* 예매 버튼 작게 만들기 */
#reserve-btn {
	width: auto !important;
	height: 40px !important;
	padding: 5px 15px !important;
	font-size: 14px !important;
	border-radius: 5px !important;
	border: 1px solid #888 !important;
	cursor: pointer !important;
	background-color: #f5f5f5 !important;
	transition: all 0.2s !important;
}

#reserve-btn:hover {
	background-color: #e0e0e0 !important;
}

#reserve-btn:disabled {
	background-color: #ccc;
	cursor: not-allowed;
}

#seat-container, #reserve-btn {
	display: none;
}
</style>
</head>
<body>

	<%@ include file="../include/common.jsp"%>


	<!-- Header 영역 -->
	<%@ include file="../include/header.jsp"%>

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
		<div id="res4">
			<div id="seat-container">
				<div class="seat" data-seat="A01">A01</div>
				<div class="seat" data-seat="A02">A02</div>
				<div class="seat" data-seat="A03">A03</div>
				<div class="seat" data-seat="A04">A04</div>
				<div class="seat" data-seat="A05">A05</div>
				<div class="seat" data-seat="A06">A06</div>
				<div class="seat" data-seat="A07">A07</div>
				<div class="seat" data-seat="A08">A08</div>
				<div class="seat" data-seat="A09">A09</div>
				<div class="seat" data-seat="A10">A10</div>

				<div class="seat" data-seat="B01">B01</div>
				<div class="seat" data-seat="B02">B02</div>
				<div class="seat" data-seat="B03">B03</div>
				<div class="seat" data-seat="B04">B04</div>
				<div class="seat" data-seat="B05">B05</div>
				<div class="seat" data-seat="B06">B06</div>
				<div class="seat" data-seat="B07">B07</div>
				<div class="seat" data-seat="B08">B08</div>
				<div class="seat" data-seat="B09">B09</div>
				<div class="seat" data-seat="B10">B10</div>
			</div>
			<button id="reserve-btn">예매하기</button>
		</div>


	</div>
	<script type="text/javascript">
    	
    function SelectedTime() {
        const movieTime = document.querySelectorAll('#movie-time');

        movieTime.forEach(e => {
            e.addEventListener('click', function() {
                // 모든 movieTime에서 selected 제거
                movieTime.forEach(el => el.classList.remove('selected'));

                // 클릭한 요소만 selected 추가
                this.classList.add('selected');

                // res4 자식 요소 보이기
                document.getElementById('seat-container').style.display = 'flex';
                document.getElementById('reserve-btn').style.display = 'inline-block';
                
                
            });
        });
    }



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
		
		// 2주간의 날짜 생성 함수
		function loadDates() {
		    let dateHtml = '';
		    let today = new Date();
		    
		    for(let i = 0; i < 14; i++) {
		        let date = new Date();
		        date.setDate(today.getDate() + i);
		        
		        let year = date.getFullYear();
		        let month = date.getMonth() + 1;
		        let day = date.getDate();
		        let dayOfWeek = date.getDay();
		        
		        let monthStr = month < 10 ? '0' + month : month;
		        let dayStr = day < 10 ? '0' + day : day;
		        let fullDate = year + '-' + monthStr + '-' + dayStr;
		        
		        let dayName = '';
		        if(dayOfWeek == 0) dayName = '일';
		        else if(dayOfWeek == 1) dayName = '월';
		        else if(dayOfWeek == 2) dayName = '화';
		        else if(dayOfWeek == 3) dayName = '수';
		        else if(dayOfWeek == 4) dayName = '목';
		        else if(dayOfWeek == 5) dayName = '금';
		        else if(dayOfWeek == 6) dayName = '토';
		        
		        let dayColor = '';
		        if(dayOfWeek == 0) dayColor = 'sunday';
		        else if(dayOfWeek == 6) dayColor = 'saturday';
		        
		        // onclick에서 직접 처리 (selectDate 함수 제거)
		        dateHtml += '<div class="date-item" data-date="' + fullDate + '" onclick="handleDateClick(this)">';
		        dateHtml += '<div class="day-name ' + dayColor + '">' + dayName + '</div>';
		        dateHtml += '<div class="date-number">' + month + '/' + day + '</div>';
		        dateHtml += '</div>';
		    }
		    
		    document.querySelector('#res2').innerHTML = dateHtml;
		}

		// 날짜 클릭 처리 (이벤트 리스너 중복 등록 없음)
		function handleDateClick(element) {
		    // 모든 날짜에서 selected 제거
		    const datelist = document.querySelectorAll('.date-item');
		    datelist.forEach(el => el.classList.remove('selected'));
		    
		    // 클릭한 날짜에 selected 추가
		    element.classList.add('selected');
		    
		    // 선택된 영화 ID 가져오기
		    const selectedMovieElement = document.querySelector('#res1 .selected div');
		    const movieId = selectedMovieElement ? selectedMovieElement.id : null;
		    
		    // 선택된 날짜 가져오기
		    const selectedDate = element.getAttribute('data-date');
		    
		    console.log('영화 ID:', movieId);
		    console.log('날짜:', selectedDate);
		    
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
		            const showTime = response.map(e => {
		            	
		            	return `<div id="movie-time" onclick="SelectedTime();">
		            	<div>\${e.startTime}</div>
		            	<div>잔여 : \${e.seatsCount} 석</div>
		            	</div>`;
		            	
		            }).join('');
		            document.querySelector('#res3').innerHTML = showTime;
		            
		            
		         // 상영시간 클릭 이벤트 등록
		            SelectedTime(movieId, selectedDate);
		        }
		    });
		}

		// 상영시간 선택
		// 전역으로 선언
const selectedSeats = [];
const maxSelection = 3;

function SelectedTime(movieId, selectedDate) {
    const movieTime = document.querySelectorAll('#movie-time');

    movieTime.forEach(e => {
        e.addEventListener('click', function() {
            // 모든 movieTime에서 selected 제거
            movieTime.forEach(el => el.classList.remove('selected'));

            // 클릭한 요소만 selected 추가
            this.classList.add('selected');

            // res4 자식 요소 보이기
            document.getElementById('seat-container').style.display = 'flex';
            document.getElementById('reserve-btn').style.display = 'inline-block';

            // 좌석 초기화
            selectedSeats.length = 0; // 선택 좌석 초기화
            const seats = document.querySelectorAll('.seat');
            seats.forEach(seat => {
                seat.classList.remove('selected');
                seat.classList.remove('disabled');
            });

            // 예약된 좌석 AJAX로 불러오기
            const startTime = this.querySelector('div:first-child').textContent;
            $.ajax({
                url: '${pageContext.request.contextPath}/ajax/reservation/seats',
                method: 'GET',
                data: {
                    movieId: movieId,
                    date: selectedDate,
                    startTime: startTime
                },
                success: function(reserved) {
                    seats.forEach(seat => {
                        if (reserved.includes(seat.dataset.seat)) {
                            seat.classList.add('disabled');
                        }
                    });
                }
            });

            // 좌석 클릭 이벤트 등록
            seats.forEach(seat => {
                seat.onclick = function() {
                    if (seat.classList.contains('disabled')) return;

                    const seatId = seat.dataset.seat;

                    if (selectedSeats.includes(seatId)) {
                        // 선택 취소
                        selectedSeats.splice(selectedSeats.indexOf(seatId), 1);
                        seat.classList.remove('selected');
                    } else {
                        if (selectedSeats.length >= maxSelection) {
                            alert('최대 3개의 좌석만 선택 가능합니다.');
                            return;
                        }
                        selectedSeats.push(seatId);
                        seat.classList.add('selected');
                    }
                };
            });
        });
    });
}

		</script>


	<!-- Footer 영역 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>