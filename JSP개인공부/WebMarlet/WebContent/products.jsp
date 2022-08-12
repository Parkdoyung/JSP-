D<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>
<!-- 상품 클래스와 변수에 대하여 가져오기 -->
<%@ page import="dao.ProductRepository" %>

<html>
	<head>
	<link rel = "stylesheet"
		  href= "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		  <!-- 부트스트랩 링크 -->
	<link rel ="stylesheet" href="./resources/css/bootstrap.min.css" />
	
	<title>Parkdoyung목록!</title>
	
	</head>
	<body>
		<jsp:include page="menu.jsp" />
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">도영상품의 목록</h1>
			</div>
		</div>
		<%-- <%
			ArrayList<Product> listOfProducts = productDAO.getAllProducts();
		%> --%>
		<%
			ProductRepository dao = ProductRepository.getInstance();
			ArrayList<Product> listOfProducts = dao.getAllProducts();
		%>
		
		<div class="container">
			<div class="row" align="center">
				<%
					for (int i=0; i<listOfProducts.size(); i++)
					{
						
						Product product = listOfProducts.get(i);
					
				%>
				<div class="col-md-4">
					<img src="./resources/images/<%=product.getFilename() %>" 
						style="width:100%">
						
					<h3><%=product.getPname()%></h3>
					<p><%=product.getDescription()%>
					<p><%=product.getUnitPrice()%>원
					<p> <a href="./product.jsp?id=<%=product.getProductId()%>"
					class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
				</div>
			<%
				}
			%>
			</div>
			<hr>
		</div>
		<jsp:include page="footer.jsp"/>
	</body>
</html>