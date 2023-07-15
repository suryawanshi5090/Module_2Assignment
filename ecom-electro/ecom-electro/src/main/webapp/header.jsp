<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Electro.in</title>
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
					<li><a href="#"><i class="fa fa-envelope-o"></i>
							email@email.com</a></li>
					<li><a href="#"><i class="fa fa-map-marker"></i> 1734
							Stonecoal Road</a></li>
				</ul>
				<ul class="header-links pull-right">
					<%
						UserBean u=null;
						if(session!=null){
							if(session.getAttribute("user")!=null){
								u=(UserBean)session.getAttribute("user");
								%>
					<li><a href="#"><i class="fa fa-home"></i> Welcome <b><%=u.getFname() %></b></a></li>
					<li><a href="myProfile.jsp"><i class="fa fa-user"></i> My
							Profile</a></li>
					<li><a href="contactUs.jsp"><i class="fa fa-address-book"></i>
							Contact Us</a></li>
					<li><a href="logout.jsp"><i class="fa fa-sign-out"></i>
							Logout</a></li>
					<%
							}else{
								%>
					<li><a href="contactUs.jsp"><i class="fa fa-address-book"></i>
							Contact Us</a></li>
					<li><a href="registration.jsp"><i class="fa fa-registered"></i>
							Registration</a></li>
					<li><a href="login.jsp"><i class="fa fa-sign-in"></i>
							Login</a></li>
					<%
							}
						}else{
							%>
					<li><a href="registration.jsp"><i class="fa fa-registered"></i>
							Registration</a></li>
					<li><a href="login.jsp"><i class="fa fa-sign-in"></i>
							Login</a></li>
					<%
						}
						%>

				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="#" class="logo"> <img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<%
if(session!=null){
	if(session.getAttribute("user")!=null){
		%>
					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">All Categories</option>
									<option value="1">Category 01</option>
									<option value="1">Category 02</option>
								</select> <input class="input" placeholder="Search here">
								<button class="search-btn">Search</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="wishList.jsp"> <i class="fa fa-heart-o"></i> <span>Your
										Wishlist</span>
									<div class="qty">
										<%
										if(session!=null){
											if(session.getAttribute("w_size")!=null){
												out.print(session.getAttribute("w_size"));
											}
										}
										%>
									</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a href="viewcart.jsp"> <i class="fa fa-shopping-cart"></i>
									<span>Your Cart</span>
									<div class="qty">
										<%
										if(session!=null){
											if(session.getAttribute("c_size")!=null){
												out.print(session.getAttribute("c_size"));
											}
										}
										%>
									</div>
								</a>
							</div>
							<!-- /Cart -->
							<%
	}
}
%>
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->
</body>
</html>