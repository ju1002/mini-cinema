<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 28px;
            font-weight: 600;
        }

        .detail-header {
            padding: 30px;
            border-bottom: 2px solid #2c3e50;
        }

        .detail-title {
            font-size: 24px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .detail-meta {
            font-size: 14px;
            color: #7f8c8d;
        }

        .detail-meta span {
            margin-right: 20px;
        }

        .detail-content {
            padding: 30px;
            line-height: 1.8;
            color: #34495e;
            min-height: 300px;
        }

        .detail-content h3 {
            margin-bottom: 15px;
            color: #2c3e50;
        }

        .detail-content p {
            margin-bottom: 10px;
        }

        .detail-content strong {
            color: #2c3e50;
        }

        .button-group {
            padding: 20px 30px;
            border-top: 1px solid #e0e0e0;
            display: flex;
            gap: 10px;
        }

        .back-button {
            padding: 10px 20px;
            background-color: #95a5a6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .back-button:hover {
            background-color: #7f8c8d;
        }

        .edit-button {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .edit-button:hover {
            background-color: #2980b9;
        }

        .delete-button {
            padding: 10px 20px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />

    <div class="container">
        <div class="header">
            <h1>📢 공지사항</h1>
        </div>

        <div class="detail-header">
			<div class="detail-title">
			    ${notice.noticeTitle} 
			</div>
            <div class="detail-meta">
				<span>작성일: <strong>
				    ${notice.formattedDate} 
				</strong></span>
                <span>조회수: <strong>${notice.count}</strong></span>
                <span>작성자: <strong>${notice.userName}</strong></span>
            </div>
        </div>

        <div class="detail-content">
           <pre style="font-family: inherit; font-size: 1em; white-space: pre-wrap;">${notice.noticeContent}</pre>
        </div>

		<div class="button-group">
		            <a href="${pageContext.request.contextPath}/notice/noticeList" class="back-button" style="text-decoration: none;">← 목록으로</a>
		            <c:if test="${not empty sessionScope.loginMember and sessionScope.loginMember.manager eq 'Y'}">
		                <form action="${pageContext.request.contextPath}/notice/noticeUpdateForm" method="get" style="display: inline;">
		                    <input type="hidden" name="noticeId" value="${notice.noticeNo}">
		                    <button type="submit" class="edit-button">수정</button>
		                </form>
		                <form action="${pageContext.request.contextPath}/notice/noticeDelete" method="post" style="display: inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
		                    <input type="hidden" name="noticeId" value="${notice.noticeNo}">
		                    <button type="submit" class="delete-button">삭제</button>
		                </form>
		            </c:if> </div>
		    </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>