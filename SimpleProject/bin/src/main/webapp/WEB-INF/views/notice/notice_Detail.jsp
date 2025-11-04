<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <!-- 제목은 서버에서 전달 예: ${notice.title} -->
                2025년 1월 정기 점검 안내
            </div>
            <div class="detail-meta">
                <span>작성일: <strong>2025.01.15</strong></span>
                <span>조회수: <strong>1,234</strong></span>
                <span>작성자: <strong>관리자</strong></span>
            </div>
        </div>

        <div class="detail-content">
            <!-- 본문 내용은 서버에서 전달 예: ${notice.content} -->
            <h3>안녕하세요. 서비스 운영팀입니다.</h3>
            <br>
            <p>보다 안정적인 서비스 제공을 위해 아래와 같이 정기 점검을 실시하고자 합니다.</p>
            <br>
            <p><strong>■ 점검 일시</strong></p>
            <p>2025년 1월 20일(월) 02:00 ~ 06:00 (4시간)</p>
            <br>
            <p><strong>■ 점검 내용</strong></p>
            <p>- 시스템 안정화 작업<br>
            - 보안 업데이트<br>
            - 서버 최적화 작업</p>
            <br>
            <p><strong>■ 점검 중 서비스 이용 제한</strong></p>
            <p>점검 시간 동안 일시적으로 서비스 이용이 불가합니다.</p>
            <br>
            <p>이용에 불편을 드려 죄송하며, 더 나은 서비스로 보답하겠습니다.</p>
            <p>감사합니다.</p>
        </div>

        <div class="button-group">
            <form action="noticeList" method="get" style="display: inline;">
                <button type="submit" class="back-button">← 목록으로</button>
            </form>
            <!-- 관리자 권한이 있을 경우에만 표시 -->
            <form action="noticeEdit.do" method="post" style="display: inline;">
                <input type="hidden" name="noticeId" value="1">
                <button type="submit" class="edit-button">수정</button>
            </form>
            <form action="noticeDelete.do" method="post" style="display: inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <input type="hidden" name="noticeId" value="1">
                <button type="submit" class="delete-button">삭제</button>
            </form>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>