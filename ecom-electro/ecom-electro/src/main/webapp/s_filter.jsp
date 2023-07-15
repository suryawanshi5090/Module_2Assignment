<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Header file include -->
<%@include file="s_header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

</head>
<body>


	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<%
					String category=request.getParameter("category");
					List<ProductBean> list=ProductDao.getProductByCategory(category, u.getUid());
					if(category.equals("laptop")){
						%>
				<ul class="main-nav nav navbar-nav">
					<li><a href="s_index.jsp">Home</a></li>
					<li><a href="s_filter.jsp?category=laptop"><b
							style="color: red">Laptops</b></a></li>
					<li><a href="s_filter.jsp?category=smartphone">Smartphones</a></li>
					<li><a href="s_filter.jsp?category=camera">Cameras</a></li>
					<li><a href="s_filter.jsp?category=accessories">Accessories</a></li>
				</ul>
				<%
					}else if(category.equals("smartphone")){
						%>
				<ul class="main-nav nav navbar-nav">
					<li><a href="s_index.jsp">Home</a></li>
					<li><a href="s_filter.jsp?category=laptop">Laptops</a></li>
					<li><a href="s_filter.jsp?category=smartphone"><b
							style="color: red">Smartphones</b></a></li>
					<li><a href="s_filter.jsp?category=camera">Cameras</a></li>
					<li><a href="s_filter.jsp?category=accessories">Accessories</a></li>
				</ul>
				<%
					}else if(category.equals("camera")){
						%>
				<ul class="main-nav nav navbar-nav">
					<li><a href="s_index.jsp">Home</a></li>
					<li><a href="s_filter.jsp?category=laptop">Laptops</a></li>
					<li><a href="s_filter.jsp?category=smartphone">Smartphones</a></li>
					<li><a href="s_filter.jsp?category=camera"><b
							style="color: red">Cameras</b></a></li>
					<li><a href="s_filter.jsp?category=accessories">Accessories</a></li>
				</ul>
				<%
					}else {
						%>
				<ul class="main-nav nav navbar-nav">
					<li><a href="s_index.jsp">Home</a></li>
					<li><a href="s_filter.jsp?category=laptop">Laptops</a></li>
					<li><a href="s_filter.jsp?category=smartphone">Smartphones</a></li>
					<li><a href="s_filter.jsp?category=camera">Cameras</a></li>
					<li><a href="s_filter.jsp?category=accessories"><b
							style="color: red">Accessories</b></a></li>
				</ul>
				<%
					}
					%>

				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->


	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">



				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">

									<!--  Get All User Product -->
									<%
									
									for(ProductBean p:list){
										%>
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<a href="s_product.jsp?pid=<%=p.getPid()%>"><img
												src="Product_Images/<%=p.getImage() %>" alt="image"
												style="width: 100%; height: 6cm"></a>
										</div>
										<div class="product-body">
											<p class="product-category"><%=p.getCategory() %></p>
											<h3 class="product-name">
												<a href="s_product.jsp?pid=<%=p.getPid()%>"><%=p.getPname() %></a>
											</h3>
											<h4 class="product-price">
												Rs.<%=p.getPrice() %>/-
											</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>

									</div>
									<!-- /product -->
									<%
									}
									%>


								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->



	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Sign Up for the <strong>NEWSLETTER</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Subscribe
							</button>
						</form>
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->


	<!-- include file -->
	<%@include file="footer.jsp"%>
</body>
</html>
