<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CGV 이벤트</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;600;700;900&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

:root {
    --primary: #e50914;
    --primary-dark: #b20710;
    --gray-300: #e0e0e0;
    --gray-600: #666666;
    --gray-700: #444444;
    --gray-900: #222222;
}

body {
    font-family: 'Noto Sans KR', Arial, sans-serif;
    background: #f5f5f5;
    color: var(--gray-700);
}

.container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 60px 40px;
}

.page-header {
    text-align: center;
    margin-bottom: 50px;
}

.page-header h1 {
    font-size: 2.8em;
    color: var(--gray-900);
    margin-bottom: 12px;
    font-weight: 900;
}

.page-header p {
    color: var(--gray-600);
    font-size: 1.1em;
}

.list-controls {
    display: flex;
    justify-content: space-between;
    margin-bottom: 50px;
    gap: 20px;
    flex-wrap: wrap;
}

.search-box {
    flex: 1;
    min-width: 250px;
    display: flex;
    gap: 8px;
}

.search-box input {
    flex: 1;
    padding: 14px 20px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px;
    font-size: 0.95em;
}

.search-btn {
    padding: 12px 20px;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.1em;
}

.search-btn:hover {
    background: var(--primary-dark);
}

.btn-primary {
    padding: 12px 24px;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: 700;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s;
}

.btn-primary:hover {
    background: var(--primary-dark);
}

.event-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 28px;
    margin-bottom: 50px;
}

.event-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    transition: transform 0.4s;
}

.event-card:hover {
    transform: translateY(-8px);
}

.event-card-header {
    background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
    height: 180px;
    position: relative;
    overflow: hidden;
}

.event-card-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(180deg, rgba(0,0,0,0.3) 0%, rgba(0,0,0,0.6) 100%);
    z-index: 1;
}

.event-card-header-content {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 20px;
    z-index: 2;
    color: white;
}

.event-card-title {
    font-size: 1.25em;
    font-weight: 700;
    margin-bottom: 8px;
}

.event-card-badge {
    display: inline-block;
    background: var(--primary);
    color: white;
    padding: 6px 14px;
    border-radius: 4px;
    font-size: 0.8em;
    font-weight: 700;
}

.event-card-body {
    padding: 24px;
}

.event-description {
    color: var(--gray-600);
    margin-bottom: 24px;
    line-height: 1.6;
    font-size: 0.95em;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.event-meta {
    padding-top: 16px;
    border-top: 1px solid var(--gray-300);
    margin-bottom: 24px;
    font-size: 0.9em;
    color: var(--gray-600);
}

.event-footer {
    display: flex;
    gap: 12px;
}

.btn {
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-weight: 700;
    cursor: pointer;
    flex: 1;
    transition: all 0.3s;
}

.btn-edit {
    background: transparent;
    color: var(--gray-700);
    border: 1.5px solid var(--gray-300);
}

.btn-edit:hover {
    background: #f5f5f5;
}

.btn-danger {
    background: transparent;
    color: var(--primary);
    border: 1.5px solid var(--primary);
}

.btn-danger:hover {
    background: var(--primary);
    color: white;
}

.pagination {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin-top: 50px;
    flex-wrap: wrap;
}

.pagination a, .pagination span {
    padding: 10px 14px;
    border: 1.5px solid var(--gray-300);
    background: white;
    color: var(--gray-700);
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    text-decoration: none;
    display: inline-block;
    transition: all 0.3s;
}

.pagination a:hover {
    border-color: var(--primary);
    color: var(--primary);
}

.pagination a.active {
    background: var(--primary);
    color: white;
    border-color: var(--primary);
}

.pagination span.disabled {
    opacity: 0.5;
    cursor: not-allowed;
}

.page-info {
    text-align: center;
    color: var(--gray-600);
    margin-top: 24px;
    font-size: 0.9em;
}

.empty-state {
    grid-column: 1 / -1;
    text-align: center;
    padding: 100px 20px;
    color: var(--gray-600);
}

.empty-state h3 {
    font-size: 1.4em;
    color: var(--gray-900);
    margin-bottom: 12px;
}

@media (max-width: 768px) {
    .container {
        padding: 40px 20px;
    }
    
    .page-header h1 {
        font-size: 2em;
    }
    
    .list-controls {
        flex-direction: column;
    }
    
    .event-grid {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"/>

<!-- 삭제 성공 alert -->
<c:if test="${deleteSuccess}">
    <script>
        alert('이벤트가 삭제되었습니다.');
    </script>
</c:if>

<div class="container">
    <div class="page-header">
        <h1>🎉 이벤트 목록</h1>
        <p>현재 진행 중이거나 예정된 모든 이벤트를 확인하세요</p>
    </div>

    <div class="list-controls">
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="이벤트 제목으로 검색...">
            <button class="search-btn">🔍</button>
        </div>
        <a class="btn-primary" href="/spring/event/form">➕ 이벤트 등록</a>
    </div>

    <!-- 이벤트 목록 표시 -->
    <div class="event-grid">
        <c:if test="${empty events}">
            <div class="empty-state">
                <div class="empty-icon">📭</div>
                <h3>이벤트가 없습니다</h3>
                <p>새로운 이벤트를 만들어보세요!</p>
            </div>
        </c:if>
<!-- var=변수명 반복마다 사용할 변수 items=반복할 데이터 begin= end= 숫자범위 반봅 -->
        <c:forEach var="event" items="${events}">
            <div class="event-card">
                <div class="event-card-header">
                    <div class="event-card-header-content">
                        <div class="event-card-title">${event.eventTitle}</div>
                        <span class="event-card-badge">진행 중</span>
                    </div>
                </div>
                <div class="event-card-body">
                    <p class="event-description">${event.description}</p>
                    <div class="event-meta">
                        <div>📅 ${event.startDate} ~ ${event.endDate}</div>
                    </div>
                    <div class="event-footer">
                        <a class="btn btn-edit" href="jacascript:confirmUpdate(${event.evetNo,event.userNo })">수정</a>
                        <a class="btn btn-danger" href="javascript:confirmDelete(${event.eventNo})">삭제</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- 페이지네이션 -->
    <div id="pagingArea">
        <ul class="pagination" style="justify-content: center;">
            <!-- 이전 버튼 -->
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="/spring/event/inventory?page=${currentPage - 1}">이전</a>
                </li>
            </c:if>
            <c:if test="${currentPage == 1}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">이전</a>
                </li>
            </c:if>

            <!-- 페이지 버튼 (1, 2, 3) -->
            <c:forEach var="i" begin="1" end="3">
                <c:if test="${i == currentPage}">
                    <li class="page-item active">
                        <a class="page-link" href="/spring/event/inventory?page=${i}">${i}</a>
                    </li>
                </c:if>
                <c:if test="${i != currentPage}">
                    <li class="page-item">
                        <a class="page-link" href="/spring/event/inventory?page=${i}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>

            <!-- 다음 버튼 -->
            <li class="page-item">
                <a class="page-link" href="/spring/event/inventory?page=${currentPage + 1}">다음</a>
            </li>
        </ul>
    </div>
</div>

<script>
function confirmDelete(eventNo) {
    if (confirm('정말 이 이벤트를 삭제하시겠습니까?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '/spring/event/deleteEvent';
        
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'eventNo';
        input.value = eventNo;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}
</script>
<script>
function confirmUpdate(eventNo,userNo) {
    if (confirm('정말 이 이벤트를 수정하시겠습니까?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '/spring/event/updateEvent';
        
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'eventNo','userNo'";
        input.value = eventNo,userNo;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}
</script>
</body>
</html>