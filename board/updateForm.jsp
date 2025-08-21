<%@ page import="mvc.model.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>글 수정</title>
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/css/board.css">
  <link rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/css/style.css">
</head>
<body class="container-fluid py-4">

  <%
    BoardDTO b = (BoardDTO) request.getAttribute("board");
  %>

  <h2 class="board-title">글 수정</h2>

  <form action="BoardUpdateAction.do" method="post">
    <input type="hidden" name="num" value="<%=b.getNum()%>">

    <div class="mb-3">
      <label class="form-label">작성자</label>
      <input name="name" class="form-control" value="<%=b.getName()%>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">제목</label>
      <input name="subject" class="form-control" value="<%=b.getSubject()%>" required>
    </div>

    <div class="mb-3">
      <label class="form-label">내용</label>
      <textarea name="content" rows="8" class="form-control" required><%=b.getContent()%></textarea>
    </div>

    <button class="btn btn-write">수정 완료</button>
    <a class="btn btn-cancel" href="BoardViewAction.do?num=<%=b.getNum()%>">취소</a>
  </form>

  <%@ include file="../footer.jsp"%>
</body>
</html>
 