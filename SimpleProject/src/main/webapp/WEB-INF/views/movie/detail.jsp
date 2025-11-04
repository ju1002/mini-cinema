<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 상세정보</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

.movie-detail {
	max-width: 900px;
	background: #fff;
	margin: 40px auto;
	border-radius: 16px;
	padding: 150px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.movie-header {
	display: flex;
	align-items: flex-start;
	gap: 20px;
}

.poster2 {
	width: 250px;
	height: 360px;
	border-radius: 10px;
	object-fit: cover;
	background-color: #ddd;
}

.movie-info h2 {
	margin-top: 0;
	font-size: 26px;
}

.movie-info p {
	margin: 4px 0;
	color: #333;
}

.summary {
	margin-top: 40px;
	line-height: 1.6;
}
</style>
</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div class="movie-detail">
		<div class="movie-header">
			<img
				src="${pageContext.request.contextPath}/resources/images/${movie.originName}"
				alt="${movie.movieTitle}" class="poster2" />
			<div class="movie-info">
				<h2>${movie.movieTitle}</h2>
				<p>
					<strong>개봉일:</strong> ${movie.releaseDate}
				</p>
				<p>
					<strong>상영시간:</strong> ${movie.playTime}
				</p>
				<p>
					<strong>감독:</strong> ${movie.director}
				</p>
				<p>
					<strong>출연진:</strong> ${movie.actor}
				</p>
				<p>
					<strong>관람등급:</strong> ${movie.rating}
				</p>
				<p>
					<strong>장르:</strong> ${movie.genreName}
				</p>
			</div>
		</div>

		<div class="summary">
			<h3>프롤로그</h3>
			<p>${movie.story}</p>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>
