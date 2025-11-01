<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV 이벤트</title>
    <link rel="stylesheet" href="css/event-styles.css">
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
    --primary-light: #ff3d45;
    --gray-50: #fafafa;
    --gray-100: #f5f5f5;
    --gray-200: #eeeeee;
    --gray-300: #e0e0e0;
    --gray-600: #666666;
    --gray-700: #444444;
    --gray-900: #222222;
    --accent: #ffc100;
}

body {
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    background: linear-gradient(135deg, #f5f5f5 0%, #ffffff 100%);
    color: var(--gray-700);
    min-height: 100vh;
}

/* Navigation */
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
    display: flex;
    align-items: center;
    gap: 8px;
    letter-spacing: -0.5px;
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
    font-size: 0.95em;
    transition: all 0.3s;
    cursor: pointer;
    position: relative;
}

.nav-links a:hover,
.nav-links a.active {
    color: var(--primary);
}

.nav-links a.active::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    right: 0;
    height: 3px;
    background: var(--primary);
}

/* Container */
.container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 60px 40px;
}

/* Page Header */
.page-header {
    margin-bottom: 50px;
    text-align: center;
}

.page-header h1 {
    font-size: 2.8em;
    color: var(--gray-900);
    margin-bottom: 12px;
    font-weight: 900;
    letter-spacing: -0.5px;
}

.page-header p {
    color: var(--gray-600);
    font-size: 1.1em;
    font-weight: 400;
    letter-spacing: 0.3px;
}

/* List Controls */
.list-controls {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 50px;
    flex-wrap: wrap;
    gap: 20px;
}

.search-box {
    flex: 1;
    min-width: 250px;
    position: relative;
}

.search-box input {
    width: 100%;
    padding: 14px 20px;
    border: 1.5px solid var(--gray-300);
    border-radius: 8px;
    font-size: 0.95em;
    transition: all 0.3s;
    background: white;
}

.search-box input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 4px 12px rgba(229, 9, 20, 0.15);
}

.search-box input::placeholder {
    color: var(--gray-600);
}

/* Event Grid */
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
    transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    display: flex;
    flex-direction: column;
    cursor: pointer;
}

.event-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 16px 32px rgba(229, 9, 20, 0.15);
}

.event-card-header {
    background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
    color: white;
    padding: 0;
    background-size: cover;
    background-position: center;
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
    line-height: 1.4;
    letter-spacing: -0.3px;
}

.event-card-badge {
    display: inline-block;
    background: var(--primary);
    color: white;
    padding: 6px 14px;
    border-radius: 4px;
    font-size: 0.8em;
    font-weight: 700;
    letter-spacing: 0.5px;
}

.event-card-body {
    padding: 24px;
    flex: 1;
    display: flex;
    flex-direction: column;
}

.event-description {
    color: var(--gray-600);
    margin-bottom: 24px;
    line-height: 1.6;
    flex: 1;
    font-size: 0.95em;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.event-meta {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-bottom: 24px;
    font-size: 0.9em;
    color: var(--gray-600);
    padding-top: 16px;
    border-top: 1px solid var(--gray-200);
}

.meta-item {
    display: flex;
    align-items: center;
    gap: 8px;
}

.event-footer {
    display: flex;
    gap: 12px;
}

/* Buttons */
.btn {
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    font-size: 0.95em;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
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

.btn-danger {
    background: transparent;
    color: var(--primary);
    border: 1.5px solid var(--primary);
    flex: 1;
}

.btn-danger:hover {
    background: var(--primary);
    color: white;
}

.btn-edit {
    background: transparent;
    color: var(--gray-700);
    border: 1.5px solid var(--gray-300);
    flex: 1;
}

.btn-edit:hover {
    background: var(--gray-100);
    border-color: var(--gray-400);
}

.btn-small {
    padding: 10px 16px;
    font-size: 0.88em;
    flex: 1;
}

/* Pagination */
.pagination {
    display: flex;
    justify-content: center;
    gap: 8px;
    margin-top: 50px;
    flex-wrap: wrap;
}

.pagination button {
    padding: 10px 14px;
    border: 1.5px solid var(--gray-300);
    background: white;
    color: var(--gray-700);
    border-radius: 6px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s;
    font-size: 0.9em;
}

.pagination button:hover:not(:disabled) {
    border-color: var(--primary);
    color: var(--primary);
    background: var(--gray-50);
}

.pagination button.active {
    background: var(--primary);
    color: white;
    border-color: var(--primary);
}

.pagination button:disabled {
    opacity: 0.5;
    cursor: not-allowed;
}

.page-info {
    text-align: center;
    color: var(--gray-600);
    margin-top: 24px;
    font-size: 0.9em;
    font-weight: 500;
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 100px 20px;
    color: var(--gray-600);
}

.empty-icon {
    font-size: 5em;
    margin-bottom: 24px;
    opacity: 0.6;
}

.empty-state h3 {
    font-size: 1.4em;
    color: var(--gray-900);
    margin-bottom: 12px;
    font-weight: 700;
}

.empty-state p {
    font-size: 1em;
    color: var(--gray-600);
}

/* Form Styles */
.form-group {
    margin-bottom: 28px;
}

.form-group label {
    display: block;
    margin-bottom: 10px;
    font-weight: 700;
    color: var(--gray-900);
    font-size: 0.95em;
    letter-spacing: 0.3px;
}

.form-group input,
.form-group textarea {
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
.form-group textarea:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 4px 12px rgba(229, 9, 20, 0.15);
}

.form-group textarea {
    resize: vertical;
    min-height: 120px;
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

.form-actions {
    display: flex;
    gap: 12px;
    margin-top: 32px;
}

.form-group input[type="file"] {
    padding: 12px;
}

.form-group input[type="file"]::file-selector-button {
    background: var(--primary);
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-weight: 700;
    margin-right: 12px;
    transition: all 0.3s;
    letter-spacing: 0.3px;
}

.form-group input[type="file"]::file-selector-button:hover {
    background: var(--primary-dark);
}

/* Modal */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.6);
    z-index: 1000;
    align-items: center;
    justify-content: center;
    padding: 20px;
    backdrop-filter: blur(4px);
}

.modal.active {
    display: flex;
    animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.modal-content {
    background: white;
    padding: 32px;
    border-radius: 12px;
    max-width: 500px;
    width: 100%;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    max-height: 90vh;
    overflow-y: auto;
    animation: slideUp 0.3s ease;
}

@keyframes slideUp {
    from {
        transform: translateY(30px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

.modal-title {
    color: var(--gray-900);
    margin-bottom: 12px;
    font-size: 1.3em;
    font-weight: 900;
    letter-spacing: -0.5px;
}

.modal-text {
    color: var(--gray-600);
    margin-bottom: 28px;
    line-height: 1.6;
    font-size: 0.95em;
}

.modal-actions {
    display: flex;
    gap: 12px;
}

/* Status Badge */
.status-active {
    color: var(--primary);
}

.status-ended {
    color: var(--gray-600);
}

/* Responsive */
@media (max-width: 768px) {
    .nav-content {
        padding: 0 20px;
    }

    .nav-links {
        gap: 20px;
    }

    .container {
        padding: 40px 20px;
    }

    .page-header h1 {
        font-size: 2em;
    }

    .form-row {
        grid-template-columns: 1fr;
    }

    .event-grid {
        grid-template-columns: 1fr;
        gap: 20px;
    }

    .list-controls {
        flex-direction: column;
        align-items: stretch;
    }

    .search-box {
        min-width: unset;
    }

    .modal-content {
        max-width: 90%;
        padding: 24px;
    }

    .event-card-title {
        font-size: 1.1em;
    }
}
</style>
</head>
<body>
	
	<jsp:include page="../include/header.jsp"/>    
    <!-- Main Content -->
    <div class="container">
        <div class="page-header">
            <h1>🎉 이벤트 목록</h1>
            <p>현재 진행 중이거나 예정된 모든 이벤트를 확인하세요</p>
        </div>

        <div class="list-controls">
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="이벤트 제목으로 검색...">
            </div>
            <a class="btn btn-primary" href="/spring/event/form" >
                ➕ 이벤트 등록
            </a>
        </div>

        <div class="event-grid" id="eventGrid">
            <div class="empty-state">
                <div class="empty-icon">📭</div>
                <h3>이벤트가 없습니다</h3>
                <p>새로운 이벤트를 만들어보세요!</p>
            </div>
        </div>

        <div class="pagination" id="pagination"></div>
        <div class="page-info" id="pageInfo"></div>
    </div>

    <!-- Create Modal -->
    <div class="modal" id="createModal">
        <div class="modal-content">
            <div class="modal-title">✨ 이벤트 등록</div>
            <form id="eventForm" style="margin-top: 20px;">
                <div class="form-group">
                    <label for="title">이벤트 제목 *</label>
                    <input type="text" id="title" placeholder="예: 여름 시즌 특가 이벤트" required>
                </div>

                <div class="form-group">
                    <label for="description">설명 *</label>
                    <textarea id="description" placeholder="이벤트에 대한 자세한 설명을 입력하세요" required></textarea>
                </div>

                <div class="form-group">
                    <label for="image">이미지 *</label>
                    <input type="file" id="image" accept="image/*" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="startDate">시작일 *</label>
                        <input type="date" id="startDate" required>
                    </div>
                    <div class="form-group">
                        <label for="endDate">종료일 *</label>
                        <input type="date" id="endDate" required>
                    </div>
                </div>

                <div class="modal-actions" style="margin-top: 25px;">
                    <button type="button" class="btn btn-secondary" style="flex:1" onclick="closeCreateModal()">취소</button>
                    <button type="submit" class="btn btn-primary" style="flex:1">✅ 등록</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <div class="modal-title">⚠️ 이벤트 삭제</div>
            <div class="modal-text">정말로 이 이벤트를 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.</div>
            <div class="modal-actions">
                <button class="btn btn-secondary" style="flex:1" onclick="closeDeleteModal()">취소</button>
                <button class="btn btn-danger" style="flex:1" onclick="confirmDelete()">삭제</button>
            </div>
        </div>
    </div>

    <script src="js/event-script.js"></script>
</body>
</html>