<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.content {
	background-color: rgb(247, 245, 245);
	width: 80%;
	margin: auto;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	background-color: white;
}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp" />

	<div class="content">
		<br>
		<br>
		<div class="innerOuter">
			<h2>마이페이지</h2>
            <br>

            <form action="edit" method="post">
                <div class="form-group">
                	<input type="hidden" id="userNo" value="${ sessionScope.loginMember.userNo }" name="userNo">
                    <label for="userId">* ID : </label>
                    <input type="text" class="form-control" id="userId" value="${ sessionScope.loginMember.userId }" name="userId" readonly> <br>

                    <label for="userName">* Name : </label>
                    <input type="text" class="form-control" id="userName" value="${ sessionScope.loginMember.userName }" name="userName" required> <br>

					<label for="brithday">* birthday : </label>
                    <input type="text" class="form-control" id="brithday" value="${ sessionScope.loginMember.birthday }" name="birthday"> <br>
					
                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="text" class="form-control" id=phone value="${ sessionScope.loginMember.phone }" name="phone"> <br>
                    
                    <label for="email"> &nbsp; Email : </label>
                    <input type="text" class="form-control" id="email" value="${ sessionScope.loginMember.email }" name="email"> <br>
                    
                    <label for="snsAgree"> &nbsp; SNS수신여부 : </label>
                    <input type="radio" name="snsAgree" value="Y" 
					       <c:if test="${sessionScope.loginMember.snsAgree == 'Y'}">checked</c:if>> 동의
					<input type="radio" name="snsAgree" value="N" 
					       <c:if test="${sessionScope.loginMember.snsAgree == 'N'}">checked</c:if>> 비동의
				    <br><br> 
				    <input type="checkbox" name="genreList" value="G001" ${fn:contains(sessionScope.loginMemberGenre, 'G001') ? 'checked' : ''}>드라마
				    <input type="checkbox" name="genreList" value="G002" ${fn:contains(sessionScope.loginMemberGenre, 'G002') ? 'checked' : ''}>액션
				    <input type="checkbox" name="genreList" value="G003" ${fn:contains(sessionScope.loginMemberGenre, 'G003') ? 'checked' : ''}>코미디
				    <input type="checkbox" name="genreList" value="G004" ${fn:contains(sessionScope.loginMemberGenre, 'G004') ? 'checked' : ''}>스릴러
				    <input type="checkbox" name="genreList" value="G005" ${fn:contains(sessionScope.loginMemberGenre, 'G005') ? 'checked' : ''}>로맨스
				    <input type="checkbox" name="genreList" value="G006" ${fn:contains(sessionScope.loginMemberGenre, 'G006') ? 'checked' : ''}>SF
				    <input type="checkbox" name="genreList" value="G007" ${fn:contains(sessionScope.loginMemberGenre, 'G007') ? 'checked' : ''}>공포
				    <input type="checkbox" name="genreList" value="G008" ${fn:contains(sessionScope.loginMemberGenre, 'G008') ? 'checked' : ''}>애니메이션  


				</div>
				<br>
				<div class="btns" align="center">
					<button type="submit" class="btn btn-primary">내 예매보기</button>
					<button type="submit" class="btn btn-primary">수정하기</button>
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#deleteForm">회원탈퇴</button>
				</div>
			</form>
		</div>
		<br>
		<br>

	</div>

	<!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
	<div class="modal fade" id="deleteForm">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="delete" method="post">
					<!-- Modal body -->
					<div class="modal-body">
						<div align="center">
							탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴 하시겠습니까? <br>
						</div>
						<br> <label for="userPwd" class="mr-sm-2">Password :
						</label> <input type="text" class="form-control mb-2 mr-sm-2"
							placeholder="Enter Password" id="userPwd" name="userPwd">
						<br>

					</div>
					<!-- Modal footer -->
					<div class="modal-footer" align="center">
						<button type="submit" class="btn btn-danger">탈퇴하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:if test="${not empty msg}">
		<script>
			alert("${msg}");
		</script>
	</c:if>

	<jsp:include page="../include/footer.jsp" />


</body>
</html>