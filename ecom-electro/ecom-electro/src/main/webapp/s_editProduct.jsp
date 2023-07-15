<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header Fille include -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Seller Edit Product</title>
</head>
<body>




	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Edit Product</h3>
					<ul class="breadcrumb-tree">
						<li><a href="s_index.jsp">Home</a></li>
						<li class="active">Edit Product</li>
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
					<!-- Edit Product Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Edit Product</h3>
						</div>
						<%
							if(request.getAttribute("msg")!=null){
								%>
						<span><b style="color: green; padding-left: 30px"><%=request.getAttribute("msg") %></b></span>
						<%
							}
							%>
						<%
							int pid=Integer.parseInt(request.getParameter("pid"));
							ProductBean p=ProductDao.getProductById(pid);
							%>
						<form action="ProductController" name="editProduct" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="uid" value="<%=u.getUid()%>">
							<input type="hidden" name="pid" value="<%=p.getPid()%>">
							<div class="form-group">
								<label><b>Product Category :</b></label>&nbsp;&nbsp;
								<%
							if(p.getCategory().equals("laptop")){
								%>
								<input type="radio" name="category" value="laptop"
									checked="checked">&nbsp;Laptops&nbsp;&nbsp; <input
									type="radio" name="category" value="smartphone">&nbsp;Smartphones&nbsp;&nbsp;
								<input type="radio" name="category" value="camera">&nbsp;Cameras&nbsp;&nbsp;
								<input type="radio" name="category" value="accessories">&nbsp;Accessories&nbsp;&nbsp;
								<%
							}else if(p.getCategory().equals("smartphone")){
								%>
								<input type="radio" name="category" value="laptop">&nbsp;Laptops&nbsp;&nbsp;
								<input type="radio" name="category" value="smartphone"
									checked="checked">&nbsp;Smartphones&nbsp;&nbsp; <input
									type="radio" name="category" value="camera">&nbsp;Cameras&nbsp;&nbsp;
								<input type="radio" name="category" value="accessories">&nbsp;Accessories&nbsp;&nbsp;
								<%
							}else if(p.getCategory().equals("camera")){
								%>
								<input type="radio" name="category" value="laptop">&nbsp;Laptops&nbsp;&nbsp;
								<input type="radio" name="category" value="smartphone">&nbsp;Smartphones&nbsp;&nbsp;
								<input type="radio" name="category" value="camera"
									checked="checked">&nbsp;Cameras&nbsp;&nbsp; <input
									type="radio" name="category" value="accessories">&nbsp;Accessories&nbsp;&nbsp;
								<%
							}else if(p.getCategory().equals("accessories")){
								%>
								<input type="radio" name="category" value="laptop">&nbsp;Laptops&nbsp;&nbsp;
								<input type="radio" name="category" value="smartphone">&nbsp;Smartphones&nbsp;&nbsp;
								<input type="radio" name="category" value="camera">&nbsp;Cameras&nbsp;&nbsp;
								<input type="radio" name="category" value="accessories"
									checked="checked">&nbsp;Accessories&nbsp;&nbsp;
								<%
							}else{
								%>
								<input type="radio" name="category" value="laptop">&nbsp;Laptops&nbsp;&nbsp;
								<input type="radio" name="category" value="smartphone">&nbsp;Smartphones&nbsp;&nbsp;
								<input type="radio" name="category" value="camera">&nbsp;Cameras&nbsp;&nbsp;
								<input type="radio" name="category" value="accessories">&nbsp;Accessories&nbsp;&nbsp;
								<%
							}
							%>
							</div>
							<div class="form-group">
								<input class="input" type="text" name="pname"
									placeholder="Product Name" required="required"
									value="<%=p.getPname()%>">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="pbrand"
									placeholder="Product Brand Name" required="required"
									value="<%=p.getPbrand()%>">
							</div>

							<div class="form-group">
								<input class="input" type="number" name="price"
									placeholder="Product Price" required="required"
									value="<%=p.getPrice()%>">
							</div>
							<div class="form-group">
								<input class="input" type="number" name="punit"
									placeholder="Product Qty" required="required"
									value="<%=p.getPunit()%>">
							</div>
							<div class="form-group">

								<textarea rows="4" cols="10" placeholder="Product Discription"
									required="required" class="input" name="pdisc"><%=p.getPdisc() %></textarea>
							</div>
							<div class="form-group">
								<input class="btn btn-danger" type="submit" name="action"
									value="Update Product">
							</div>
						</form>
					</div>
					<!-- /Edit Product Details -->
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