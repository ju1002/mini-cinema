<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #F5F5F5;
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
            background-color: #2C3E50;
            color: white;
            padding: 30px;
            text-align: center;
        }
        .header h1 {
            font-size: 28px;
            font-weight: 600;
        }
        .write-form {
            padding: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #2C3E50;
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
            border-color: #3498DB;
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
            border-top: 1px solid #E0E0E0;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .submit-button {
            padding: 12px 30px;
            background-color: #3498DB;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            transition: background-color 0.2s;
        }
        .submit-button:hover {
            background-color: #2980B9;
        }
        .cancel-button {
            padding: 12px 30px;
            background-color: #95A5A6;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 600;
            transition: background-color 0.2s;
        }
        .cancel-button:hover {
            background-color: #7F8C8D;
        }
        .required {
            color: #E74C3C;
            margin-left: 4px;
        }
        .file-input-wrapper {
            position: relative;
            display: inline-block;
            width: 100%;
        }
        .file-input-wrapper input[type="file"] {
            position: absolute;
            left: -9999px;
        }
        .file-input-label {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ECF0F1;
            color: #2C3E50;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s;
            font-size: 14px;
        }
        .file-input-label:hover {
            background-color: #DFE6E9;
        }
        .file-name {
            display: inline-block;
            margin-left: 10px;
            color: #7F8C8D;
            font-size: 14px;
        }
        .image-preview {
            margin-top: 15px;
            max-width: 100%;
            display: none;
        }
        .image-preview img {
            max-width: 100%;
            max-height: 400px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .remove-image {
            display: inline-block;
            margin-left: 10px;
            padding: 5px 10px;
            background-color: #E74C3C;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
        }
        .remove-image:hover {
            background-color: #C0392B;
        }
    </style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
    <div class="container">
        <div class="header">
            <h1>이벤트 작성</h1>
        </div>
        <form class="write-form" action="${pageContext.request.contextPath}/eventInsert" method="post">
            <div class="form-group">
                <label>제목<span class="required">*</span></label>
                <input type="text" name="title" placeholder="제목을 입력하세요" required>
            </div>
            <div class="form-group">
                <label>작성자<span class="required">*</span></label>
                <input type="text" name="writer" value="관리자" readonly>
            </div>
            <div class="form-group checkbox-group">
                <input type="checkbox" id="isImportant" name="isImportant" value="Y">
                <label for="isImportant">중요 공지사항으로 등록</label>
            </div>
            <div class="form-group">
                <label>내용<span class="required">*</span></label>
                <textarea name="content" placeholder="내용을 입력하세요" required></textarea>
            </div>
            <div class="form-group">
                <label>이미지 첨부</label>
                <div class="file-input-wrapper">
                    <input type="file" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(event)">
                    <label for="imageFile" class="file-input-label">:클립: 파일 선택</label>
                    <span class="file-name" id="fileName">선택된 파일 없음</span>
                    <button type="button" class="remove-image" id="removeBtn" style="display: none;" onclick="removeImage()">삭제</button>
                </div>
                <div class="image-preview" id="imagePreview">
                    <img id="previewImg" src="" alt="미리보기">
                </div>
            </div>
            <div class="button-group">
                <button type="submit" class="submit-button">등록</button>
                <button type="button" class="cancel-button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
    <jsp:include page="../include/footer.jsp" />
    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            const fileName = document.getElementById('fileName');
            const preview = document.getElementById('imagePreview');
            const previewImg = document.getElementById('previewImg');
            const removeBtn = document.getElementById('removeBtn');
            if (file) {
                fileName.textContent = file.name;
                removeBtn.style.display = 'inline-block';
                const reader = new FileReader();
                reader.onload = function(e) {
                    previewImg.src = e.target.result;
                    preview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            }
        }
        function removeImage() {
            const fileInput = document.getElementById('imageFile');
            const fileName = document.getElementById('fileName');
            const preview = document.getElementById('imagePreview');
            const removeBtn = document.getElementById('removeBtn');
            fileInput.value = '';
            fileName.textContent = '선택된 파일 없음';
            preview.style.display = 'none';
            removeBtn.style.display = 'none';
        }
    </script>
</body>
</html>