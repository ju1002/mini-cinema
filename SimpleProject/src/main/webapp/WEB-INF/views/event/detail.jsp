<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 상세보기</title>
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
    max-width: 900px;
    margin: 0 auto;
    padding: 60px 40px;
}

.detail-header {
    text-align: center;
    margin-bottom: 40px;
}

.detail-header h1 {
    font-size: 2.5em;
    color: var(--gray-900);
    margin-bottom: 8px;
    font-weight: 900;
}

.detail-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 16px rgba(0,0,0,0.1);
    overflow: hidden;
    margin-bottom: 30px;
}

.detail-card-header {
    background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
    padding: 40px;
    color: white;
    position: relative;
    overflow: hidden;
}

.detail-card-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(180deg, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0.5) 100%);
    z-index: 1;
}

.detail-title {
    position: relative;
    z-index: 2;
    font-size: 2em;
    font-weight: 700;
    margin-bottom: 12px;
}

.detail-badge {
    display: inline-block;
    background: var(--primary);
    color: white;
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 0.9em;
    font-weight: 700;
    position: relative;
    z-index: 2;
}

.detail-content {
    padding: 40px;
}

.detail-section {
    margin-bottom: 32px;
    padding-bottom: 24px;
    border-bottom: 1px solid var(--gray-300);
}

.detail-section:last-child {
    margin-bottom: 0;
    padding-bottom: 0;
    border-bottom: none;
}

.detail-label {
    font-size: 0.9em;
    font-weight: 700;
    color: var(--gray-600);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 8px;
}

.detail-value {
    font-size: 1.1em;
    color: var(--gray-900);
    line-height: 1.8;
    word-break: break-word;
}

.description-box {
    background: #f9f9f9;
    padding: 24px;
    border-radius: 8px;
    border-left: 4px solid var(--primary);
}

.meta-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
    margin-bottom: 32px;
}

.meta-item {
    background: #f9f9f9;
    padding: 16px;
    border-radius: 8px;
}

.meta-item-label {
    font-size: 0.85em;
    color: var(--gray-600);
    font-weight: 600;
    margin-bottom: 8px;
}

.meta-item-value {
    font-size: 1em;
    color: var(--gray-900);
    font-weight: 600;
}

.button-group {
    display: flex;
    gap: 12px;
    margin-top: 32px;
    justify-content: center;
}

.btn {
    padding: 12px 28px;
    border: none;
    border-radius: 8px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s;
    text-decoration: none;
    display: inline-block;
    font-size: 0.95em;
}

.btn-primary {
    background: var(--primary);
    color: white;
}

.btn-primary:hover {
    background: var(--primary-dark);
}

.btn-secondary {
    background: white;
    color: var(--gray-700);
    border: 1.5px solid var(--gray-300);
}

.btn-secondary:hover {
    border-color: var(--primary);
    color: var(--primary);
}

.btn-danger {
    background: #f5f5f5;
    color: var(--primary);
    border: 1.5px solid var(--primary);
}

.btn-danger:hover {
    background: var(--primary);
    color: white;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    animation: fadeIn 0.3s;
}

.modal.show {
    display: flex;
    align-items: center;
    justify-content: center;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

.modal-content {
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
    animation: slideUp 0.3s;
    max-width: 600px;
    width: 90%;
    max-height: 90vh;
    display: flex;
    flex-direction: column;
}

.modal-small {
    max-width: 400px;
}

@keyframes slideUp {
    from {
        transform: translateY(50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

.modal-header {
    padding: 24px;
    border-bottom: 1px solid var(--gray-300);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.modal-header h2 {
    font-size: 1.5em;
    color: var(--gray-900);
    margin: 0;
}

.close {
    font-size: 2em;
    font-weight: 700;
    color: var(--gray-600);
    cursor: pointer;
    transition: color 0.3s;
    line-height: 1;
}

.close:hover {
    color: var(--gray-900);
}

.modal-body {
    padding: 24px;
    flex: 1;
    overflow-y: auto;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: 600;
    margin-bottom: 8px;
    color: var(--gray-900);
    font-size: 0.95em;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 12px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px;
    font-family: inherit;
    font-size: 0.95em;
    transition: border-color 0.3s;
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: var(--primary);
}

.modal-footer {
    padding: 20px 24px;
    border-top: 1px solid var(--gray-300);
    display: flex;
    gap: 12px;
    justify-content: flex-end;
}

.modal-footer .btn {
    flex: 0;
}

@media (max-width: 768px) {
    .container {
        padding: 40px 20px;
    }
    
    .detail-header h1 {
        font-size: 1.8em;
    }
    
    .detail-title {
        font-size: 1.5em;
    }
    
    .meta-grid {
        grid-template-columns: 1fr;
    }
    
    .button-group {
        flex-direction: column;
    }
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"/>

<div class="container">
    <div class="detail-header">
        <h1>📋 이벤트 상세보기</h1>
    </div>

    <div class="detail-card">
        <div class="detail-card-header">
            <div class="detail-title">${event.eventTitle}</div>
            <span class="detail-badge">진행 중</span>
        </div>

        <div class="detail-content">
            <!-- 이벤트 기본 정보 -->
            <div class="detail-section">
                <div class="detail-label">📝 이벤트 설명</div>
                <div class="detail-value description-box">
                    ${event.Description}
                </div>
            </div>

            <!-- 메타 정보 -->
            <div class="meta-grid">
                <div class="meta-item">
                    <div class="meta-item-label">🎫 이벤트 번호</div>
                    <div class="meta-item-value">${event.eventNo}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-item-label">✍️ 작성자</div>
                    <div class="meta-item-value">${event.eventWriter}</div>
                </div>
            </div>

            <!-- 날짜 정보 -->
            <div class="detail-section">
                <div class="detail-label">📅 이벤트 기간</div>
                <div class="meta-grid">
                    <div class="meta-item">
                        <div class="meta-item-label">시작일</div>
                        <div class="meta-item-value">${event.startDate}</div>
                    </div>
                    <div class="meta-item">
                        <div class="meta-item-label">종료일</div>
                        <div class="meta-item-value">${event.endDate}</div>
                    </div>
                </div>
            </div>

            <!-- 사용자 정보 -->
            <div class="detail-section">
                <div class="detail-label">👤 사용자 정보</div>
                <div class="meta-item">
                    <div class="meta-item-label">사용자 번호</div>
                    <div class="meta-item-value">${event.userNo}</div>
                </div>
            </div>

            <!-- 버튼 그룹 -->
            <div class="button-group">
                <a class="btn btn-secondary" href="/spring/event/inventory">← 목록으로</a>
                <button class="btn btn-primary" onclick="openUpdateModal()">✏️ 수정하기</button>
                <button class="btn btn-danger" onclick="openDeleteModal()">🗑️ 삭제하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 수정 모달 -->
<div id="updateModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>이벤트 수정</h2>
            <span class="close" onclick="closeUpdateModal()">&times;</span>
        </div>
        <div class="modal-body">
            <form id="updateForm">
                <div class="form-group">
                    <label for="eventTitle">이벤트 제목</label>
                    <input type="text" id="eventTitle" name="eventTitle" value="${event.eventTitle}" required>
                </div>
                <div class="form-group">
                    <label for="description">이벤트 설명</label>
                    <textarea id="description" name="Description" rows="5" required>${event.Description}</textarea>
                </div>
                <div class="form-group">
                    <label for="startDate">시작일</label>
                    <input type="date" id="startDate" name="startDate" value="${event.startDate}" required>
                </div>
                <div class="form-group">
                    <label for="endDate">종료일</label>
                    <input type="date" id="endDate" name="endDate" value="${event.endDate}" required>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeUpdateModal()">취소</button>
            <button class="btn btn-primary" onclick="submitUpdate()">저장하기</button>
        </div>
    </div>
</div>

<!-- 삭제 모달 -->
<div id="deleteModal" class="modal">
    <div class="modal-content modal-small">
        <div class="modal-header">
            <h2>이벤트 삭제</h2>
            <span class="close" onclick="closeDeleteModal()">&times;</span>
        </div>
        <div class="modal-body">
            <p>정말 이 이벤트를 삭제하시겠습니까?</p>
            <p style="color: var(--primary); font-weight: 600; margin-top: 12px;">${event.eventTitle}</p>
            <p style="color: var(--gray-600); font-size: 0.9em; margin-top: 8px;">삭제된 이벤트는 복구할 수 없습니다.</p>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeDeleteModal()">취소</button>
            <button class="btn btn-danger" onclick="submitDelete()">삭제하기</button>
        </div>
    </div>
</div>

<script>
// 수정 모달
function openUpdateModal() {
    document.getElementById('updateModal').classList.add('show');
}

function closeUpdateModal() {
    document.getElementById('updateModal').classList.remove('show');
}

function submitUpdate() {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/spring/event/updateEvent';
    
    const eventNo = document.createElement('input');
    eventNo.type = 'hidden';
    eventNo.name = 'eventNo';
    eventNo.value = '${event.eventNo}';
    
    const eventTitle = document.createElement('input');
    eventTitle.type = 'hidden';
    eventTitle.name = 'eventTitle';
    eventTitle.value = document.getElementById('eventTitle').value;
    
    const description = document.createElement('input');
    description.type = 'hidden';
    description.name = 'Description';
    description.value = document.getElementById('description').value;
    
    const startDate = document.createElement('input');
    startDate.type = 'hidden';
    startDate.name = 'startDate';
    startDate.value = document.getElementById('startDate').value;
    
    const endDate = document.createElement('input');
    endDate.type = 'hidden';
    endDate.name = 'endDate';
    endDate.value = document.getElementById('endDate').value;
    
    form.appendChild(eventNo);
    form.appendChild(eventTitle);
    form.appendChild(description);
    form.appendChild(startDate);
    form.appendChild(endDate);
    document.body.appendChild(form);
    form.submit();
}

// 삭제 모달
function openDeleteModal() {
    document.getElementById('deleteModal').classList.add('show');
}

function closeDeleteModal() {
    document.getElementById('deleteModal').classList.remove('show');
}

function submitDelete() {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/spring/event/deleteEvent';
    
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'eventNo';
    input.value = '${event.eventNo}';
    
    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    const updateModal = document.getElementById('updateModal');
    const deleteModal = document.getElementById('deleteModal');
    
    if (event.target == updateModal) {
        closeUpdateModal();
    }
    if (event.target == deleteModal) {
        closeDeleteModal();
    }
}
</script>

</body>
</html>