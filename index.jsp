<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>GalaxyBook Campus Mall</title>
  <link rel="stylesheet" href="resources/css/style.css">
  <style>
    /* 이미지 전체화면 css참고 */
    .banner-container {
      width: 100%;
      height: 75vh;        
      overflow: hidden;
    }
    .banner-container img {
      display: block;
      width: 100%;         
      height: 100%;     
      object-fit: cover;   
    }
  </style>
</head>
<body class="white-bg">
  <div class="banner-container">
    <img src="resources/images/index_banner.png" alt="GalaxyBook Campus Banner">
  </div>

  <%@ include file="footer.jsp" %>
</body>
</html>
