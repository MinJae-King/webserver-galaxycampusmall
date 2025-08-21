<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<html>
<head>
<title>상품 상세 정보</title>
<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/style.css">
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%
String id = request.getParameter("id");
ProductRepository repo = ProductRepository.getInstance(); 
Product product = repo.getProductById(id);
%>

<%
if (product != null) {
%>
<script>
    const modelName = "<%=product.getId()%>";
    const basePrice = <%=product.getPrice()%>;

    function updateImages(color) {
        const carouselInner = document.querySelector('.carousel-inner');
        if (!carouselInner) return;
        carouselInner.innerHTML = '';

        let imageCount = 6;
        if (modelName === "GalaxyBook_Pro5_H") {
            imageCount = 5;
        }

        for (let i = 1; i <= imageCount; i++) {
            let imgPath;
            if (modelName === "GalaxyBook_Pro5_H") {
                imgPath = "<%=request.getContextPath()%>/resources/images/" + modelName + "_" + i + ".jpg";
            } else {
                imgPath = "<%=request.getContextPath()%>/resources/images/" + modelName + "_" + color + "_" + i + ".jpg";
            }

            const item = document.createElement('div');
            item.className = 'carousel-item' + (i === 1 ? ' active' : '');
            item.innerHTML = '<img src="' + imgPath + '" class="d-block w-100 product-detail-image" alt="Product Image ' + i + '">';
            carouselInner.appendChild(item);
        }
    }

    function updateTotalPrice() {
        let price = basePrice;

        const os = document.querySelector("input[name='os']:checked").value;
        const cpu = document.querySelector("input[name='cpu']:checked").value;
        const ram = document.querySelector("select[name='ram']").value;
        const ssd = document.querySelector("select[name='ssd']").value;
        const size = document.querySelector("select[name='size']").value;
        const quantity = parseInt(document.querySelector("input[name='quantity']").value) || 1;

        if (os === "Windows 11 Home") price += 189000;
        if (cpu === "Ultra 7") price += 200000;
        if (ram === "32GB") price += 50000;
        if (ssd === "1TB") price += 100000;
        if (size == "40.6cm") price += 300000;

        const total = price * quantity;
        document.getElementById("priceDisplay").innerText = total.toLocaleString() + "원";
    }

    document.addEventListener("DOMContentLoaded", function () {
        updateImages('gray');
        updateTotalPrice();

        document.querySelectorAll("input[name='color']").forEach(btn => btn.addEventListener("change", () => updateImages(btn.value)));
        document.querySelectorAll("input[name='os']").forEach(btn => btn.addEventListener("change", updateTotalPrice));
        document.querySelectorAll("input[name='cpu']").forEach(btn => btn.addEventListener("change", updateTotalPrice));
        document.querySelector("select[name='ram']").addEventListener("change", updateTotalPrice);
        document.querySelector("select[name='ssd']").addEventListener("change", updateTotalPrice);
        document.querySelector("select[name='size']").addEventListener("change", updateTotalPrice);

        document.querySelector("input[name='quantity']").addEventListener("input", updateTotalPrice);
    });
</script>
<%
}
%>
</head>

<body>
  <div class="container-fluid py-4">
    <%@ include file="menu.jsp"%>

    <%
    if (product == null) {
    %>
    <div class="alert alert-danger mt-5">
      <h4>❗ 상품 정보를 찾을 수 없습니다.</h4>
      <a href="products.jsp" class="btn btn-secondary">← 상품 목록으로
        돌아가기</a>
    </div>
    <%
    } else {
    %>

    <div class="row align-items-md-stretch mt-5">
      <div class="col-md-6">
        <div id="productCarousel" class="carousel slide"
          data-bs-ride="carousel">
          <div class="carousel-inner"></div>
          <button class="carousel-control-prev" type="button"
            data-bs-target="#productCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button"
            data-bs-target="#productCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
          </button>
        </div>
      </div>

      <div class="col-md-6">
        <form action="order.jsp" method="post">
          <input type="hidden" name="productId"
            value="<%=product.getId()%>">

          <h3>
            <b><%=product.getName()%></b>
          </h3>
          <p><%=product.getDescription()%></p>
          <p>
            <b>상품 코드:</b>
            <%=product.getId()%></p>
          <p>
            <b>캔퍼스 할인:</b>
            <%=product.isCampusDiscount() ? "적용 가능 🎓" : "미적용"%></p>
          <h4 id="priceDisplay"></h4>

          <div class="mb-3 mt-4">
            <label class="form-label">OS(운영체제)</label><br>
            <div class="btn-group" role="group">
              <input type="radio" class="btn-check" name="os" id="os1"
                value="Windows 11 Home" checked> <label
                class="btn btn-outline-primary" for="os1">Windows
                11 Home</label> <input type="radio" class="btn-check" name="os"
                id="os2" value="Windows 11 미포함"> <label
                class="btn btn-outline-primary" for="os2">Windows
                OS 미포함</label>
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label">모델</label> <input type="text"
              class="form-control" readonly
              value="<%="GalaxyBook_Pro5_H".equals(product.getId()) ? "갤럭시5 Pro H"
		: "GalaxyBook_Pro5_360".equals(product.getId()) ? "갤럭시5 Pro 360"
				: "GalaxyBook_Pro5".equals(product.getId()) ? "갤럭시5 Pro" : "알 수 없음"%>" />
            <input type="hidden" name="model"
              value="<%="GalaxyBook_Pro5_H".equals(product.getId()) ? "갤럭시5 Pro H"
		: "GalaxyBook_Pro5_360".equals(product.getId()) ? "갤럭시5 Pro 360"
				: "GalaxyBook_Pro5".equals(product.getId()) ? "갤럭시5 Pro" : "알 수 없음"%>" />
          </div>

          <div class="mb-3">
            <label class="form-label">CPU</label><br>
            <div class="btn-group" role="group">
              <input type="radio" class="btn-check" name="cpu" id="cpu1"
                value="Ultra 5" checked> <label
                class="btn btn-outline-primary" for="cpu1">Ultra
                5</label> <input type="radio" class="btn-check" name="cpu"
                id="cpu2" value="Ultra 7"> <label
                class="btn btn-outline-primary" for="cpu2">Ultra
                7</label>
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label">RAM</label> <select
              class="form-select" name="ram">
              <option>16GB</option>
              <option>32GB</option>
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label">SSD</label> <select
              class="form-select" name="ssd">
              <option>512GB</option>
              <option>1TB</option>
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label">색상</label><br>
            <div class="btn-group" role="group">
              <%
              if ("GalaxyBook_Pro5_H".equals(product.getId())) {
              %>
              <input type="radio" class="btn-check" name="color"
                id="colorGray" value="gray" checked> <label
                class="btn btn-outline-secondary" for="colorGray">그레이</label>
              <%
              } else {
              %>
              <input type="radio" class="btn-check" name="color"
                id="colorGray" value="gray" checked> <label
                class="btn btn-outline-secondary" for="colorGray">그레이</label>
              <input type="radio" class="btn-check" name="color"
                id="colorSilver" value="silver"> <label
                class="btn btn-outline-secondary" for="colorSilver">실버</label>
              <%
              }
              %>
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label">크기</label> <select
              class="form-select" name="size">
              <option>35.6cm</option>
              <option>40.6cm</option>
            </select>
          </div>

          <div class="mb-3">
            <label class="form-label">수량</label> <input type="number"
              name="quantity" value="1" min="1" class="form-control"
              style="width: 100px;">
          </div>

          <div class="d-flex gap-2 mt-4">
            <button type="submit" formaction="shippingInfo.jsp" class="btn btn-primary">주문하기</button>
            <button type="submit" formaction="addToCart.jsp"
              class="btn btn-outline-success">장바구니</button>
            <a href="products.jsp" class="btn btn-secondary">목록으로</a>
          </div>
        </form>
      </div>
    </div>
    <%
    }
    %>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>