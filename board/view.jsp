<%@ page import="mvc.model.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>글 보기</title>
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/board.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
  

</head>
<body class="container-fluid py-4">


  <%
  BoardDTO b = (BoardDTO) request.getAttribute("board");
  %>

  <h2 class="board-title">글 상세 보기</h2>

  <table class="board-table">
    <tr>
      <th style="width: 15%">번호</th>
      <td><%=b.getNum()%></td>
    </tr>
    <tr>
      <th>제목</th>
      <td><%=b.getSubject()%></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td><%=b.getName()%></td>
    </tr>
    <tr>
      <th>아이디</th>
      <td><%=b.getId()%></td>
    </tr>
    <tr>
      <th>날짜</th>
      <td><%=b.getRegist_day()%></td>
    </tr>
    <tr>
      <th>조회</th>
      <td><%=b.getHit()%></td>
    </tr>
    <tr>
      <th>내용</th>
      <td style="height: 250px; white-space: pre-wrap;"><%=b.getContent()%></td>
    </tr>
  </table>

  <a class="btn-list" href="BoardListAction.do">목록</a>
  <a class="btn-edit" href="BoardUpdateForm.do?num=<%=b.getNum()%>">수정</a>
  <a class="btn-delete" href="BoardDeleteAction.do?num=<%=b.getNum()%>"
    onclick="return confirm('삭제하시겠습니까?');">삭제</a>

  <%@ include file="../footer.jsp"%>
</body>
</html>
