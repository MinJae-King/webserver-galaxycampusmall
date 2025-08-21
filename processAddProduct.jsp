<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
request.setCharacterEncoding("UTF-8");

// 이미지 저장 경로 설정
String realFolder = application.getRealPath("resources/images");
int maxSize = 5 * 1024 * 1024;
String encType = "UTF-8";

// 파일 업로드 처리
MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

// 폼 데이터 추출
String id = multi.getParameter("id");
String name = multi.getParameter("name");
String description = multi.getParameter("description");
String priceStr = multi.getParameter("price");
String imageFileName = multi.getFilesystemName("productImage");

int price = 0;
if (priceStr != null && !priceStr.isEmpty()) {
	price = Integer.parseInt(priceStr);
}

// Product 객체 생성
Product product = new Product();
product.setId(id);
product.setName(name);
product.setDescription(description);
product.setPrice(price);

product.setFilename("resources/images/" + imageFileName);

// 이 부분은 할인을 위해서 만들었던 부분인데, 기능적인 구현에서 완서하지 못함
product.setCampusDiscount(true);

// Repository에 추가
ProductRepository repo = ProductRepository.getInstance();
repo.addProduct(product);

// 등록 완료 후 상품 목록으로 이동
response.sendRedirect("productList.jsp");
%>
