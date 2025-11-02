<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 수정</title>
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

        .edit-form {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .form-group input[type="text"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            font-family: inherit;
            transition: border-color 0.2s;
        }

        .form-group input[type="text"]:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #3498db;
        }

        .form-group textarea {
            min-height: 300px;
            resize: vertical;
        }

        .form-group select {
            cursor: pointer;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            margin-right: 8px;
            cursor: pointer;
        }

        .checkbox-group label {
            margin-bottom: 0;
            cursor: pointer;
            font-weight: normal;
        }

        .button-group {
            padding: 20px 30px;
            border-top: 1px solid #e0e0e0;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .submit-button {
            padding: 12px 30px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            transition: background-color 0.2s;
        }

        .submit-button:hover {
            background-color: #2980b9;
        }

        .cancel-button {
            padding: 12px 30px;
            background-color: #95a5a6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            transition: background-color 0.2s;
        }

        .cancel-button:hover {
            background-color: #7f8c8d;
        }

        .required {
            color: #e74c3c;
            margin-left: 4px;
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
    <div class="container">
        <div class="header">
            <h1>✏️ 공지사항 수정</h1>
        </div>

        <form class="edit-form" action="${pageContext.request.contextPath}/noticeUpdate" method="post">
            <!-- 공지사항 ID (hidden) -->
            <input type="hidden" name="noticeNo" value="${notice.noticeNo}">

            <div class="form-group">
                <label>제목<span class="required">*</span></label>
                <input type="text" name="noticeTitle" value="${notice.noticeTitle}" placeholder="제목을 입력하세요" required>
            </div>

            <div class="form-group">
                <label>작성자<span class="required">*</span></label>
                <input type="text" name="userName" value="${notice.userName}" readonly>
            </div>
            <div class="form-group">
                <label>내용<span class="required">*</span></label>
                <textarea name="noticeContent" placeholder="내용을 입력하세요" required>${notice.noticeContent}</textarea>
            </div>

            <div class="button-group">
                <button type="submit" class="submit-button">수정완료</button>
                <button type="button" class="cancel-button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
    <jsp:include page="../include/footer.jsp" />
</body>
</html>