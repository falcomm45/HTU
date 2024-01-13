<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>안면인식 로그인</title>
    <script defer src="/resources/js/face-api.min.js"></script>
    <script defer src="/resources/js/customFace.js"></script>
    <link rel="stylesheet" href="/resources/css/face.css">
</head>
<body>
    <video id="video" width="800" height="600" autoplay></video>
    <input type="hidden" id="jsonUserVO" value='${jsonUserVO}'>
</body>
</html>