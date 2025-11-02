<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body{
	background-color: #f5f5f5;
}

.movie-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 60px;
	width: 100%;
}

.movie-card {
	background: lightgray;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
	cursor: pointer;
}

.movie-card:hover {
	transform: translateY(-5px);
}

.poster {
	width: 100%;
	height: 280px;
	object-fit: cover;
}

.movie-info {
	padding: 15px;
}

.movie-title {
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 6px;
}

.movie-meta {
	font-size: 13px;
	color: #777;
	font-size: 12px;
}

.prod-box-1 {
	padding: 150px;
	width: 100%;
	max-width: 1400px;
    margin: 0 auto; 
    box-sizing: border-box;
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="prod-box-1">
		<div class="movie-grid"></div>
	</div>

	<script>
	function detail(id) {
	    location.href = `${pageContext.request.contextPath}/movie/detail/\${id}`;
	}
	
	function getListMovie() {
		$.ajax({
			url : `${pageContext.request.contextPath}/movie/list`,
			success : function(response) {
				console.log('응답 데이터:', response);
				
				console.log('첫번째 응답 제목 : ', response[0].movieTitle);
				
				const result = response.map(movie => `
			    <div class="movie-card" onClick = "detail('\${movie.movieId}')")>
				<img src="${pageContext.request.contextPath}/resources/images/\${movie.originName}" 
			     alt="${movie.movieTitle}" class="poster" />
			        <div class="movie-info">
			            <div class="movie-title">\${movie.movieTitle}</div>
			            <div class="movie-meta">\${movie.releaseDate} · \${movie.genreName} · \${movie.rating}</div>
			        </div>
			    </div>
			`).join('');
				
				$('.movie-grid').html(result);
			}
		})
	}
	
	$(function() {
		  getListMovie();
		});
	</script>


	<%@ include file="../include/footer.jsp"%>
</body>
</html>