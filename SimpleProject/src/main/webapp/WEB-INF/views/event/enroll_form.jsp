<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 등록 - CGV</title>
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
    --gray-50: #fafafa;
    --gray-100: #f5f5f5;
    --gray-200: #eeeeee;
    --gray-300: #e0e0e0;
    --gray-600: #666666;
    --gray-700: #444444;
    --gray-900: #222222;
}

body {
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    background: linear-gradient(135deg, #f5f5f5 0%, #ffffff 100%);
    color: var(--gray-700);
    min-height: 100vh;
}

.nav-bar {
    background: white;
    border-bottom: 1px solid var(--gray-200);
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.nav-content {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 70px;
}

.logo {
    font-size: 1.6em;
    font-weight: 900;
    color: var(--primary);
}

.nav-links {
    display: flex;
    gap: 40px;
    list-style: none;
}

.nav-links a {
    text-decoration: none;
    color: var(--gray-700);
    font-weight: 600;
    cursor: pointer;
    transition: color 0.3s;
}

.nav-links a:hover {
    color: var(--primary);
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 60px 40px;
}

.page-header {
    margin-bottom: 50px;
}

.page-header h1 {
    font-size: 2.5em;
    color: var(--gray-900);
    margin-bottom: 12px;
    font-weight: 900;
}

.page-header p {
    color: var(--gray-600);
    font-size: 1em;
}

.form-card {
    background: white;
    border-radius: 12px;
    padding: 40px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
}

.form-group {
    margin-bottom: 32px;
}

.form-group label {
    display: block;
    margin-bottom: 12px;
    font-weight: 700;
    color: var(--gray-900);
    font-size: 0.95em;
}

.required {
    color: var(--primary);
}

.form-group input,
.form-group textarea,
.form-group select {
    width: 100%;
    padding: 14px 16px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px;
    font-size: 0.95em;
    font-family: inherit;
    transition: all 0.3s;
    background: white;
}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 4px 12px rgba(229, 9, 20, 0.15);
}

.form-group textarea {
    resize: vertical;
    min-height: 150px;
}

.form-help {
    font-size: 0.85em;
    color: var(--gray-600);
    margin-top: 6px;
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}



.btn {
    padding: 14px 32px;
    border: none;
    border-radius: 8px;
    font-size: 0.95em;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    flex: 1;
    letter-spacing: 0.3px;
}

.btn-primary {
    background: var(--primary);
    color: white;
}

.btn-primary:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 8px 16px rgba(229, 9, 20, 0.3);
}

.btn-primary:active {
    transform: translateY(0);
}

.btn-secondary {
    background: var(--gray-200);
    color: var(--gray-700);
    border: 1.5px solid var(--gray-300);
}

.btn-secondary:hover {
    background: var(--gray-100);
    border-color: var(--gray-400);
}

.btn:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}

.alert {
    padding: 16px 20px;
    border-radius: 8px;
    margin-bottom: 20px;
    display: none;
    animation: slideDown 0.3s ease;
}

@keyframes slideDown {
    from {
        transform: translateY(-20px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

.alert.show {
    display: block;
}

.alert-success {
    background: rgba(76, 175, 80, 0.1);
    color: #4caf50;
    border-left: 4px solid #4caf50;
}

.alert-error {
    background: rgba(229, 9, 20, 0.1);
    color: var(--primary);
    border-left: 4px solid var(--primary);
}

@media (max-width: 768px) {
    .container {
        padding: 40px 20px;
    }

    .page-header h1 {
        font-size: 1.8em;
    }

    .form-card {
        padding: 24px;
    }

    .form-row {
        grid-template-columns: 1fr;
    }

    .form-actions {
        flex-direction: column;
    }

    .nav-content {
        padding: 0 20px;
    }

    .nav-links {
        gap: 20px;
    }
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"/>

<div class="container">
    <div class="page-header">
        <h1>새 이벤트 등록</h1>
        <p>새로운 이벤트를 만들고 고객과 소통하세요</p>
    </div>

    <div class="form-card">
        <div id="alertBox"></div>

       <form id="eventForm" action="${pageContext.request.contextPath}/event/insert" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="title">이벤트 제목 <span class="required">*</span></label>
        <input type="text" id="title" name="eventTitle" placeholder="예: 여름 시즌 특가 이벤트" required>
    </div>

    <div class="form-group">
        <label for="description">이벤트 설명 <span class="required">*</span></label>
        <textarea id="description" name="description" placeholder="이벤트에 대한 자세한 설명을 입력하세요" required></textarea>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label for="startDate" >시작일 <span class="required">*</span></label>
            <input type="date" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate" >종료일 <span class="required">*</span></label>
            
            <input type="date" id="endDate" name="endDate" required>
        </div>
    </div>

    <div class="form-group">
        <label for="category">카테고리</label>
        <select id="category" name="category">
            <option value="">카테고리 선택</option>
            <option value="movie">영화</option>
            <option value="snack">스낵/음료</option>
            <option value="membership">멤버십</option>
            <option value="promotion">프로모션</option>
            <option value="other">기타</option>
        </select>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn btn-primary">이벤트 등록</button>
    </div>
</form>
    </div>
</div>

<script>

const eventForm = document.getElementById('eventForm');





/*
eventForm.addEventListener('submit', (e) => {
    e.preventDefault();
    submitForm();
});
*/
async function submitForm() {
    const title = document.getElementById('title').value.trim();
    const description = document.getElementById('description').value.trim();
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
   
    if (!title) {
        showAlert('이벤트 제목을 입력하세요.', 'error');
        return;
    }

    if (!description) {
        showAlert('이벤트 설명을 입력하세요.', 'error');
        return;
    }

    if (!startDate || !endDate) {
        showAlert('시작일과 종료일을 선택하세요.', 'error');
        return;
    }

    if (new Date(startDate) > new Date(endDate)) {
        showAlert('시작일이 종료일보다 클 수 없습니다.', 'error');
        return;
    }

  
    const formData = new FormData();
    formData.append('eventTitle', title);
    formData.append('description', description);
    formData.append('startDate', startDate);
    formData.append('endDate', endDate);
    formData.append('category', document.getElementById('category').value);
   

    try {
        const response = await fetch('${pageContext.request.contextPath}/event/insert', {
            method: 'POST',
            body: formData
        });

        if (response.ok) {
            showAlert('이벤트가 성공적으로 등록되었습니다!', 'success');
            setTimeout(() => {
                window.location.href = '${pageContext.request.contextPath}/event/insert';
            }, 1500);
        } else {
            showAlert('이벤트 등록에 실패했습니다.', 'error');
        }
    } catch (error) {
        console.error('Error:', error);
        showAlert('서버 오류가 발생했습니다.', 'error');
    }
}

function cancelForm() {
    if (confirm('작성 중인 내용이 사라집니다. 계속하시겠습니까?')) {
        window.history.back();
    }
}

function showAlert(message, type) {
    const alertBox = document.getElementById('alertBox');
    alertBox.innerHTML = '<div class="alert alert-' + type + ' show">' + message + '</div>';

    if (type === 'success') {
        setTimeout(() => {
            alertBox.innerHTML = '';
        }, 3000);
    }
}

const today = new Date().toISOString().split('T')[0];
document.getElementById('startDate').min = today;
document.getElementById('endDate').min = today;
</script>

</body>
</html>