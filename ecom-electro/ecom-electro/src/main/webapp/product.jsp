<%@page import="com.Dao.cartDao"%>
<%@page import="com.Dao.WishListDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- header file include -->
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro Product</title>
</head>
<body>
	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<ul class="main-nav nav navbar-nav">
						<li><a href="index.jsp" style="color: red"><b>Home</b></a></li>
						<li><a href="filter.jsp?category=laptop">Laptops</a></li>
						<li><a href="filter.jsp?category=smartphone">Smartphones</a></li>
						<li><a href="filter.jsp?category=camera">Cameras</a></li>
						<li><a href="filter.jsp?category=accessories">Accessories</a></li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->
	<%
	// get product;
	int pid = Integer.parseInt(request.getParameter("pid"));
	ProductBean p = ProductDao.getProductById(pid);
	%>
	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- Product main img -->
				<div class="col-md-5 col-md-push-2">
					<div id="product-main-img">
						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>

						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>

						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>

						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>
					</div>
				</div>
				<!-- /Product main img -->

				<!-- Product thumb imgs -->
				<div class="col-md-2  col-md-pull-5">
					<div id="product-imgs">
						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>

						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>

						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>

						<div class="product-preview">
							<img src="Product_Images/<%=p.getImage()%>" alt="">
						</div>
					</div>
				</div>
				<!-- /Product thumb imgs -->

				<!-- Product details -->
				<div class="col-md-5">
					<div class="product-details">
						<h2 class="product-name"><%=p.getPname()%></h2>
						<div>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o"></i>
							</div>
							<a class="review-link" href="#">10 Review(s) | Add your
								review</a>
						</div>
						<div>
							<h3 class="product-price">
								Rs :
								<%=p.getPrice()%>/-
							</h3>
							<br>
						</div>
						<p><%=p.getPdisc()%></p>

						<div class="product-options"></div>
						<div class="product-options">
							<label> Size <select class="input-select">
									<option value="0">X</option>
							</select>
							</label> <label> Color <select class="input-select">
									<option value="0">Red</option>
							</select>
							</label>
						</div>

						<div class="add-to-cart">
							<div class="qty-label">
								Qty
								<div class="input-number">
									<input type="number" value="1"> <span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
								<br> <br>
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
								<a href="addToCart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"><input
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



						<ul class="product-links">
							<li><b>Category:</b></li>
							<li><a href="#"><%=p.getCategory()%></a></li>
						</ul>

						<ul class="product-links">
							<li>Share:</li>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-envelope"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- /Product details -->

				<!-- Product tab -->
				<div class="col-md-12">
					<div id="product-tab">
						<!-- product tab nav -->
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
							<li><a data-toggle="tab" href="#tab2">Details</a></li>
							<li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
						</ul>
						<!-- /product tab nav -->

						<!-- product tab content -->
						<div class="tab-content">
							<!-- tab1  -->
							<div id="tab1" class="tab-pane fade in active">
								<div class="row">
									<div class="col-md-12">
										<p><%=p.getPdisc()%></p>
									</div>
								</div>
							</div>
							<!-- /tab1  -->

							<!-- tab2  -->
							<div id="tab2" class="tab-pane fade in">
								<div class="row">
									<div class="col-md-12">
										<p><%=p.getPdisc()%></p>
									</div>
								</div>
							</div>
							<!-- /tab2  -->

							<!-- tab3  -->
							<div id="tab3" class="tab-pane fade in">
								<div class="row">
									<!-- Rating -->
									<div class="col-md-3">
										<div id="rating">
											<div class="rating-avg">
												<span>4.5</span>
												<div class="rating-stars">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star-o"></i>
												</div>
											</div>
											<ul class="rating">
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i>
													</div>
													<div class="rating-progress">
														<div style="width: 80%;"></div>
													</div> <span class="sum">3</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div style="width: 60%;"></div>
													</div> <span class="sum">2</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div></div>
													</div> <span class="sum">0</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
															class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div></div>
													</div> <span class="sum">0</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
															class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div></div>
													</div> <span class="sum">0</span>
												</li>
											</ul>
										</div>
									</div>
									<!-- /Rating -->

									<!-- Reviews -->
									<div class="col-md-6">
										<div id="reviews">
											<ul class="reviews">
												<li>
													<div class="review-heading">
														<h5 class="name">John</h5>
														<p class="date">27 DEC 2018, 8:0 PM</p>
														<div class="review-rating">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star-o empty"></i>
														</div>
													</div>
													<div class="review-body">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua</p>
													</div>
												</li>
												<li>
													<div class="review-heading">
														<h5 class="name">John</h5>
														<p class="date">27 DEC 2018, 8:0 PM</p>
														<div class="review-rating">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star-o empty"></i>
														</div>
													</div>
													<div class="review-body">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua</p>
													</div>
												</li>
												<li>
													<div class="review-heading">
														<h5 class="name">John</h5>
														<p class="date">27 DEC 2018, 8:0 PM</p>
														<div class="review-rating">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star-o empty"></i>
														</div>
													</div>
													<div class="review-body">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua</p>
													</div>
												</li>
											</ul>
											<ul class="reviews-pagination">
												<li class="active">1</li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
											</ul>
										</div>
									</div>
									<!-- /Reviews -->

									<!-- Review Form -->
									<div class="col-md-3">
										<div id="review-form">
											<form class="review-form">
												<input class="input" type="text" placeholder="Your Name">
												<input class="input" type="email" placeholder="Your Email">
												<textarea class="input" placeholder="Your Review"></textarea>
												<div class="input-rating">
													<span>Your Rating: </span>
													<div class="stars">
														<input id="star5" name="rating" value="5" type="radio"><label
															for="star5"></label> <input id="star4" name="rating"
															value="4" type="radio"><label for="star4"></label>
														<input id="star3" name="rating" value="3" type="radio"><label
															for="star3"></label> <input id="star2" name="rating"
															value="2" type="radio"><label for="star2"></label>
														<input id="star1" name="rating" value="1" type="radio"><label
															for="star1"></label>
													</div>
												</div>
												<button class="primary-btn">Submit</button>
											</form>
										</div>
									</div>
									<!-- /Review Form -->
								</div>
							</div>
							<!-- /tab3  -->
						</div>
						<!-- /product tab content  -->
					</div>
				</div>
				<!-- /product tab -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- Section -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-12">
					<div class="section-title text-center">
						<h3 class="title">Related Products</h3>
					</div>
				</div>
				<!--  get All Product -->
				<%
				String category=p.getCategory();
				List<ProductBean> list1 = ProductDao.getProductByCategory(category);
				for (ProductBean p1 : list1) {
				%>
				<!-- product -->
				<div class="col-md-3 col-xs-6">
					<div class="product">
						<div class="product-img">
							<a href="product.jsp?pid=<%=p.getPid()%>"> <img
								src="Product_Images/<%=p1.getImage()%>" alt="image"
								style="width: 100%; height: 6cm"></a>
							<div class="product-label">
								<span class="sale">-30%</span>
							</div>
						</div>
						<div class="product-body">
							<p class="product-category"><%=p1.getCategory()%></p>
							<h3 class="product-name">
								<a href="#"><%=p1.getPname()%></a>
							</h3>
							<h4 class="product-price">
								Rs.<%=p1.getPrice()%></h4>
							<div class="product-rating"></div>
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
								<a class="fa fa-sign-in" href="login.jsp" style="margin: 10px"></a>
								<a class="fa fa-exchange" style="margin: 10px"></a> <a
									class="fa fa-eye" href="product.jsp?pid=<%=p.getPid()%>"
									style="margin: 10px"></a>
								<%
													}
												}
												%>
							</div>
						</div>
						<div class="add-to-cart">
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
								<a href="addToCart.jsp?pid=<%=p.getPid()%>&uid=<%=u.getUid()%>"><input
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
					</div>
				</div>
				<!-- /product -->

				<%
				}
				%>


			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /Section -->

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
	<!-- include footer file -->
	<%@include file="footer.jsp"%>

</body>
</html>