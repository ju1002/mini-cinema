<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        
        /* * [수정됨] 상세 조회 링크(a 태그) 스타일
         */
        .notice-link {
            display: block;
            padding: 20px 30px;
            text-decoration: none;
            color: inherit; /* 부모 색상 상속 */
        }
        
        /* * [삭제됨] 
         * .notice-item form, .notice-item button 스타일은
         * .notice-link 스타일로 대체되었으므로 삭제 
         */

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

        /*
         * [수정됨] 
         * pagination button -> pagination-button (a 태그용 클래스)
         */
        .pagination-button {
            display: inline-block; /* <a> 태그에 패딩을 주기 위해 */
            padding: 8px 15px;
            margin: 0 5px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
            border-radius: 4px;
            transition: all 0.2s;
            color: #333;
            text-decoration: none; /* <a> 태그 밑줄 제거 */
        }

        .pagination-button:hover {
            background-color: #2c3e50;
            color: white;
            border-color: #2c3e50;
        }

        .pagination-button.active {
            background-color: #2c3e50;
            color: white;
            border-color: #2c3e50;
        }

        /* * [수정됨] 
         * 글쓰기 버튼 (a 태그용 클래스)
         */
        .write-button {
            display: inline-block; /* <a> 태그에 패딩을 주기 위해 */
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s;
            text-decoration: none; /* <a> 태그 밑줄 제거 */
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
		<div style="background:yellow; padding:20px; font-weight:bold; font-size:16px;">
		    [세션 디버깅]<br>
		    세션 loginMember 객체: ${sessionScope.loginMember} <br><br>
		    
		    loginMember.manager 값: [${sessionScope.loginMember.manager}] <br>
		    manager 값 'Y'와 비교: ${sessionScope.loginMember.manager eq 'Y'}
			
			세션 loginMember 객체: ${sessionScope.loginMember}
		</div>

        <div style="padding: 20px 30px; text-align: right; border-bottom: 1px solid #e0e0e0;">
            <c:if test="${not empty sessionScope.loginMember and sessionScope.loginMember.manager eq 'Y'}">
                <a href="${pageContext.request.contextPath}/notice/noticeForm" class="write-button">✏️ 글쓰기</a>
            </c:if>
        </div>

        <div class="notice-list">
            
            <c:forEach var="notice" items="${noticeList}">
                <div class="notice-item">
                    <a href="${pageContext.request.contextPath}/notice/noticeDetail?noticeId=${notice.noticeNo}" class="notice-link">
                        <div class="notice-title">
                            ${notice.noticeTitle}
                        </div>
                        <div class="notice-meta">
                            <span>📅 <fmt:formatDate value="${notice.createDate}" pattern="yyyy.MM.dd" /></span>
                            <span>👁 ${notice.count}</span>
                        </div>
                    </a>
                </div>
            </c:forEach>
            
            <c:if test="${empty noticeList}">
                <div style="padding: 50px; text-align: center; color: #7f8c8d;">
                    등록된 공지사항이 없습니다.
                </div>
            </c:if>
            

            <div class="pagination">
                <c:if test="${pageInfo.currentPage > 1}">
                    <a href="${pageContext.request.contextPath}/notice/noticeList?page=${pageInfo.currentPage - 1}" class="pagination-button">&lt; 이전</a>
                </c:if>

                <c:forEach var="p" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                    <a href="${pageContext.request.contextPath}/notice/noticeList?page=${p}" 
                       class="pagination-button ${p == pageInfo.currentPage ? 'active' : ''}">
                        ${p}
                    </a>
                </c:forEach>

                <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
                    <a href="${pageContext.request.contextPath}/notice/noticeList?page=${pageInfo.currentPage + 1}" class="pagination-button">다음 &gt;</a>
                </c:if>
            </div>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>