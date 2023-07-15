<%@page import="com.Dao.cartDao"%>
<%@page import="com.Dao.ProductDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.Dao.WishListDao"%>
<%@page import="com.bean.WishListBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--  Include File -->
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro WishList</title>
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



				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<h3>WishList</h3>
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">

									<%
									int uid=u.getUid();
									List<WishListBean> list1=WishListDao.userWishList(uid);
									for(WishListBean w:list1){
										ProductBean p=ProductDao.getProductById(w.getPid());
										%>

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<a href="product.jsp?pid=<%=p.getPid()%>"> <img
												src="Product_Images/<%=p.getImage() %>" alt="Image"
												style="width: 100%"></a>
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

	<br>
	<br>
	<br>
	<!-- Footer File include -->
	<%@include file="footer.jsp"%>
</body>
</html>