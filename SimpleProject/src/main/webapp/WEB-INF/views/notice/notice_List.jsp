<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
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

        .notice-item {
            border-bottom: 1px solid #e0e0e0;
            padding: 0;
            transition: background-color 0.2s;
        }

        .notice-item:hover {
            background-color: #f8f9fa;
        }

        .notice-item:last-child {
            border-bottom: none;
        }

        .notice-item form {
            padding: 20px 30px;
            cursor: pointer;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
        }

        .notice-item button {
            background: none;
            border: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            padding: 0;
        }

        .notice-badge {
            display: inline-block;
            background-color: #e74c3c;
            color: white;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            margin-right: 10px;
        }

        .notice-title {
            font-size: 16px;
            font-weight: 500;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .notice-meta {
            font-size: 13px;
            color: #7f8c8d;
        }

        .notice-meta span {
            margin-right: 15px;
        }

        .pagination {
            padding: 20px;
            text-align: center;
            border-top: 1px solid #e0e0e0;
        }

        .pagination button {
            padding: 8px 15px;
            margin: 0 5px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
            border-radius: 4px;
            transition: all 0.2s;
            color: #333;
        }

        .pagination button:hover {
            background-color: #2c3e50;
            color: white;
            border-color: #2c3e50;
        }

        .pagination button.active {
            background-color: #2c3e50;
            color: white;
            border-color: #2c3e50;
        }

        .write-button {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s;
            margin: 20px 30px;
            float: right;
        }

        .write-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	    <div class="container">
	        <div class="header">
	            <h1>📢 공지사항</h1>
	        </div>

	        <div style="padding: 20px 30px; text-align: right; border-bottom: 1px solid #e0e0e0;">
	            <form action="${pageContext.request.contextPath}/notice/noticeWrite" method="get" style="display: inline;">
	                <button type="submit" class="write-button">✏️ 글쓰기</button>
	            </form>
	        </div>

	        <div class="notice-list">
	            
	            <c:forEach var="notice" items="${noticeList}">
	                <div class="notice-item">
	                    <form action="${pageContext.request.contextPath}/notice/noticeDetail" method="post">
	                        <input type="hidden" name="noticeId" value="${notice.noticeNo}">
	                        <button type="submit">
	                            <div class="notice-title">
	                                ${notice.noticeTitle}
	                            </div>
	                            <div class="notice-meta">
	                                <span>📅 <fmt:formatDate value="${notice.createDate}" pattern="yyyy.MM.dd" /></span>
	                                <span>👁 ${notice.count}</span>
	                            </div>
	                        </button>
	                    </form>
	                </div>
	            </c:forEach>
	            
	            <c:if test="${empty noticeList}">
	                <div style="padding: 50px; text-align: center; color: #7f8c8d;">
	                    등록된 공지사항이 없습니다.
	                </div>
	            </c:if>
	            

	            <div class="pagination">
	                <c:if test="${pageInfo.currentPage > 1}">
	                    <form action="${pageContext.request.contextPath}/notice/noticeList" method="get" style="display: inline;">
	                        <input type="hidden" name="page" value="${pageInfo.currentPage - 1}">
	                        <button type="submit">&lt; 이전</button>
	                    </form>
	                </c:if>

	                <c:forEach var="p" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	                    <form action="${pageContext.request.contextPath}/notice/noticeList" method="get" style="display: inline;">
	                        <input type="hidden" name="page" value="${p}">
	                        <button type="submit" class="${p == pageInfo.currentPage ? 'active' : ''}">
	                            ${p}
	                        </button>
	                    </form>
	                </c:forEach>

	                <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
	                    <form action="${pageContext.request.contextPath}/notice/noticeList" method="get" style="display: inline;">
	                        <input type="hidden" name="page" value="${pageInfo.currentPage + 1}">
	                        <button type="submit">다음 &gt;</button>
	                    </form>
	                </c:if>
	            </div>
	        </div>
	    </div>
	    <jsp:include page="../include/footer.jsp" />
	</body>
	</html>