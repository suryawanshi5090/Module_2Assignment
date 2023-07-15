<%@page import="com.Dao.cartDao"%>
<%@page import="com.Dao.WishListDao"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Header file include -->
<%@include file="header.jsp"%>
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
				<ul class="main-nav nav navbar-nav">
					<li><a href="index.jsp" style="color: red"><b>Home</b></a></li>
					<li><a href="filter.jsp?category=laptop">Laptops</a></li>
					<li><a href="filter.jsp?category=smartphone">Smartphones</a></li>
					<li><a href="filter.jsp?category=camera">Cameras</a></li>
					<li><a href="filter.jsp?category=accessories">Accessories</a></li>
				</ul>
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
				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./img/shop01.png" alt="">
						</div>
						<div class="shop-body">
							<a href="filter.jsp?category=laptop">
								<h3>
									Laptop<br>Collection
								</h3>
							</a> <a href="filter.jsp?category=laptop" class="cta-btn">Shop
								now <i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./img/shop03.png" alt="">
						</div>
						<div class="shop-body">
							<a href="filter.jsp?category=accessories">
								<h3>
									Accessories<br>Collection
								</h3>
							</a> <a href="filter.jsp?category=accessories" class="cta-btn">Shop
								now <i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./img/shop02.png" alt="">
						</div>
						<div class="shop-body">
							<a href="filter.jsp?category=camera">
								<h3>
									Cameras<br>Collection
								</h3>
							</a> <a href="filter.jsp?category=camera" class="cta-btn">Shop
								now <i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /shop -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

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

									<%
List<ProductBean> list=ProductDao.getAllProduct();
for(ProductBean p:list){
%>

									<!-- product -->
									<div class="product" style="height: 100%">
										<div class="product-img">
											<a href="product.jsp?pid=<%=p.getPid()%>"> <img
												src="Product_Images/<%=p.getImage() %>" alt="Image"
												style="width: 100%; height: 6cm"></a>
										</div>
										<div class="product-body">
											<p class="product-category"><%=p.getCategory() %></p>
											<h3 class="product-name">
												<a href="product.jsp?pid=<%=p.getPid()%>"><%=p.getPname() %></a>
											</h3>
											<h4 class="product-price">
												Rs.<%=p.getPrice() %></h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<%
												if(session!=null){
													if(session.getAttribute("user")!=null){
														boolean ch=WishListDao.checkWishList(p.getPid(), u.getUid());
														if(ch==true){
															%>
												<a class="fa fa-heart"
													href="removeToWishList.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"
													style="margin: 10px"></a> <a class="fa fa-exchange"
													style="margin: 10px"></a> <a class="fa fa-eye"
													href="product.jsp?pid=<%=p.getPid()%>" style="margin: 10px"></a>
												<%
															}else{
																%>
												<a class="fa fa-heart-o"
													href="addToWishList.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"
													style="margin: 10px"></a> <a class="fa fa-exchange"
													style="margin: 10px"></a> <a class="fa fa-eye"
													href="product.jsp?pid=<%=p.getPid()%>" style="margin: 10px"></a>
												<%
															}
													}else{
														%>
												<a class="fa fa-sign-in" href="login.jsp"
													style="margin: 10px"></a> <a class="fa fa-exchange"
													style="margin: 10px"></a> <a class="fa fa-eye"
													href="product.jsp?pid=<%=p.getPid()%>" style="margin: 10px"></a>
												<%
													}
												}
												%>
											</div>
										</div>
										<%
											if(session!=null){
												if(session.getAttribute("user")!=null){
													boolean ch=cartDao.checkCart(p.getPid(), u.getUid());
													if(ch==true){
														%>
										<div class="add-to-cart">
											<a href="viewcart.jsp"><input type="submit"
												value="Go To Cart" class="add-to-cart-btn"></a>
										</div>
										<%
													}else{
														%>
										<div class="add-to-cart">
											<a
												href="addToCart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"><input
												type="submit" value="Add To Cart" class="add-to-cart-btn"></a>
										</div>
										<%
													}
												}else{
													%>
										<div class="add-to-cart">
											<a href="login.jsp"><input type="submit" value="Login"
												class="add-to-cart-btn"></a>
										</div>
										<%
											}
												}else{
													%>
										<div class="add-to-cart">
											<a href="login.jsp"><input type="submit" value="Login"
												class="add-to-cart-btn"></a>
										</div>
										<%
											}
											%>

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
	<hr>

	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
								<div>
									<h3>02</h3>
									<span>Days</span>
								</div>
							</li>
							<li>
								<div>
									<h3>10</h3>
									<span>Hours</span>
								</div>
							</li>
							<li>
								<div>
									<h3>34</h3>
									<span>Mins</span>
								</div>
							</li>
							<li>
								<div>
									<h3>60</h3>
									<span>Secs</span>
								</div>
							</li>
						</ul>
						<h2 class="text-uppercase">hot deal this week</h2>
						<p>New Collection Up to 50% OFF</p>
						<a class="primary-btn cta-btn" href="#">Shop now</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->

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
							<div id="tab2" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<%			
							for(ProductBean p:list){
%>
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<a href="product.jsp?pid=<%=p.getPid()%>"> <img
												src="Product_Images/<%=p.getImage() %>" alt="Image"
												style="width: 100%; height: 6cm"></a>
										</div>
										<div class="product-body">
											<p class="product-category"><%=p.getCategory() %></p>
											<h3 class="product-name">
												<a href="product.jsp?pid=<%=p.getPid()%>"><%=p.getPname() %></a>
											</h3>
											<h4 class="product-price">
												Rs.<%=p.getPrice() %></h4>
											<div class="product-rating">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<%
												if(session!=null){
													if(session.getAttribute("user")!=null){
														boolean ch=WishListDao.checkWishList(p.getPid(), u.getUid());
														if(ch==true){
															%>
												<a class="fa fa-heart"
													href="removeToWishList.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"
													style="margin: 10px"></a> <a class="fa fa-exchange"
													style="margin: 10px"></a> <a class="fa fa-eye"
													href="product.jsp?pid=<%=p.getPid()%>" style="margin: 10px"></a>
												<%
															}else{
																%>
												<a class="fa fa-heart-o"
													href="addToWishList.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"
													style="margin: 10px"></a> <a class="fa fa-exchange"
													style="margin: 10px"></a> <a class="fa fa-eye"
													href="product.jsp?pid=<%=p.getPid()%>" style="margin: 10px"></a>
												<%
															}
													}else{
														%>
												<a class="fa fa-sign-in" href="login.jsp"
													style="margin: 10px"></a> <a class="fa fa-exchange"
													style="margin: 10px"></a> <a class="fa fa-eye"
													href="product.jsp?pid=<%=p.getPid()%>" style="margin: 10px"></a>
												<%
													}
												}
												%>
											</div>
										</div>
										<%
											if(session!=null){
												if(session.getAttribute("user")!=null){
													boolean ch=cartDao.checkCart(p.getPid(), u.getUid());
													if(ch==true){
														%>
										<div class="add-to-cart">
											<a href="viewcart.jsp"><input type="submit"
												value="Go To Cart" class="add-to-cart-btn"></a>
										</div>
										<%
													}else{
														%>
										<div class="add-to-cart">
											<a
												href="addToCart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"><input
												type="submit" value="Add To Cart" class="add-to-cart-btn"></a>
										</div>
										<%
													}
												}else{
													%>
										<div class="add-to-cart">
											<a href="login.jsp"><input type="submit" value="Login"
												class="add-to-cart-btn"></a>
										</div>
										<%
											}
												}else{
													%>
										<div class="add-to-cart">
											<a href="login.jsp"><input type="submit" value="Login"
												class="add-to-cart-btn"></a>
										</div>
										<%
											}
											%>

									</div>
									<!-- /product -->

									<%
}
%>
								</div>
								<div id="slick-nav-2" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- /Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->


	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Top selling</h4>
						<div class="section-nav">
							<div id="slick-nav-3" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product07.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product08.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product09.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- product widget -->
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product02.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- product widget -->
						</div>
					</div>
				</div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Top selling</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product04.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product05.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product06.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- product widget -->
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product07.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product08.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product09.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- product widget -->
						</div>
					</div>
				</div>

				<div class="clearfix visible-sm visible-xs"></div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Top selling</h4>
						<div class="section-nav">
							<div id="slick-nav-5" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-5">
						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product02.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- product widget -->
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product04.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product05.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product06.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name">
										<a href="#">product name goes here</a>
									</h3>
									<h4 class="product-price">
										$980.00
										<del class="product-old-price">$990.00</del>
									</h4>
								</div>
							</div>
							<!-- product widget -->
						</div>
					</div>
				</div>

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
