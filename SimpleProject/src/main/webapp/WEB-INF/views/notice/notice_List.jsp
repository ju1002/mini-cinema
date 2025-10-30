<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            padding: 20px 30px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .notice-item:hover {
            background-color: #f8f9fa;
        }

        .notice-item:last-child {
            border-bottom: none;
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
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
    <div class="container">
        <div class="header">
            <h1>📢 공지사항</h1>
        </div>

        <div class="notice-list">
            <!-- 공지사항 항목 예시 - JSTL로 반복 처리 -->
            <div class="notice-item">
                <div class="notice-title">
                    <span class="notice-badge">중요</span>
                    2025년 1월 정기 점검 안내
                </div>
                <div class="notice-meta">
                    <span>📅 2025.01.15</span>
                    <span>👁 1,234</span>
                </div>
            </div>

            <div class="notice-item">
                <div class="notice-title">
                    서비스 이용약관 변경 안내
                </div>
                <div class="notice-meta">
                    <span>📅 2025.01.10</span>
                    <span>👁 856</span>
                </div>
            </div>

            <div class="notice-item">
                <div class="notice-title">
                    <span class="notice-badge">중요</span>
                    개인정보 처리방침 개정 안내
                </div>
                <div class="notice-meta">
                    <span>📅 2025.01.05</span>
                    <span>👁 2,103</span>
                </div>
            </div>

            <div class="notice-item">
                <div class="notice-title">
                    신규 기능 업데이트 안내
                </div>
                <div class="notice-meta">
                    <span>📅 2024.12.28</span>
                    <span>👁 1,456</span>
                </div>
            </div>

            <div class="notice-item">
                <div class="notice-title">
                    연말연시 고객센터 운영 안내
                </div>
                <div class="notice-meta">
                    <span>📅 2024.12.20</span>
                    <span>👁 678</span>
                </div>
            </div>

            <!-- 페이징 -->
            <div class="pagination">
                <button class="active">1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
            </div>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>