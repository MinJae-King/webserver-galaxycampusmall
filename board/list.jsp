<%@ page import="java.util.*, mvc.model.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 목록</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/board.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">


</head>
<body class="container-fluid py-4">


  <h2 class="board-title">게시판 목록</h2>
  <a class="btn-write mb-3" href="BoardWriteForm.do">글쓰기</a>

  <table class="board-table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
        <th>조회</th>
      </tr>
    </thead>
    <tbody>
      <%
      List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
      if (boardList != null && !boardList.isEmpty()) {
      	for (BoardDTO b : boardList) {
      %>
      <tr>
        <td><%=b.getNum()%></td>
        <td><a href="BoardViewAction.do?num=<%=b.getNum()%>"><%=b.getSubject()%></a></td>
        <td><%=b.getName()%></td>
        <td><%=b.getRegist_day()%></td>
        <td><%=b.getHit()%></td>
      </tr>
      <%
      }
      } else {
      %>
      <tr>
        <td colspan="5" class="text-center">등록된 글이 없습니다.</td>
      </tr>
      <%
      }
      %>
    </tbody>
  </table>

  <%@ include file="../footer.jsp"%>
</body>
</html>
