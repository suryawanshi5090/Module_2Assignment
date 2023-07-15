<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Seller header -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro View Product</title>
</head>
<body>
	<div>
		<br> <br>
		<header
			style="background-color: rgba(50, 115, 220, 0.3); padding: 10px; text-align: center;">
			<h2>Seller Product List</h2>
		</header>
		<br> <br>
		<!-- seller Product view list -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">S.no</th>
					<th scope="col">Product Category</th>
					<th scope="col">Product Brand</th>
					<th scope="col">Product Name</th>
					<th scope="col">Product Price</th>
					<th scope="col">Product Unit</th>
					<th scope="col">Product Description</th>
					<th scope="col">Product image</th>
					<th scope="col">Edit Product</th>
					<th scope="col">Delete Product</th>
				</tr>
			</thead>
			<tbody>

				<!-- get All seller Product list -->
				<%
int i=1;
List<ProductBean> list=ProductDao.getUserProduct(u.getUid());
for(ProductBean p:list){
	%>
				<tr>
					<th scope="row"><%=i++ %></th>
					<td><%=p.getCategory() %></td>
					<td><%=p.getPbrand() %></td>
					<td><%=p.getPname() %></td>
					<td><%=p.getPrice() %></td>
					<td><%=p.getPunit() %></td>
					<td><%=p.getPdisc()%></td>
					<td><a href="s_product.jsp?pid=<%=p.getPid()%>"><img
							alt="Product Image" src="Product_Images/<%=p.getImage()%>"
							style="width: 100px"></a></td>
					<td><a href="s_editProduct.jsp?pid=<%=p.getPid()%>"> <input
							type="submit" value="Edit Product" name="action"
							class="btn btn-primary"></a></td>
					<td><a href="s_editProduct.jsp?pid=<%=p.getPid()%>"> <input
							type="submit" value="Delete Product" name="action"
							class="btn btn-danger"></a></td>
				</tr>
				<%
}
%>
			</tbody>
		</table>
		<br> <br> <br>
		<br> <br>
		<br> <br> <br> <a href="s_index.jsp"><input
			type="submit" class="btn btn-secondary btn-lg btn-block"
			name="action" value="Back To Home" style="background-color: #ab9191"></a>


		<br>
		<br> <br>
		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
							<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
						</ul>
						<span class="copyright"> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>document.write(new Date().getFullYear());</script>
							All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</span>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->

		<!-- /FOOTER -->

	</div>
</body>
</html>