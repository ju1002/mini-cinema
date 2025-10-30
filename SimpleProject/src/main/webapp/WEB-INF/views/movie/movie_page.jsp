<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 상세정보</title>
<style>
.movie-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 30px;
	width: 100%;
}

.movie-card {
	background: pink;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.2s;
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
}

.prod-box-1 {
	padding: 100px 0px 100px 100px;
	width: 100%;
	height: 800px;
}
</style>
</head>
<body>
	<%@ include file="../include/header.jsp"%>

	<div class="prod-box-1">
		<div class="movie-grid">
			<div class="movie-card">
				<img src="https://via.placeholder.com/200x280" alt="" class="poster" />
				<div class="movie-info">
					<div class="movie-title">영화 제목</div>
					<div class="movie-meta">2024 · 장르 · 등급</div>
				</div>
			</div>

			<div class="movie-card">
				<img src="https://via.placeholder.com/200x280" alt="" class="poster" />
				<div class="movie-info">
					<div class="movie-title">영화 제목</div>
					<div class="movie-meta">2024 · 장르 · 등급</div>
				</div>
			</div>

			<div class="movie-card">
				<img src="https://via.placeholder.com/200x280" alt="" class="poster" />
				<div class="movie-info">
					<div class="movie-title">영화 제목</div>
					<div class="movie-meta">2024 · 장르 · 등급</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>