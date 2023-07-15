<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Seller Add Product</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Add Product</h3>
					<ul class="breadcrumb-tree">
						<li><a href="s_index.jsp">Home</a></li>
						<li class="active">Add Product</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-7">
					<!-- Add Product Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Add Product</h3>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: green; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<form action="ProductController" name="AddProduct" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="uid" value="<%=u.getUid()%>">
							<div class="form-group">
								<label><b>Product Category :</b></label>&nbsp;&nbsp; <input
									type="radio" name="category" value="laptop">&nbsp;Laptops&nbsp;&nbsp;
								<input type="radio" name="category" value="smartphone">&nbsp;Smartphones&nbsp;&nbsp;
								<input type="radio" name="category" value="camera">&nbsp;Cameras&nbsp;&nbsp;
								<input type="radio" name="category" value="accessories">&nbsp;Accessories&nbsp;&nbsp;
							</div>
							<div class="form-group">
								<input class="input" type="text" name="pname"
									placeholder="Product Name" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="pbrand"
									placeholder="Product Brand Name" required="required">
							</div>
							<div class="form-group">
								<label><b>Product image :</b></label>&nbsp;&nbsp; <br> <input
									type="file" name="image" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="number" name="price"
									placeholder="Product Price" required="required">
							</div>
							<div class="form-group">
								<input class="input" type="number" name="punit"
									placeholder="Product Unit" required="required">
							</div>
							<div class="form-group">
								<textarea rows="4" cols="10" placeholder="Product Discription"
									required="required" class="input" name="pdisc"></textarea>
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Add Product">
							</div>
						</form>
					</div>
					<!-- /Registration Details -->
				</div>


			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- include file footer -->
	<%@include file="footer.jsp"%>


</body>
</html>