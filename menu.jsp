<%@ page language="java" pageEncoding="UTF-8"%>

<div class="top-nav">
  <div class="logo">
    <a href="index.jsp">GalaxyBook Campus Mall</a>
  </div>

  <div class="user-actions">
    <a href="products.jsp">제품 목록</a> <a href="BoardListAction.do">자유게시판</a>
    <a href="serviceCenters.jsp">AS 가능 지점</a>
  </div>

  <div class="nav-icons">

    <div class="search-box">
      <input type="text" placeholder="검색" />
      <button>🔍</button>
    </div>

    <div class="cart-text">
      <a href="cart.jsp">장바구니</a>
    </div>

    <%
    // menu.jsp에서 사용하는 session부분
    String loginName = (String) session.getAttribute("loginUserName");
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    %>

    <div class="user-actions">
      <%
      if (loginName == null) {
      %>
      <!-- 로그인 전 -->
      <a href="login.jsp">로그인</a> <a href="join.jsp">회원가입</a>
      <%
      } else if (Boolean.TRUE.equals(isAdmin)) {
      %>
      <!-- 관리자 로그인 상태 -->
      <a href="adminMain.jsp"><strong>관리자 페이지</strong></a>
      <form action="logout.jsp" method="post" style="display: inline;">
        <button type="submit">로그아웃</button>
      </form>
      <%
      } else {
      %>
      <!-- 일반 사용자 로그인 상태 -->
      <!-- 일반 사용자 로그인 상태 -->
      <div class="user-info">
        <div>
          <strong><%=loginName%></strong>님 환영합니다.
        </div>
        <div>
          <a href="editUser.jsp">회원정보 수정</a>
        </div>
      </div>
      <form action="logout.jsp" method="post" style="display: inline;">
        <button type="submit">로그아웃</button>
      </form>
      <%
      }
      %>
    </div>

  </div>
</div>
