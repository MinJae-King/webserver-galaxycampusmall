<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
  href="<%=request.getContextPath()%>/resources/css/board.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
  

</head>
<body class="container-fluid py-4">


  <h2 class="board-title">글쓰기</h2>

  <form action="BoardWriteAction.do" method="post">
    <div class="mb-3">
      <label class="form-label">아이디</label> <input name="id"
        class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">작성자</label> <input name="name"
        class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">제목</label> <input name="subject"
        class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">내용</label>
      <textarea name="content" rows="8" class="form-control" required></textarea>
    </div>

    <button class="btn btn-write">등록</button>
    <a class="btn-list" href="BoardListAction.do">목록</a>
  </form>

  <%@ include file="../footer.jsp"%>
</body>
</html>
